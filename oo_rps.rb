# Only 2 players: Human vs Computer
# Each player choose between 'r', 'p' or 's'
# - computer_hand.sample
# - human_hand between 'r', 'p', 's'
# Compare 2 hands
# 'r' > 's', 's' > 'p', 'p' > 'r'
# "It's a tie" if human_hand == computer_hand
# all in a loop, 'n' to exit

class Hand

  include Comparable

  CHOICES = %w(r p s q)

  WINNING_HANDS = [['r', 's'], ['s', 'p'], ['p', 'r']]

  attr_reader :value

  def initialize(value)
    @value = value
  end

  def human_wins(other_hand)
    WINNING_HANDS.find { |winner| value == winner[0] && other_hand.value == winner[1] }
  end

  def <=>(other_hand)
    if value == other_hand.value
      0
    elsif human_wins(other_hand)
      1
    else
      -1
    end
  end

  def to_s
    case value
    when 'r' then "Rock"
    when 'p' then "Paper"
    when 's' then "Scissors"
    end
  end

end

class Human 

  attr_accessor :hand, :name, :wins, :losses, :draws

  def initialize
    @wins = 0
    @losses = 0
    @draws = 0
  end

  def get_name
    
    puts "Please enter your name: "
    @name = gets.chomp
    system "clear"
    puts "Welcome to the game 'Rock Paper Scissors': #{name}".center(40)
  
  end

  def choose_hand
    choice = ""

    begin
      puts "Please choose (r)ock, (p)aper, (s)cissors or (q)uit: "
      choice = gets.chomp.downcase
    end until Hand::CHOICES.include?(choice)

    self.hand = Hand.new(choice)

  end
end

class Computer

  attr_accessor :hand
  
  def choose_hand
      self.hand = Hand.new(Hand::CHOICES.take(3).sample)
  end

end

class RPSGame

  attr_accessor :human, :computer, :hand
  
  def initialize
    @human = Human.new
    @computer = Computer.new

  end

  def display_message
    system "clear"

    puts "#{human.name}".center(20) + "Computer".center(20)
    puts "#{human.hand}".center(20) + "#{computer.hand}".center(20)
  
  end

  def compare_hands
    if human.hand == computer.hand
      human.draws += 1
      puts "It's a draw."
    elsif human.hand > computer.hand
      human.wins += 1
      puts "#{human.name} wins this round."
    else
      human.losses += 1
      puts "#{human.name} loses this round."
    end
  end

  def final_score
    puts "#{human.name} final score against 'Computer':"
    puts "wins: #{human.wins}\nlosses: #{human.losses}\ndraw: #{human.draws}"
    
    if human.wins > human.losses
      puts "Congrats! #{human.name} wins the game."
    elsif human.wins < human.losses
      puts "Sorry! #{human.name} loses the game."
    else
      puts "The game is a draw"
    end

  end

  def run

    human.get_name
    
    begin
      human.choose_hand
      computer.choose_hand
      display_message
      compare_hands
    end until human.choose_hand == 'q'
      
    final_score
  end
end
 
RPSGame.new.run
