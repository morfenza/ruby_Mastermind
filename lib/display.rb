# frozen_string_literal: true

require 'colorize'

# Module to help display messages on the console
module Display
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

  def display_round(guess, clues)
    puts
    guess.each { |num| print "#{color_number(num)}\s" }
    print "\t Clues:"
    clues.sort.each { |clue| print "#{color_clue(clue)}\s" }
    puts "\n\n"
  end

  def display_examples
    puts
    (1..6).each { |num| print "#{color_number(num)}\s" }
    print "\t Clues:"
    %w[red red white white].each { |clue| print "#{color_clue(clue)}\s" }
    puts
  end

  def display_victory(); end

  def display_failure(); end

  def color_clue(clue)
    case clue
    when 'red'
      ' ● '.colorize(color: :red)
    when 'white'
      ' ● '.colorize(color: :white)
    end
  end

  # rubocop:disable Metrics/MethodLength
  def color_number(num)
    case num
    when 1
      ' 1 '.colorize(color: :black, background: :light_red)
    when 2
      ' 2 '.colorize(color: :black, background: :light_blue)
    when 3
      ' 3 '.colorize(color: :black, background: :light_green)
    when 4
      ' 4 '.colorize(color: :black, background: :light_yellow)
    when 5
      ' 5 '.colorize(color: :black, background: :light_magenta)
    when 6
      ' 6 '.colorize(color: :black, background: :light_cyan)
    end
  end
  # rubocop:enable Metrics/MethodLength
end
