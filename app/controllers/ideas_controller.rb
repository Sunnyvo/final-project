class IdeasController < ApplicationController
  before_action :set_idea, only: [:show, :edit, :update, :destroy]

  # GET /ideas
  # GET /ideas.json
  def index
    @idea = Idea.new
    @idea_attachment = @idea.idea_attachments.build
    @participate = Participate.new
    if params[:sort_by] =="view"
      @ideas = Idea.joins(:reaches).select("ideas.*, count(reaches.id) as reach_count").group("ideas.id").order("reach_count DESC").page(1).per(2)
    elsif params[:sort_by] =="comment"
      @ideas =  Idea.joins(:comments).select("ideas.*,count(comments.id) as comment_count").group("ideas.id").order("comment_count DESC").page(1).per(2)
    elsif params[:sort_by] =="join"
      @ideas =  Idea.joins(:participates).select("ideas.*,count(participates.id) as participate_count").group("ideas.id").order("participate_count DESC").page(1).per(2)
    else
      @ideas =  Idea.joins(:likes).select("ideas.*,count(likes.id) as like_count").group("ideas.id").order("like_count DESC").page(1).per(2)
    end
  end

  # GET /ideas/1
  # GET /ideas/1.json
  def show
    @comment = Comment.new
    if current_user.reaches.where(idea_id: @idea.id).count == 0
      reach = current_user.reaches.build idea: @idea
      if reach.save
      else
        flash[:error] = "Error: #{reach.errors.full_messages.to_sentence}"
      end
    end
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
      current_user.reaches.create idea: @idea
      respond_to do |f|
        f.html{ redirect_back(fallback_location: root_path) }
        f.js { render 'idea' }
      end

    else
      flash[:error] = "Error: #{@idea.errors.full_messages.to_sentence}"
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

  def paging
    @participate = Participate.new
    params[:per] ||= 2
    @ideas = Idea.order("updated_at DESC").page(params[:page]).per(params[:per])
    render partial: "idea", collection: @ideas, layout: false
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_idea
      @idea = Idea.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def idea_params
      params.require(:idea).permit(:title,:need, :body,:category_id,:type_id,idea_attachments_attributes: [:id, :idea_id, :photo])
    end
end
