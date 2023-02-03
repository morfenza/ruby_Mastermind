# frozen_string_literal: true

require_relative 'human_codemaker'
require_relative 'machine_codebreaker'
require_relative 'check'
require_relative 'messages'

# class defining the game logic
class GameOption2
  include Check
  include Messages

  attr_reader :codemaker, :codebreaker

  def create_game
    @codemaker = HumanCodemaker.new
    @codebreaker = MachineCodebreaker.new

    codemaker.create_code(ask_for_code)
  end

  def play_match
    round_num = 1
    while round_num <= 12
      if play_round(round_num)
        display_victory_for_machine
        return
      end
      round_num += 1
    end
    display_failure_for_machine
  end

  def play_round(round_num)
    @codemaker.guess_code(round_num, @codemaker.clues)
    return true if won?(@codemaker.guess)

    @codemaker.check_guess(@codemaker.guess)
    display_round(@codemaker.guess, @codemaker.clues)
    false
  end
end
