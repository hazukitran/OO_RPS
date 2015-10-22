CHOICES = { 'r' => 'rock', 'p' => 'paper', 's' => 'scissors', 'q' => 'quit'}
@draws = @wins = @losses = 0

# ------------- METHODS -------------------

def player_wins
  @wins += 1
  puts "Congrats! You have won this round :)"
end

def player_losses
  @losses += 1
  puts "Sorry, you have lost. Better luck next time!"
end

def draw
  @draws += 1
  puts "It's a draw."
end

def determine_winner(player, computer)
  if player == computer
    draw
  else
    case player
    when "r"
      computer == "p" ? player_losses : player_wins
    when "p"
      computer== "s" ? player_losses : player_wins
    when "s"
      computer == "r" ? player_losses : player_wins
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

  computer_choice = CHOICES.keys.sample

  puts "You chose: #{player_choice}"
  puts "Computer chose: #{computer_choice}"
  puts determine_winner(player_choice, computer_choice)

end

puts "wins: #{@wins}\nlosses: #{@losses}\ndraw: #{@draws}"
if @wins > @losses
  puts "You have won the game."
elsif @wins < @losses
  puts "You have lost the game."
else
  puts "The game is a draw"
end