class ReachesController < ApplicationController
  def new
    @reach = Reach.new
  end
  def create
    puts reach_params
    if current_user.reaches.where(idea_id: params[:reach][:idea_id]).count == 0
      reach = current_user.reaches.build reach_params
      puts params[:idea_id]

      if reach.save
      #  respond_to do |f|
      #    f.html{ redirect_back(fallback_location: root_path) }
      #   f.js { render 'reach' }
      else
        flash[:error] = "Error: #{reach.errors.full_messages.to_sentence}"
      end
    end
  end

  private
  def reach_params
    params.require(:reach).permit(:idea_id)
  end
end
