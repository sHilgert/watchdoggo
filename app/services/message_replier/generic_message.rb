module MessageReplier
  class GenericMessage < BaseMessage
    def reply
      bot.api.send_message(chat_id: chat.id, text: 'nao entendi nem um pouco direito')
    end
  end
end
