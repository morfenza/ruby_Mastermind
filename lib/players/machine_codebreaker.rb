# frozen_string_literal: true

require_relative '../base/codebreaker'

# Class defining the machine codebreaker
class MachineCodebreaker < Codebreaker
  attr_accessor :cur_num

  # rubocop:disable Lint/MissingSuper
  def initialize
    self.cur_num = 1
    self.guess = [1, 1, 1, 1]
  end
  # rubocop:enable Lint/MissingSuper

  def guess_code(round_num, clues)
    clues.clear
    self.guess = Array.new(4) { rand(1..6) }
  end
end
