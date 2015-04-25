class GridSampler
  attr_reader :width, :height, :columns, :rows

  def initialize(frame, num_columns, num_rows)
    @frame   = frame
    size     = frame.size
    @width   = size.width
    @height  = size.height
    @columns = num_columns
    @rows    = num_rows
  end

  def sample
    points.map do |cords|
      index = cords.reduce(&:*)
      { cords => @frame[index].to_a }
    end
  end

  private

  def points
    @points ||= (0..rows - 1).map do |row_i|
      (0..columns - 1).map do |col_i|
        point(col_i, row_i)
      end
    end.reduce(&:+)
  end

  def point(x, y)
    [
      x * col_width  + col_offset,
      y * row_height + row_offset,
    ]
  end

  def col_width
    @col_width ||= width / columns
  end

  def row_height
    @col ||= height / rows
  end

  def col_offset
    @col_offset ||= col_width  / 2
  end

  def row_offset
    @row_offset ||= row_height / 2
  end
end
