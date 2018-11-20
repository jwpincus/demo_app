class MessagesController < ApplicationController

  def index
    fetch_success = MessageFetcher.messages!
    flash[:danger] = 'Something went wrong while getting new messages!' if !fetch_success
    @messages = Message.all
  end

  def coke
    fetch_success = MessageFetcher.messages!
    flash[:danger] = 'Something went wrong while getting new messages!' if !fetch_success
    @messages = Message.coke_messages.order(sentiment: :desc)
    render :index
  end

  def show
    @message = Message.find(params[:id])
  end

end
