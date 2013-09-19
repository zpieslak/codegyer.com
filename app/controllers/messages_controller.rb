class MessagesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create
  caches_page :new, :success

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)

    if @message.save
      MessageMailer.new_message_email(@message).deliver
      redirect_to action: "success"
    else
      render action: "new"
    end
  end

  def success
  end

  private
    def message_params
      params.require(:message).permit(:name, :email, :content)
    end
end
