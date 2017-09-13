class UsersController < ApplicationController
  def profiles
    if params[:search]
      @users = User.where("name ILike ?","%#{params[:search]}%")
    else
      @users = User.all
    end
  end
  
  def search
    @users = User.autocomplete(params[:name])
    respond_to do |format|
      format.json
    end
  end

  def show
    @user = User.find_by(id: params[:id] )
  end
end
