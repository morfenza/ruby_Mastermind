# frozen_string_literal: true

# Class defining the Codemaker
class Codemaker
  attr_reader :code, :code_hash, :clues

  def create_code
    @code = Array.new(4) { rand(1..6) }
    @code_hash = code.each_with_object(Hash.new(0)) do |num, hash|
      hash[num] += 1
    end
    @clues = []
  end

  def check_guess(guess)
    aux = Hash.new(0)

    guess.each_with_index do |num, idx|
      aux[num] += 1
      if aux[num] > @code_hash[num] || !@code_hash.include?(num)
        @clues << 'none'
        next
      end

      @clues.push(@code[idx] == num ? 'red' : 'white')
    end
  end
end
