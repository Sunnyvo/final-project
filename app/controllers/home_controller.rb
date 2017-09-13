class HomeController < ApplicationController
  def index
    @idea = Idea.new
    @ideas =  Idea.order("updated_at DESC").page(1).per(2)
    @idea_attachment = @idea.idea_attachments.build
    @participate = Participate.new
  end
end
