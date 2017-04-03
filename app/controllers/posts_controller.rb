class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index]

  respond_to :html

  def index
    @posts = Post.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 10)
    if params[:search]
      @posts = Post.search(params[:search]).order("created_at DESC").paginate(:page => params[:page], :per_page => 10)
    else
      @posts = Post.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 10)
    end
  end

  def show
    respond_with(@post)
  end

  def new
    @post = current_user.posts.build
    respond_with(@post)
  end

  def edit
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to @post, notice: 'Congratulations! Your Job has been posted.'
    else
      render :new
    end
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Your Job Post was successfully updated'
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_url
  end

  private
    # Use callbacks to share common setup or contraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :requirement, :industry, :location)
    end
end
