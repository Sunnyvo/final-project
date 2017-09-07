class HomeController < ApplicationController
  def index
    @idea = Idea.new
    @ideas = Idea.order('updated_at DESC')
    @idea_attachment = @idea.idea_attachments.build
  end
end
