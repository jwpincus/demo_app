require 'rails_helper'

RSpec.describe Message, type: :model do
  it "should be valid with API data" do
    expect(Message.create(
      external_created_at: "2012-12-07T16:55:45Z",
      user_followers: 3,
      user_id: 16,
      message: "Hi there",
      sentiment: 0,
      user_handle: "@idiot"
      )).to be_valid
  end
  it {should validate_presence_of(:external_created_at)}
  it {should validate_presence_of(:user_followers)}
  it {should validate_presence_of(:user_id)}
  it {should validate_presence_of(:message)}
  it {should validate_presence_of(:sentiment)}
  it {should validate_presence_of(:user_handle)}
  it { should validate_uniqueness_of(:message)
    .scoped_to(:user_handle, :external_created_at) }
end
# it { should validate_uniqueness_of(:keyword) }
# it { should validate_uniqueness_of(:keyword).with_message(/dup/) }
# it { should validate_uniqueness_of(:email).scoped_to(:name) }
# it { should validate_uniqueness_of(:email).
#               scoped_to(:first_name, :last_name) }
# it { should validate_uniqueness_of(:keyword).case_insensitive }
#
# it { should validate_presence_of(:name) }
# it { should validate_presence_of(:name).
#               with_message(/is not optional/) }
#
# it { should validate_numericality_of(:age) }
#
# it { should validate_format_of(:name).
#               with('12345').
#               with_message(/is not optional/) }
# it { should validate_format_of(:name).
#               not_with('12D45').
#               with_message(/is not optional/) }
