class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) { Array.new }
    place_stones
  end

  def place_stones
    @cups.each_with_index do |cup, idx|
      next if idx == 6 || idx == 13
      4.times do
        cup << :stone
      end
    end
  end

  def valid_move?(start_pos)
    if start_pos < 0 || start_pos > 12
      raise "Invalid starting cup"
    end
    if @cups[start_pos].empty?
      raise "Starting cup is empty"
    end
  end

  def make_move(start_pos, current_player_name)
    moving_stones = @cups[start_pos]
    @cups[start_pos] = []

    cup_idx = start_pos
    until moving_stones.empty?
      cup_idx += 1
      cup_idx = 0 if cup_idx > 13
      if cup_idx == 6
        @cups[6] << moving_stones.pop if @current_player_name == @name1
      elsif cup_idx == 13
        @cups[13] << moving_stones.pop if @current_player_name == @name2
      else
        @cups[cup_idx] << moving_stones.pop
      end
    end

    next_turn(cup_idx)
    render
  end

  def next_turn(ending_cup_idx)
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx].count == 1
      :switch
    else
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    side1 = @cups[0..6].all? {|cup| cup.empty?}
    side2 = @cups[7..13].all? {|cup| cup.empty?}

    return side1 || side2 if true
    false

  end

  def winner
    if @cups[6] == @cups[13]
      :draw
    elsif @cups[6].length > @cups[13].length
      @name1
    else
      @name2
    end
  end
end
