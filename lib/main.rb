# frozen_string_literal: true

require_relative 'game_option1'
require_relative 'game_option2'
require_relative 'check'
require_relative 'messages'

# rubocop:disable Style/MixinUsage
include Messages
# rubocop:enable Style/MixinUsage

# Option 1: Human Codebreaker vs Machine Codemaker
# Option 2: Machine Codebreaker vs Human Codemaker

def game_loop
  loop do
    welcome_message
    if Check.ask_for_game_modes == 1
      game = GameOption1.new
      game.create_game
      game.play_match
    else
      #tba
    end

    break unless Check.play_again?
  end
end

game_loop