# frozen_string_literal: true

require_relative 'codebreaker'
require_relative 'codemaker'
require_relative 'display'

# class defining the game logic
class Game
  include Display

  attr_reader :pc, :player

  def create_game
    @pc = Codemaker.new
    @player = Codebreaker.new

    pc.create_code
  end

  def play_match; end

  def play_round(round_num)
    player.guess_code(ask_for_guess(round_num))
    pc.check_guess(player.guess)
    display_round(player.guess, pc.clues)
    p pc
  end
end

g = Game.new
g.create_game
g.play_round(1)
