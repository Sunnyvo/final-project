class Idea < ApplicationRecord
  belongs_to :user, class_name: "User"
  has_many :idea_attachments
  accepts_nested_attributes_for :idea_attachments
  belongs_to :category
  belongs_to :type
  has_many :participates, dependent: :destroy
  has_many :joiners, through: :participates, source: "joiner"
  has_many :reaches
  has_and_belongs_to_many :hashtags
  has_many :likes, as: :item
  has_many :comments, dependent: :destroy
  validates :body,:title, presence: true
  after_create do
    puts "after created!"
    idea = Idea.find_by(id: self.id)
    listhashtags = self.body.scan(/#\w+/)
    listhashtags.uniq.map do |ht|
      hashtag = Hashtag.find_or_create_by(name: ht.downcase.delete('#'))
      idea.hashtags << hashtag
    end
  end

  before_update do
    idea = Idea.find_by(id: self.id)
    idea.hashtags.clear
    listhashtags.uniq.map do |ht|
      hashtag = Hashtag.find_or_create_by(name: ht.downcase.delete('#'))
      idea.hashtags << hashtag
    end
  end
  def idea_updated_at
    updated_at|| Time.new()
  end
  def self.generate_ideas(n = 5, user = nil)

    user ||= User.last
    n.times do
        b = nil
        loop do
          b = Behance::Client.new(access_token: ENV.fetch('API_BEHANCE_KEY')).collections.first["latest_projects"].first["covers"]
          if b
            a = b["404"]
          end
          break if b !=nil
        end
        idea = Idea.create!(
        title: Faker::Cat.breed,
        body: '#'+Faker::Job.field +  Faker::Hobbit.quote,
        need: Faker::Job.title,
        image_url: a,
        category_id: rand(1..5),
        type_id: rand(1..3),
        user: User.random_user,
      )
    end
  end

  def self.find_ideas_by_hashtag(hashtag)
    hashtag = Hashtag.find_by(name: hashtag)
    if hashtag!=nil
      return hashtag.ideas
    end
  end

  def image_url_or_photo
    if idea_attachments.first
      return idea_attachments.first.photo
    else
      image_url.presence||  "idea.jpg"
    end
  end
end
