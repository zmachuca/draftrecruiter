class ResumeMailer < ApplicationMailer
  default from: "support@jobfill.co"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.resume_mailer.resume_received.subject
  #
  def resume_received(resume)
    @resume = resume
    @post = @resume.post

    mail to: @post.user.email,
    		subject: "Jobfill: You have received a new Candidate for the #{@post.title} posting!"
  end
end
