# frozen_string_literal: true

require_relative 'codemaker'

# Class defining the machine codemaker
class MachineCodemaker < Codemaker
  def create_code
    @code = Array.new(4) { rand(1..6) }
    super(code)
  end
end
