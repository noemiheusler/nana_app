class MessagesController < ApplicationController
  before_action do
     @conversation = Conversation.find(params[:conversation_id])
  end

  def index
    @conversation = policy_scope(Conversation).find(params[:conversation_id])
    @messages = @conversation.messages

    # @messages = policy_scope(Message) # Message.all
    
    if @messages.length > 50
      @over_ten = true
      @messages = @messages[-50..-1]
    end
    
    @message = @conversation.messages.new
  end
  
  def new
    @message = @conversation.messages.new
  end

  def create
    @message = @conversation.messages.new(message_params)
    authorize @message
    if @message.save
      respond_to do |format|
        format.html { redirect_to conversation_messages_path(@conversation) }
        format.js  # <-- will render `app/views/messages/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { redirect_to conversation_messages_path(@conversation) }
        #format.html { render 'conversation/index' }
        format.js  # <-- idem
      end
    end

  end

  private

  def message_params
    params.require(:message).permit(:body, :user_id, :created_at)
  end
end
