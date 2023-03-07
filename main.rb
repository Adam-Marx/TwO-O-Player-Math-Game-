require './player'
require './question'

puts 'Player 1: Enter your desired name'
player1 = gets.chomp
p1 = Player.new(player1)

puts "\nPlayer 2: Enter your desired name"
player2 = gets.chomp
p2 = Player.new(player2)

puts "\nWelcome \e[31m#{p1.player}\e[0m and \e[34m#{p2.player}\e[0m to the \e[33mTwO-O-Player Math Game!\e[0m Here are your starting lives:\n\n"
puts "\e[31m#{p1.player}\e[0m: #{p1.lives}\n\e[34m#{p2.player}\e[0m: #{p2.lives}"
puts ""

questions = [
  Question.new("What is 2 + 6?", 8),
  Question.new("What is 4 divided by 2?", 2),
  Question.new("What is 10 times 2?", 20),
  Question.new("What is 5 + 4?", 9),
  Question.new("What is 7 - 3?", 4),
  Question.new("What is 6 multiplied by 3?", 18),
  Question.new("What is 9 divided by 3?", 3),
  Question.new("What is 8 + 7?", 15),
  Question.new("What is 12 - 5?", 7),
  Question.new("What is 4 multiplied by 5?", 20),
  Question.new("What is 18 divided by 2?", 9),
  Question.new("What is 3 + 7?", 10),
  Question.new("What is 10 - 8?", 2),
  Question.new("What is 6 multiplied by 4?", 24),
  Question.new("What is 20 divided by 5?", 4),
  Question.new("What is 9 + 8?", 17)
]


current_player = p1

puts "#{current_player.player}'s turn!"

questions.each_with_index do |question, index|

  puts "----- Question #{index + 1} -----"
  answer = question.prompt

  if answer == question.answer
    puts "\e[32mCorrect!\e[0m\n\n"
  else
    puts "\e[31mIncorrect! You lost a life.\e[0m\n\n"
    current_player.lives -= 1
  end
  

  puts "Lives remaining:\n\e[31m#{p1.player}\e[0m: #{p1.lives}/3 vs \e[34m#{p2.player}\e[0m: #{p2.lives}/3\n\n"

  if p1.lives == 0 || p2.lives == 0
    puts "#{current_player.player} wins with a score of #{current_player.lives}/3"
    puts "----- GAME OVER -----"
    exit(0)
  end

  if current_player == p1
    if p1.lives > p2.lives
      puts "\e[31m#{p1.player}\e[0m is in the lead!\n"
    elsif p2.lives > p1.lives
      puts "\e[34m#{p2.player}\e[0m is in the lead!\n"
    end

    current_player = p2
    puts "\n#{current_player.player}'s turn!"

  elsif current_player == p2
    if p1.lives > p2.lives
      puts "\e[31m#{p1.player}\e[0m is in the lead!\n"
    elsif p2.lives > p1.lives
      puts "\e[34m#{p2.player}\e[0m is in the lead!\n"
    end

    current_player = p1
    puts "\n#{current_player.player}'s turn!"
  end
end
