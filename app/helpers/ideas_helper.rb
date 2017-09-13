module IdeasHelper
  def display_likers(idea)
    idea.likes.map{|like| like.name_or_email}.to_sentence
  end
end
