module MessageReplier
  class WatchSiteMessage < BaseMessage
    def reply
      return invalid_format unless text.split.count == 2
      return http_missing unless text.split.second.downcase.include?('http')

      site.enable! unless site.enabled?
      associate_site_with_user
      bot.api.send_message(chat_id: chat.id, text: "deixa comigo! to de olho no #{site.url}")
    end

    private

    def http_missing
      bot.api.send_message(chat_id: chat.id, text: 'tá faltando por http nessa url aí')
    end

    def invalid_format
      bot.api.send_message(chat_id: chat.id, text: 'ei, ta errado esse formato ai, é /watch <url>')
    end

    def site
      @site ||= Site.find_or_create_by(url: text.split.second.downcase)
    end

    def associate_site_with_user
      return if current_user.sites.find_by(id: site.id).present?
      current_user.sites << site
    end
  end
end
