# frozen_string_literal: true

require_relative 'codemaker'

# Class defining the human codemaker
class HumanCodemaker < Codemaker
  def create_code(code)
    @code = code.split('').map(&:to_i)
    super(@code)
  end
end
