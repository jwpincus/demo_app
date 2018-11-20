class MessagesController < ApplicationController

  def index
    fetch_success = MessageFetcher.messages!
    flash[:danger] = 'Something went wrong while getting new messages!' if !fetch_success 
    @messages = Message.all
  end

end
