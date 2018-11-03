module MessageReplier
  class AllSitesMessage < BaseMessage
    def reply
      sites = Site.enabled.pluck(:url).join('\n')
      bot.api.send_message(chat_id: chat.id, text: "to olhando esses sites aqui:\n#{sites}")
    end
  end
end
