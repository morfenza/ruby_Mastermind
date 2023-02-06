# frozen_string_literal: true

require_relative '../base/codebreaker'

# Class defining the machine codebreaker
class MachineCodebreaker < Codebreaker
  # rubocop:disable Lint/MissingSuper
  def initialize
    @digit = 1
    @guess = Array.new(4, @digit)
    @ans = []
    @permutated = false
    @all_combinations = []
  end
  # rubocop:enable Lint/MissingSuper

  def guess_code(_round_num, clues)
    # If we know all 4 numbers, we will find all combinations and try them
    return try_possibilities(clues) if @ans.size == 4

    # While we don't know the 4 numbers, we keep checking
    #
    #   - there is need for repetition of the guard clause
    #     because of the way the first guess works
    #
    #     - this prevents a bug where on round is wasted!
    check_feedback(clues)
    return try_possibilities(clues) if @ans.size == 4

    clues.clear
    @digit += 1
    @guess = Array.new(4, @digit)
  end

  def permute_ans
    @all_combinations = []
    @ans.permutation(4) { |permutation| @all_combinations << permutation }
    @all_combinations = @all_combinations.uniq
    @permutated = true
  end

  def try_possibilities(clues)
    permute_ans if @permutated == false
    clues.clear
    @guess = @all_combinations.delete(@all_combinations.sample)
  end

  def check_feedback(clues)
    return if clues.empty?

    clues.size.times { @ans << @digit }
  end
end