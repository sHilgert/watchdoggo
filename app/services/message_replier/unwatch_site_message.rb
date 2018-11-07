module MessageReplier
  class UnwatchSiteMessage < BaseMessage
    def reply
      return invalid_format unless text.split.count == 2
      return could_not_find unless site.present?
      
      current_user.sites.delete(site)
      site.reload
      site.disable! if site.users.empty?
      bot.api.send_message(chat_id: chat.id, text: "pronto! parei de olhar o #{site.url} pra você")
    end

    private

    def could_not_find
      bot.api.send_message(chat_id: chat.id, text: 'vish, muita treta, não achei esse site, digita /sites')
    end

    def invalid_format
      bot.api.send_message(chat_id: chat.id, text: 'ei, ta errado esse formato ai, é /unwatch <url>')
    end

    def site
      @site ||= current_user.sites.find_by(url: text.split.second.downcase)
    end
  end
end
