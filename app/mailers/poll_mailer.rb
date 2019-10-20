class PollMailer < ActionMailer::Base
  default from: 'no.response.rscale@gmail.com'
  layout 'mailer'

  def poll_invite_email(user, poll)
    @user = user
    @poll = poll
    @url  = ''
    mail(to: @user.email, subject: 'Invitation to vote')
  end
end
