# FactoryBot.define do
#   factory :poll_option, class: PollOption do
#     title {"Poll option title 1"}
#     description {"Poll option description 1"}
#     association :user, factory: :owner
#     association :poll, factory: :poll_option_poll
#
#     factory :owner, class: User do
#       sequence(:email) { |n| "testpolloption#{n}@example.com"}
#       password {'password'}
#     end
#
#     factory :poll_option_poll, class: Poll do
#       sequence(:title) { |n| "testtitle#{n}"}
#     end
#   end
# end
