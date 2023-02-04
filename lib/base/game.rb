# frozen_string_literal: true

require_relative '../modules/check'
require_relative '../modules/messages'

# Class defining the game logic
class Game
  include Check
  include Messages

  attr_accessor :codemaker, :codebreaker

  def create_game(option)
    if option == 1
      self.codemaker = MachineCodemaker.new
      self.codebreaker = HumanCodebreaker.new
      codemaker.create_code
    else
      self.codemaker = HumanCodemaker.new
      self.codebreaker = MachineCodebreaker.new
      codemaker.create_code(ask_for_code)
    end
  end
end
