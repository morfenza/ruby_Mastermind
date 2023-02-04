# frozen_string_literal: true

require_relative '../base/game'
require_relative '../players/human_codemaker'
require_relative '../players/machine_codebreaker'

# class defining the game logic
class GameOption2 < Game
  def play_match
    round_num = 1
    while round_num <= 12
      if play_round(round_num)
        display_victory_for_machine
        return
      end
      round_num += 1
      sleep(1)
    end
    display_failure_for_machine
  end

  def play_round(round_num)
    @codebreaker.guess_code(round_num, @codemaker.clues)
    return true if won?(@codemaker.code, @codebreaker.guess)

    @codemaker.check_guess(@codebreaker.guess)
    display_round(@codebreaker.guess, @codemaker.clues)
    false
  end
end
