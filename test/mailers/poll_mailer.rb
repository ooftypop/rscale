require 'test_helper'

class PollMailerTest < ActionMailer::TestCase
  default :from => "no.response.rscale@gmail.com"

  # def welcome_email
  #   mail(:to => "other@elsewhere.com", :subject => "Test mail", :body => "Test mail body")
  # end
  test "poll_invite_email" do
    # Send the email, then test that it got queued
    email = UserMailer.create_invite('no.response.rscale@gmail.com',
                                     'friend@example.com', Time.now).deliver
    assert_not ActionMailer::Base.deliveries.empty?

    # Test the body of the sent email contains what we expect it to
    assert_equal ['no.response.rscale@gmail.com'], email.from
    assert_equal ['friend@example.com'], email.to
    assert_equal 'Invitation to vote', email.subject
    assert_equal read_fixture('poll_invite_email').join, email.body.to_s
  end
end


# PollMailerTest.poll_invite_email.deliver
# PollMailerTest.welcome_email.deliver
