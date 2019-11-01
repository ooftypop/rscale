class PollMailerPreview < ActionMailer::Preview
  def poll_invite_email
    @user = User.first
    @poll = Poll.first
    @url  = "testing"
    PollMailer.poll_invite_email(@user, @poll)
  end
end