# frozen_string_literal: true

# Module to help display messages on the console
module Check
  def ask_for_guess(round_num)
    puts "##{round_num}: Please write four numbers from 1 to 6 (1..6)"

    while true
      guess = gets.chomp
      break if valid_guess?(guess)

      puts 'Please, write a valid guess'
    end

    guess
  end

  def valid_guess?(guess)
    return false if guess.size > 4 || guess.size <= 0

    guess.split('').each do |num|
      return false if num.to_i > 6 || num.to_i < 1
    end

    true
  end
end
