module MessageReplier
  class AllSitesMessage < BaseMessage
    def reply
      sites = Site.enabled.pluck(:url).join(', ')
      bot.api.send_message(chat_id: chat.id, text: "to olhando esses sites aqui:\n#{sites}")
    end
  end
end
