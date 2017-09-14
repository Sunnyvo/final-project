class HomeController < ApplicationController
  def index
    @idea = Idea.new
    if params[:sort_by] =="popular"
      @ideas = Idea.joins(:reaches).select("ideas.*, count(reaches.id) as reach_count, ideas.created_at").group("ideas.id").order("reach_count DESC, ideas.created_at").page(1).per(2)
    elsif params[:sort_by] =="champion"
      @ideas = [Idea.find(Reach.group(:idea_id).count.max_by{ |key, value| value}[0])]#// the idea have most reaches
    elsif params[:sort_by] =="recent"
      @ideas =  Idea.order("updated_at DESC").page(1).per(2)
    elsif params[:sort_by] =="follow"
      @ideas = Idea.where(user_id: Follow.where(user_id: current_user.id).select(:follower_id)).page(1).per(2)
    else
      @ideas =  Idea.order("updated_at DESC").page(1).per(2)
    end
    @idea_attachment = @idea.idea_attachments.build
    @participate = Participate.new
  end
end
