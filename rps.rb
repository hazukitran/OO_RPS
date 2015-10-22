CHOICES = { 'r' => 'rock', 'p' => 'paper', 's' => 'scissors', 'q' => 'quit'}
score = { wins: 0, losses: 0, draws: 0}

# ------------- METHODS -------------------

def player_wins(score)
  score[:wins] += 1
  puts "Congrats! You have won this round :)"
end

def player_losses(score)
  score[:losses] += 1
  puts "Sorry, you have lost. Better luck next time!"
end

def draw(score)
  score[:draws] += 1
  puts "It's a draw."
end

def determine_winner(player, computer, score)
  if player == computer
    draw(score)
  else
    case player
    when "r"
      computer == "p" ? player_losses(score) : player_wins(score)
    when "p"
      computer== "s" ? player_losses(score) : player_wins(score)
    when "s"
      computer == "r" ? player_losses(score) : player_wins(score)
    end
  end

end

# ------------ START PROGRAM --------------
loop do
  begin
    puts "Choose (r)ock, (p)aper, (s)cissors or (q)uit:"
    player_choice = gets.chomp.downcase
  end until CHOICES.keys.include?(player_choice)

  break if player_choice == "q"

  begin
  computer_choice = CHOICES.keys.sample
  end while computer_choice == "q" 

  puts "You chose: #{player_choice}"
  puts "Computer chose: #{computer_choice}"
  puts determine_winner(player_choice, computer_choice, score)

end

puts "wins: #{score[:wins]}\nlosses: #{score[:losses]}\ndraw: #{score[:draws]}"
if score[:wins] > score[:losses]
  puts "You have won the game."
elsif score[:wins] < score[:losses]
  puts "You have lost the game."
else
  puts "The game is a draw"
end