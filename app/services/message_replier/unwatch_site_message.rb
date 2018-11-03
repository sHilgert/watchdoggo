module MessageReplier
  class UnwatchSiteMessage < BaseMessage
    def reply
      current_user.sites.delete(site)
      site.reload
      site.disable! if site.users.empty?
      bot.api.send_message(chat_id: chat.id, text: "pronto! parei de olhar o #{site.url} pra você")
    end

    private

    def site
      @site ||= Site.find_by(url: text.split.second.downcase)
    end
  end
end
