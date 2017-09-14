class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :omniauthable, :omniauth_providers => [:facebook]
  has_many :ideas, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :follows, dependent: :destroy
  has_many :followers, through: :follows
  has_many :participates
  has_many :likes, dependent: :destroy
  # has_many :joined_ideas, through: :participates, source: 'idea'
  has_many :joined_ideas, through: :participates, source: 'joined_idea'
  has_many :reaches
  has_many :comments, dependent: :destroy
  mount_uploader :avatar, AvatarUploader
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name   # assuming the user model has a name
      user.image_url = auth.info.image # assuming the user model has an image
      # If you are using confirmable and the provider(s) you use validate emails,
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end

  def image_url_or_default
    avatar.url|| image_url.presence || "idea.jpg"
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def self.generate_users(n = 5, gender = "female")
    url = "https://randomuser.me/api?results=#{n}&gender=#{gender}"
    body = HTTP.get(url).parse
    body["results"].each do |person|
      hash = {}
      hash[:name] = person["name"]["first"] + " " + person["name"]["last"]
      hash[:email] = person["email"]
      o = [('a'..'z'), ('A'..'Z')].map(&:to_a).flatten
      string = (0...10).map { o[rand(o.length)] }.join
      hash[:password] = string
      hash[:image_url] = person["picture"]["large"]
      User.create! hash
    end
  end

  def self.num_followedby(user)
    Follow.where(follower: user).count
  end

  def self.num_ideas(user)
    user.ideas.count
  end

  def self.num_joined_ideas(user)
    user.joined_ideas.count
  end

  def is_followed?(user)
    followers.include?(user)
  end

  def name_or_email
    name || email
  end

  def liking?(item)
    likes.where(item: item).exists?
  end

  def reaching?(idea)
    reaches.where(idea: idea).exists?
  end


  def toggle_like!(item)
    if like = likes.where(item: item).first
      like.destroy
    else
      likes.where(item: item).create!
    end
  end

  def self.autocomplete(name)
    User.where("name ILIKE ? ", "%#{name}%")
  end
end
