class UsersController < ApplicationController
  def profiles
    if params[:search]
      @users = User.autocomplete(params[:search])
      @ideas = Idea.find_ideas_by_hashtag(params[:search])
    else
      @users = User.all.limit(20)
    end
  end

  def search

    @users = User.autocomplete(params[:name])
    @ideas = Idea.find_ideas_by_hashtag(params[:name])
    puts "text:"
    puts @ideas
    respond_to do |format|
      format.json
    end
  end

  def show
    @user = User.find_by(id: params[:id] )
  end
end
