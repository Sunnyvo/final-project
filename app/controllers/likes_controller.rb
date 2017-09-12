class LikesController < ApplicationController

  def toggle
    if params[:idea_id]
      @item = Idea.find params[:idea_id]
     elsif params[:comment_id]
      @item = Comment.find(params[:comment_id])
    end
    current_user.toggle_like!(@item)

    respond_to do |f|
      f.html{ redirect_back(fallback_location: root_path) }
      f.js { render 'toggle' }
    end
  end
end
