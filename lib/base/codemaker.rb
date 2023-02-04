# frozen_string_literal: true

# Class defining the Codemaker
class Codemaker
  attr_reader :code, :code_hash, :clues

  def create_code
    @clues = []
  end

  def check_guess(guess)
    red_pegs_number = count_red_pegs(guess)
    white_pegs_number = count_white_pegs(guess, red_pegs_number)

    # Add the clues
    red_pegs_number.times { @clues << 'red' }
    white_pegs_number.times { @clues << 'white' }
  end
end

def count_red_pegs(guess)
  # Count the numbers on the exact position
  pairs = @code.zip(guess)
  pairs.select { |pair| pair[0] == pair[1] }.count
end

def count_white_pegs(guess, red_pegs_number)
  # Count the number that appear regardless of position
  inexact_white_pegs = 0
  code_clone = @code.clone # If I passed @code, it would alter the original one!
  guess.each do |digit|
    # For each digit count one and remove to not count twice
    if code_clone.include?(digit)
      code_clone.delete_at(code_clone.index(digit)) # delete would remove ALL
      inexact_white_pegs += 1
    end
  end
  # The difference is the real white_pegs number
  inexact_white_pegs - red_pegs_number
end
