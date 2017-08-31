class HomeController < ApplicationController
  def index
    @idea = Idea.new
    @ideas = Idea.all
  end
end
