# frozen_string_literal: true

require_relative 'human_codebreaker'
require_relative 'machine_codemaker'
require_relative 'check'
require_relative 'messages'

# class defining the game logic
class GameOption1
  include Check
  include Messages

  attr_reader :codemaker, :codebreaker

  def create_game
    @codemaker = MachineCodemaker.new
    @codebreaker = HumanCodebreaker.new

    codemaker.create_code
  end

  def play_match
    round_num = 1
    while round_num <= 12
      if play_round(round_num)
        display_victory_for_player
        return
      end
      round_num += 1
    end
    display_failure_for_player(codemaker.code)
  end

  def play_round(round_num)
    @codebreaker.guess_code(ask_for_guess(round_num))
    return true if won?(@codemaker.code, @codebreaker.guess)

    @codemaker.check_guess(@codebreaker.guess)
    display_round(@codebreaker.guess, @codemaker.clues)
    @codemaker.clues.clear
    false
  end
end
