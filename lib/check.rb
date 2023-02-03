# frozen_string_literal: true

# Module to help check conditions
module Check
  def self.ask_for_game_modes
    puts <<~OPTIONS

      -> Press '1' if you want to be the codeMAKER
      -> Press '2' if you want to be the codeBREAKER

    OPTIONS

    loop do
      option = gets.chomp.to_i
      return option if [1, 2].include?(option)

      puts 'Choose a valid option!'
    end
  end

  def self.play_again?
    puts "\nPlay again? (y/n)"

    return true if gets.chomp.downcase == 'y'
  end

  def ask_for_guess(round_num)
    puts "##{round_num}: Please write four numbers from 1 to 6 (1..6)"

    input_loop
  end

  def ask_for_code
    puts 'Please write four numbers from 1 to 6 (1..6), it will the master code!'

    input_loop
  end

  def valid_input?(input)
    return false if input.size > 4 || input.size <= 0

    input.split('').each do |num|
      return false if num.to_i > 6 || num.to_i < 1
    end

    true
  end

  def input_loop
    loop do
      input = gets.chomp
      return input if valid_input?(input)

      puts 'Please, write a valid input'
    end
  end

  def won?(code, guess)
    guess.eql?(code)
  end
end
