require 'rails_helper'

RSpec.feature "User can", type: :feature do
  scenario "view coke only messages" do
    visit coke_path
    page.all(".message").count.should eql(5)
    if Message.count > 0
      expect(page).to have_content(Message.first.message)
      expect(page).to have_content(Message.last.message)
      expect(page).to have_content('% of messages have coke mentioned')
    end # we are actively calling the api on every test, it should be stubbed out. It isn't. Therefore when the database cleaner cleans up and a test is run with the API returning an error, this is necessary. Consider adding VCR gem to stub API responses
  end
end
