class ParticipatesController < ApplicationController
  def new
    @participate = Participate.new
  end
  def create
    @participate = Participate.new participate_params
    puts "hey1"
    if @participate.save
      puts "hey2"
      respond_to do |f|
        f.html{ redirect_back(fallback_location: root_path) }
        f.js { render 'participate' }
      end

    else
      flash[:error] = "Error: #{@participate.errors.full_messages.to_sentence}"

    end
  end

  private
    def participate_params
      params.require(:participate).permit(:user_id ,:idea_id ,:details,:skills)
    end
end
