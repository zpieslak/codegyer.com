class MessagesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create
  caches_page :new, :success

  def new
    @title = "Contact our Ruby on Rails team"
    @message = Message.new
  end

  def create
    @title = "Contact our Ruby on Rails team"
    @message = Message.new(message_params)

    if @message.save
      MessageMailer.new_message_email(@message).deliver
      redirect_to action: "success"
    else
      render action: "new"
    end
  end

  def success
    @title = "Thank you, we will respond to you shortly"
    @noindex = true
  end

  private
    def message_params
      params.require(:message).permit(:name, :email, :content)
    end
end
