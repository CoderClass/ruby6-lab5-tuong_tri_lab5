class MessagesController < ApplicationController

  def index
    @messages = Message.all
  end

  def new
  	@message = Message.new
  end

  def create
  	@message = Message.new(message_params)
  	if @message.save
  		redirect_to messages_path
  	else
  		flash[:error] = "Erros: #{@message.errors.full_messages.to_sentence}"
  		render 'new'
  	end
  end

  private
  def message_params
  	params.require(:message).permit(:body)
  end

end
