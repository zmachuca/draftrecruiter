class ResumesController < ApplicationController

	def new
    @resume = Resume.new
    @post = Post.find(params[:post_id])
  end

	def create
    @resume = Resume.new(resume_params)
    @resume.user_id = current_user.id
    @resume.post_id = params[:post_id]
    if @resume.save 
      redirect_to :root
    end
  end

  def inbox
    @resumes = current_user.incoming_resumes.order("created_at DESC")
    end

  private

  def resume_params
      params.require(:resume).permit(:document)
    end

end
