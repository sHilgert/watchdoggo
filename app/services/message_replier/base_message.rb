module MessageReplier
  class BaseMessage
    attr_reader :user, :text, :chat, :bot

    def initialize(message, bot)
      @user = message.from
      @text = message.text
      @chat = message.chat
      @bot = bot
      create_message
    end

    def reply
      raise NotImplementedError
    end

    def current_user
      @current_user ||= User.find_or_create_by(external_id: user.id, username: user.username)
    end

    private

    def create_message
      Message.create!(user: current_user, text: text, external_chat_id: chat.id)
    end
  end
end
