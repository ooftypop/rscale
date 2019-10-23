require 'rails_helper'

RSpec.describe Poll, type: :model do
  before(:all) do
    @poll = create(:poll)
  end

  it "is valid with valid attributes" do
    expect(@poll).to be_valid
  end

  it "is not valid without a title" do
    @poll.description = nil
    expect(@poll).to be_valid
  end

  it "is not valid without a description" do
    @poll.title = nil
    expect(@poll).to_not be_valid
  end
end
