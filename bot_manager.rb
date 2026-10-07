# frozen_string_literal: true

class BotManager

  @bot = Discordrb::Bot.new token: ENV['BOT_TOKEN']

  def self.init()
    @bot.register_application_command(:now, '現在時刻を取得するコマンド')

    @bot.application_command(:now) do |event|
      today = Time.now
      text = "#{today.year}/#{today.month}/#{today.day} #{today.hour}:#{today.min}:#{today.sec}"

      embed = Discordrb::Webhooks::Embed.new(
        title: '現在の時刻',
        description: text,
        color: 0xFFFFFF
      )
      event.respond(embeds: [embed])
    end

    @bot.message(content: 'Ping!') do |event|
      event.respond 'Pong!'
    end

    @bot.run
  end
end
