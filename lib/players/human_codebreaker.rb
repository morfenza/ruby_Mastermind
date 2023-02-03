# frozen_string_literal: true

require '../base/codebreaker'

# Class defining the human codebreaker
class HumanCodebreaker < Codebreaker
  def guess_code(guess)
    @guess = guess.split('').map(&:to_i)
  end
end
