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
      idea = idea.create(
        title: Faker::Cat.breed,
        body: Faker::Hobbit.quote,
      )
    end
  end


end
