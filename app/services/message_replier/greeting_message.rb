module MessageReplier
  class GreetingMessage < BaseMessage
    def reply
      bot.api.send_message(chat_id: chat.id, text: I18n.t('greetings'))
    end
  end
end
