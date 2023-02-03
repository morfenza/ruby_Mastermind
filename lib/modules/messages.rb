# frozen_string_literal: true

require 'colorize'

# Module to display messages
module Messages
  def welcome_message
    puts "\t\tWelcome! This is a mastermind game\n"

    display_how_to_play
    puts

    display_clues_explanation
    puts

    display_example
    puts
  end

  def display_options
    loop do
      puts <<~OPTIONS

        -> Press '1' if you want to be the codeBREAKER
        -> Press '2' if you want to be the codeMAKER

      OPTIONS
      option = gets.chomp.to_i
      return option if [1, 2].include?(option)

      puts 'Choose a valid option!'
    end
  end

  def display_victory
    puts "\n\tYou've won! You deciphred the code!\n"
  end

  def display_failure(code)
    puts "You've lost! The code was:\n"
    code.each { |num| print "#{color_number(num)}\s" }
    puts
  end

  def display_round(guess, clues)
    puts
    guess.each { |num| print "#{color_number(num)}\s" }
    print "\t Clues:"
    clues.sort.each { |clue| print "#{color_clue(clue)}\s" }
    puts "\n\n"
  end

  def display_how_to_play
    puts <<~RULES

      # How to play
        - 1-player game against the machine
        - Choose to be a code MAKER ou BREAKER
        - There are six color/number to choose from
        - The code maker will create a code using four color/number
        - There can be repeated colors/numbers
        - To win, the code breaker need to decipher the code in 12 rounds or less!

    RULES

    print "\t\t"
    (1..6).each { |num| print "#{color_number(num)}\s" }
  end

  def display_clues_explanation
    puts <<~CLUES

      # Clues
        - Red circle means you have 1 correct number in the correct location
        - White circle means you have 1 correct number, but in the wrong location

    CLUES
  end

  def display_example
    puts <<~EXAMPLE

      # Example
        - If the code is 1234 and the guess 1431 there will be 3 clues
        - 2 correct numbers in the correct location and 1 correct number in the wrong location

    EXAMPLE

    print "\t\t"
    [1, 4, 3, 1].each { |num| print "#{color_number(num)}\s" }
    print "\t Clues:"
    %w[red red white].each { |clue| print "#{color_clue(clue)}\s" }
    puts
  end

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
