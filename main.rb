# frozen_string_literal: true
require 'discordrb'
require 'dotenv/load'

bot = Discordrb::Bot.new token: ENV['BOT_TOKEN']
bot.register_application_command(:now, '現在時刻を取得するコマンド')

bot.application_command(:now) do |event|
  today = Time.now
  text = today.year.to_s + "/" + today.month.to_s + "/" + today.day.to_s + " " + today.hour.to_s + ":" + today.min.to_s + ":" + today.sec.to_s

  embed = Discordrb::Webhooks::Embed.new(
    title: '現在の時刻',
    description: text,
    color: 0xFFFFFF
  )
  event.respond(embeds: [embed])
end

bot.message(content: 'Ping!') do |event|
  event.respond 'Pong!'
end

bot.run