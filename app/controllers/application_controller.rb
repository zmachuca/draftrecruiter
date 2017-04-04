class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def show
  	resume = Resume.find(params[:id])
  	if current_user.credits = 0
      flash[:success] = "Your Credit balance is zero. Submit more resumes for more Credits!"
    end
  end

  private
  
  def correct_user
      @post = current_user.posts.find_by(id: params[:id])
      redirect_to posts_path, notice: "Not authorized to edit this post" if @post.nil?
    end
end
