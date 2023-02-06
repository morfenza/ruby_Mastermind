# frozen_string_literal: true

require 'bundler/setup'

require_relative 'game_options/game_option1'
require_relative 'game_options/game_option2'
require_relative 'modules/check'
require_relative 'modules/messages'

# rubocop:disable Style/MixinUsage
include Messages
# rubocop:enable Style/MixinUsage

# Option 1: Human Codebreaker vs Machine Codemaker
# Option 2: Machine Codebreaker vs Human Codemaker

def game_loop
  loop do
    welcome_message
    option = Check.ask_for_game_modes
    game = option == 1 ? GameOption1.new : GameOption2.new
    game.create_game(option)
    game.play_match

    break unless Check.play_again?
  end
end

game_loop
