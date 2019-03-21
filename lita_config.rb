require 'dotenv/load'

require './handlers/hello.rb'

Lita.configure do |config|
  config.robot.name = "Lita"
  config.robot.log_level = :info

  config.robot.adapter = :telegram_plus
  config.adapters.telegram_plus.token = ENV['TELEGRAM_TOKEN']

  if ENV['REDISTOGO_URL']
    config.redis[:url] = ENV['REDISTOGO_URL']
  end

  if ENV['PORT']
    config.http.port = ENV['PORT']
  end
end
