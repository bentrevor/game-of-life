class Cells
  attr_accessor :grid, :width

  def initialize(grid)
    self.grid = grid
    self.width = Math.sqrt(grid.length)
  end

  def [](index)
    self.grid[index]
  end

  def give_birth(index)
    self.grid[index] = 1
  end

  def kill(index)
    self.grid[index] = 0
  end

  def living_neighbors_of(index)
    neighbors_of(index).count { |i| self.grid[i] == 1 }
  end

  private

  def neighbors_of(index)
    neighbors = []
    neighbors << left_neighbor(index)         unless on_left_edge?(index)
    neighbors << bottom_left_neighbor(index)  unless on_bottom_or_left_edge?(index)
    neighbors << bottom_neighbor(index)       unless on_bottom_edge?(index)
    neighbors << bottom_right_neighbor(index) unless on_bottom_or_right_edge?(index)
    neighbors << right_neighbor(index)        unless on_right_edge?(index)
    neighbors << top_right_neighbor(index)    unless on_top_or_right_edge?(index)
    neighbors << top_neighbor(index)          unless on_top_edge?(index)
    neighbors << top_left_neighbor(index)     unless on_top_or_left_edge?(index)
    neighbors
  end

  def top_neighbor(index)
    index - width
  end

  def top_right_neighbor(index)
    index - width + 1
  end

  def right_neighbor(index)
    index + 1
  end

  def bottom_right_neighbor(index)
    index + width + 1
  end

  def bottom_neighbor(index)
    index + width
  end

  def bottom_left_neighbor(index)
    index + width - 1
  end

  def left_neighbor(index)
    index - 1
  end

  def top_left_neighbor(index)
    index - width - 1
  end

  def on_top_edge?(index)
    index < width
  end

  def on_top_or_right_edge?(index)
    on_top_edge?(index) or on_right_edge?(index)
  end

  def on_right_edge?(index)
    (index + 1) % width == 0
  end

  def on_bottom_or_right_edge?(index)
    on_bottom_edge?(index) or on_right_edge?(index)
  end

  def on_bottom_edge?(index)
    index > (width * (width - 1))
  end

  def on_bottom_or_left_edge?(index)
    on_bottom_edge?(index) or on_left_edge?(index)
  end

  def on_left_edge?(index)
    index % width == 0
  end

  def on_top_or_left_edge?(index)
    on_top_edge?(index) or on_left_edge?(index)
  end
end
