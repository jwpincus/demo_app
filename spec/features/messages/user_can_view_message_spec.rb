require 'rails_helper'

RSpec.feature "User can", type: :feature do
  scenario "view message specifics" do
    message = create(:message)
    visit messages_path
    click_on(message.message)
    expect(page).to have_current_path(message_path(message))
    expect(page).to have_content(message.sentiment)
    expect(page).to have_content(message.user_handle)
  end
end
