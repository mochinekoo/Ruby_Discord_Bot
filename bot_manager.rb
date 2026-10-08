# frozen_string_literal: true
require 'discordrb'
require 'mysql2'

class BotManager

  @bot = Discordrb::Bot.new token: ENV['BOT_TOKEN']
  @client = Mysql2::Client.new(:host => ENV['DATABASE_HOST'], :username => ENV['DATABASE_USER'], :password => ENV['DATABASE_PASSWORD'], :database => ENV['DATABASE_NAME'])

  class << self
    attr_reader :bot
  end

  def self.init()
    @bot.register_application_command(:now, '現在時刻を取得するコマンド')
    @bot.register_application_command(:database, 'データベースの情報を取得するコマンド')

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

    @bot.application_command(:database) do |event|
      sql = "SELECT * FROM test;"
      statement = @client.prepare(sql)
      results = statement.execute()

      results.each do |row|
        puts row
        embed = Discordrb::Webhooks::Embed.new(
          title: '現在の時刻',
          description: row['id'].to_s + "," + row['name'].to_s,
          color: 0xFFFFFF
        )
        event.respond(embeds: [embed])
      end
    end

    @bot.message(content: 'Ping!') do |event|
      event.respond 'Pong!'
    end

    @bot.run
  end
end
