# frozen_string_literal: true

require '../players/human_codemaker'
require '../players/human_codebreaker'
require '../players/machine_codemaker'
require '../players/machine_codebreaker'
require '../modules/check'
require '../modules/messages'

# class defining the game logic
class Game
  include Check
  include Messages

  attr_reader :codemaker, :player

  def create_game
    @codemaker = Codemaker.new
    @player = Codebreaker.new

    codemaker.create_code
  end

  def play_match
    round_num = 1
    while round_num <= 12
      if play_round(round_num)
        display_victory
        return
      end
      round_num += 1
    end
    display_failure(codemaker.code)
  end

  def play_round(round_num)
    @player.guess_code(ask_for_guess(round_num))
    return true if @codemaker.won?(@player.guess)

    @codemaker.check_guess(@player.guess)
    display_round(@player.guess, @codemaker.clues)
    @codemaker.clues.clear
    false
  end
end
