class PostsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create]

  def new
    @post = Post.new
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end


  def create
    @post = current_user.posts.build(post_params)
    
    if @post.save
      redirect_to posts_path, notice: '投稿が完了しました。'
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  private
  def post_params
    params.require(:post).permit(:content, :photo)
  end
end