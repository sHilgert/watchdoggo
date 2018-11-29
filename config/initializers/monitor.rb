# require 'telegram/bot'
# require 'http'
#
# Thread.new do
#   Rails.application.executor.wrap do
#     while true
#       Site.enabled.find_each do |site|
#         begin
#           res = HTTP.get(site.url)
#           if res.code >= 400
#             Response.create!(site: site, http_code: res.code)
#             site.users.find_each do |user|
#               Telegram::Bot::Api.new(Settings.telegram_token).send_message(
#                 chat_id: user.external_id,
#                 text: "ixi, deu treta no #{site.url}, CODE: #{res.code}"
#               )
#             end
#           end
#         rescue StandardError => error
#           Rails.logger.error(error.to_s)
#         end
#       end
#       sleep(1.minute)
#     end
#   end
# end
