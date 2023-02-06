# frozen_string_literal: true

# Class defining the Codebreaker
class Codebreaker
  attr_accessor :guess

  def guess_code(guess)
    self.guess = guess.split('').map(&:to_i)
  end
end
