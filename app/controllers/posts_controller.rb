class PostsController < ApplicationController
  def index
    @posts = Post.order('created_at DESC')
  end
  def show
  end
  def new
    if user_signed_in?
    @post = Post.new
    else
    redirect_to new_user_session_path
    end
  end
  def create
    @post = Post.create(post_text: post_params[:post_text], user_id: current_user.id )
    redirect_to root_path
  end
  def show
    @post = Post.find(params[:id])
  end
  def destroy
    post = Post.find(params[:id])
    post.destroy if current_user.id == post.user_id
    redirect_to root_path
  end
  def edit
    @post = Post.find(params[:id])
  end
  def update
    post = Post.find(params[:id])
    post = post.update(post_params) if current_user.id == post.user_id
    redirect_to root_path
  end

  private
  def post_params
    params.require(:post).permit(:post_text)
  end
end
