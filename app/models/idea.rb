class Idea < ApplicationRecord
  belongs_to :user, class_name: "User"
  has_many :idea_attachments
  accepts_nested_attributes_for :idea_attachments
  belongs_to :category;
  belongs_to :type;

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
