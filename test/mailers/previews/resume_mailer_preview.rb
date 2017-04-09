# Preview all emails at http://localhost:3000/rails/mailers/resume_mailer
class ResumeMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/resume_mailer/resume_received
  def resume_received
  	resume = Resume.last
    ResumeMailer.resume_received(resume)
  end

end
