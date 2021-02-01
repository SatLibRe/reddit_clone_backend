class PostsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    posts = Post.all 
    render json: posts
  end

  def create 
    post = Post.new(post_params)
    if post.save
      flash[:message] = "post successfully created"
      session[:post_id] = post.id
    else
      puts post.errors.full_messages
    end
  end 

  def edit 
    post = Post.find(params[:id])
    render json: post
  end 

  def update
    post = Post.find(params[:id])
    post.update(post_params)
  end

  def show 
    post = Post.find(params[:id])
    render json: post
  end 

  def destroy 
    post = Post.find(params[:id])
    post.delete()
  end 

  private 

  def post_params 
    params.require(:post).permit(:title, :body, :likecount, :user_id )
  end 
end

