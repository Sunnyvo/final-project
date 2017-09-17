class UsersController < ApplicationController
  def searchresult
    @participate = Participate.new
    if params[:search]
      @users = User.autocomplete(params[:search])
      @ideas = Idea.find_ideas_by_hashtag(params[:search])
    else
      @users = User.all.limit(5)
    end
  end

  # def profile
  #   @ideas = [Idea.find(Reach.group(:idea_id).count.max_by{ |key, value| value}[0])]
  # end

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
    @idea = Idea.new
    @idea_attachment = @idea.idea_attachments.build
    @participate = Participate.new
    @user = User.find_by(id: params[:id] )
    @ideas = @user.ideas.order("updated_at DESC")
  end
end
