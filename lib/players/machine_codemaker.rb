# frozen_string_literal: true

require '../base/codemaker'

# Class defining the machine codemaker
class MachineCodemaker < Codemaker
  def create_code
    @code = Array.new(4) { rand(1..6) }
    @code_hash = code.each_with_object(Hash.new(0)) do |num, hash|
      hash[num] += 1
    end
    @clues = []
  end
end
