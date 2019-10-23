require 'rails_helper'

RSpec.describe Group, type: :model do
  before(:all) do
    @group = create(:group)
  end

  it "is valid with valid attributes" do
    expect(@group).to be_valid
  end

  it "is not valid without a description" do
    @group.description = nil
    expect(@group).to be_valid
  end

  it "is not valid without a title" do
    @group.title = nil
    expect(@group).to_not be_valid
  end
end
