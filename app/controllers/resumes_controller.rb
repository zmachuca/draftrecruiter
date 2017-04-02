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
      current_user.credits = current_user.credits + 1
      current_user.save!
      redirect_to :root
    end
  end

  def show
    resume = Resume.find(params[:id])
    if current_user.credits > 0
      current_user.credits = current_user.credits - 1
      current_user.save!
      Unlock.create(user_id: current_user.id, resume_id: resume.id)
      send_file resume.document.path.split('?')[0], :filename => "resume.pdf", :type => "application/pdf", :disposition => "attachment"
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
