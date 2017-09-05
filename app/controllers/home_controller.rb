class HomeController < ApplicationController
  def index
    @idea = Idea.new
    @ideas = Idea.order('updated_at DESC')
  end
end
