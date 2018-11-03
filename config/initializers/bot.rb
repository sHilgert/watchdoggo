require 'telegram/bot'

Thread.new do
  Telegram::Bot::Client.run(Settings.telegram_token) do |bot|
    bot.listen do |message|
      MessageReplier::Factory.for(message, bot).reply
    end
  end
end
