# frozen_string_literal: true

require 'discordrb'
require 'dotenv/load'
require 'libui'
require_relative 'bot_manager'

def main
  BotManager.init
end

main if __FILE__ == $PROGRAM_NAME
