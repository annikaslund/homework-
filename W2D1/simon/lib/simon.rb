class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until @game_over
      self.take_turn
    end

   self.game_over_message
   self.reset_game
  end

  def take_turn
    self.show_sequence
    self.require_sequence

    unless @game_over
      self.round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    self.add_random_color
    @seq.each do |color|
      puts color
      sleep(1)
      system("clear")
    end
  end

  def require_sequence
    puts "Repeat the sequence! Enter the first letter of each color:"
    @seq.each do |color|
      user_color = gets.chomp
      if color[0] != user_color
        @game_over = true
        break
      end
    end
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    puts "Congratulations! You've won this round!"
  end

  def game_over_message
    puts "Game over. You had a high score of #{@sequence_length - 1}"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end
