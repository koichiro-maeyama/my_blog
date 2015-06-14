class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  def new
    @post = Post.new
  end
  def show
    #@post = Post.find(params[:id])
  end
  def index
    @posts = Post.all
  end
  def create
    #フォームからデータを受け取る
    @post = Post.new(post_params)
    @post.save
    #show.html.erbに飛ばす
    redirect_to "/posts/#{@post.id}"
  end
  def edit
    #@post = Post.find(params[:id])
  end
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end



  def update
    @post = Post.find(params[:id])
    @post.update_attributes(post_params)
    redirect_to "/posts/#{@post.id}"
  end

  private
  def set_post
   @post = Post.find(params[:id])
 end
  def post_params
    # params.require(:key).permit(:filter)
    params.require(:post).permit(
      :title,
      :body,
      :category
      )
  end

end
