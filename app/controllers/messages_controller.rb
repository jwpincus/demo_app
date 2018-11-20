class MessagesController < ApplicationController

  def index
    @messages = MessageFetcher.messages
  end

end
