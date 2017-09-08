class IdeasController < ApplicationController
  before_action :set_idea, only: [:show, :edit, :update, :destroy]

  # GET /ideas
  # GET /ideas.json
  def index
    @ideas = Idea.order('updated_at DESC')
  end

  # GET /ideas/1
  # GET /ideas/1.json
  def show
  end

  # GET /ideas/new
  def new
    @idea = Idea.new
    @idea_attachment = @idea.idea_attachments.build
  end

  # GET /ideas/1/edit
  def edit
  end

  # POST /ideas
  # POST /ideas.json
  def create
    @idea = current_user.ideas.build idea_params
    if @idea.save
      if params[:idea_attachments]
        params[:idea_attachments][:photo].each do |a|
          @idea_attachment = @idea.idea_attachments.create!(photo: a)
        end
      end

      respond_to do |f|
        f.html{ redirect_back(fallback_location: root_path) }
        f.js { render 'idea' }
      end

    else
      flash[:error] = "Error: #{@comment.errors.full_messages.to_sentence}"
      # format.html { redirect_to @idea, notice: 'Idea was successfully created.' }
      # format.json { render :show, status: :created, location: @idea }
      # format.html { render :new }
      # format.json { render json: @idea.errors, status: :unprocessable_entity }
    end

  end

  # PATCH/PUT /ideas/1
  # PATCH/PUT /ideas/1.json
  def update
    respond_to do |format|
      if @idea.update(idea_params)
        format.html { redirect_to @idea, notice: 'Idea was successfully updated.' }
        format.json { render :show, status: :ok, location: @idea }
      else
        format.html { render :edit }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ideas/1
  # DELETE /ideas/1.json
  def destroy
    @idea.destroy
    respond_to do |format|
      format.html { redirect_to ideas_url, notice: 'Idea was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_idea
      @idea = Idea.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def idea_params
      params.require(:idea).permit(:title, :body,idea_attachments_attributes: [:id, :idea_id, :photo])
    end
end
