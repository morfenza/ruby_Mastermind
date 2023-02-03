# frozen_string_literal: true

require_relative 'codebreaker'

# Class defining the machine codebreaker
class MachineCodebreaker < Codebreaker
  attr_accessor :cur_num

  # rubocop:disable Lint/MissingSuper
  def initialize
    self.cur_num = 1
    self.guess = [1, 1, 1, 1]
  end
  # rubocop:enable Lint/MissingSuper

  def guess_code(round_num, clues); end
end
