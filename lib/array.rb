class Array
	def my_uniq
    new_hash = {}
      self.each do |value|
        new_hash[value] = 1
      end
    new_hash.keys
  end
	
  def two_sum
    two_sum_index = []
    self[0..-2].each_with_index do |first_value, first_index|
      self[(first_index + 1)..-1].each_with_index do |second_value, second_index|
        if first_value + second_value == 0
          two_sum_index << [first_index, second_index + first_index + 1]
        end
      end
    end
    two_sum_index
  end

  def my_transpose

    transposed = Array.new(self[0].length) {Array.new(self.length)}

    self.each_with_index do |row, row_index|
      row.each_with_index do |value, col_index|
        transposed[col_index][row_index] = self[row_index][col_index]
      end
    end
    transposed
  end

  def stock_pick
    differences_hash = {}
    self[0..-2].each_with_index do |first_value, first_index|
      self[(first_index + 1)..-1].each_with_index do |second_value, second_index|
        differences_hash[[first_index, second_index + first_index + 1]] = second_value - first_value
      end
    end
    biggest_value_hash = differences_hash.sort {|x,y| y[1] <=> x[1]}[0]
    if biggest_value_hash[1] > 0
      biggest_value_hash[0]
    else
      []
    end
  end

end

class Hanoi

  attr_accessor :game

  def initialize

    @game = [[1,2,3],[],[]]

  end

  def render

    @game

  end

  def move(start_pos, end_pos)

    if !@game[start_pos].empty? 
      if !@game[end_pos].empty? 
        if @game[end_pos][0] > @game[start_pos][0]
          @game[end_pos].unshift(@game[start_pos].shift)
          return @game
        else 
          raise ArgumentError.new "Selected invalid move"
        end
      else 
        @game[end_pos].unshift(@game[start_pos].shift)
      end
    else 
      raise ArgumentError.new "Selected invalid move"
    end
    @game
  end

  def won?
    if @game == [[],[],[1,2,3]]
      return true
    end
  end
end

Game = Hanoi.new
p Game.move(0,1)