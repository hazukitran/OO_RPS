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

  CHOICES = { 'r' => 'rock', 'p' => 'paper', 's' => 'scissors', 'q' => 'quit'}

  WINNING_HANDS = [['r', 's'], ['s', 'p'], ['p', 'r']]

  attr_accessor :wins, :draws, :looses

  attr_reader :value

  def initialize(value)
    @value = value
    @wins = 0
    @looses = 0
    @draws = 0
  end

  def human_wins(other_hand)
    WINNING_HANDS.find { |hand| value == hand[0] && other_hand.value == hand[1] }
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

  attr_accessor :hand, :name

  def get_name
    system "clear"
    puts "Please enter your name: "
    @name = gets.chomp
  end

  def choose_hand
    choice = ""
    loop do
      begin
      puts "Please choose (r)ock, (p)aper, (s)cissors or (q)uit: "
      choice = gets.chomp.downcase
      end until Hand::CHOICES.keys.include?(choice)
      puts "Invalid input."
      break if choice == "q"
    end

    self.hand = Hand.new(choice)
  end
end

class Computer

  attr_accessor :hand
  
  def choose_hand
    begin
    self.hand = Hand.new(Hand::CHOICES.keys.sample)
    end while hand == "q" 
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
    puts "Welcome to the game 'Rock Paper Scissors".center(40)

    puts "#{human.name}".center(20) + "Computer".center(20)
    puts "#{human.hand}".center(20) + "#{computer.hand}".center(20)
  
  end

  def compare_hands
    case human.hand <=> computer.hand
    when 0
      
  end

  def run
    human.choose_hand
    computer.choose_hand
    display_message
  end


end
 
RPSGame.new.run
