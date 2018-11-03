module MessageReplier
  class Factory
    def self.for(message, bot)
      case message.text.split.first
      when '/start'
        MessageReplier::GreetingMessage.new(message, bot)
      when '/watch'
        MessageReplier::WatchSiteMessage.new(message, bot)
      when '/sites'
        MessageReplier::AllSitesMessage.new(message, bot)
      when '/unwatch'
        MessageReplier::UnwatchSiteMessage.new(message, bot)
      else
        MessageReplier::GenericMessage.new(message, bot)
      end
    end
  end
end
