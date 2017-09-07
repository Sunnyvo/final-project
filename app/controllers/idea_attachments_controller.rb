class IdeaAttachmentsController < ApplicationController
  before_action :set_idea_attachment, only: [:show, :edit, :update, :destroy]

  # GET /idea_attachments
  # GET /idea_attachments.json
  def index
    @idea_attachments = IdeaAttachment.all
  end

  # GET /idea_attachments/1
  # GET /idea_attachments/1.json
  def show
  end

  # GET /idea_attachments/new
  def new
    @idea_attachment = IdeaAttachment.new
  end

  # GET /idea_attachments/1/edit
  def edit
  end

  # POST /idea_attachments
  # POST /idea_attachments.json
  def create
    @idea_attachment = IdeaAttachment.new(idea_attachment_params)

    respond_to do |format|
      if @idea_attachment.save
        format.html { redirect_to @idea_attachment, notice: 'Idea attachment was successfully created.' }
        format.json { render :show, status: :created, location: @idea_attachment }
      else
        format.html { render :new }
        format.json { render json: @idea_attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /idea_attachments/1
  # PATCH/PUT /idea_attachments/1.json
  def update
    respond_to do |format|
      if @idea_attachment.update(idea_attachment_params)
        format.html { redirect_to @idea_attachment, notice: 'Idea attachment was successfully updated.' }
        format.json { render :show, status: :ok, location: @idea_attachment }
      else
        format.html { render :edit }
        format.json { render json: @idea_attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /idea_attachments/1
  # DELETE /idea_attachments/1.json
  def destroy
    @idea_attachment.destroy
    respond_to do |format|
      format.html { redirect_to idea_attachments_url, notice: 'Idea attachment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_idea_attachment
      @idea_attachment = IdeaAttachment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def idea_attachment_params
      params.require(:idea_attachment).permit(:idea_id, :photo)
    end
end
