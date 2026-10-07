# frozen_string_literal: true

require 'discordrb'
require 'dotenv/load'
require 'libui'
require_relative 'bot_manager'
require_relative 'window_manager'

def main
  windowThread = Thread.new do
    WindowManager.init if ENV['WINDOW_MODE']
  end

  BotManager.init
end

main if __FILE__ == $PROGRAM_NAME
