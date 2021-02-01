class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token


  
  def index
    users = User.all 
    render json: users.to_json(include: [:posts])
  end

  def create 
    user = User.create(userParams)
    render json: user
  end 

  def show 
    user = User.find(params[:id])
    render json: User
  end 

  def destroy 
    user = User.find(params[:id])
    user.delete()
  end 

  private 

  def user_params 
    params.require(:user).permit(:username)
  end 
end
