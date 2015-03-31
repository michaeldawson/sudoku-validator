require_relative 'row'
require_relative 'column'
require_relative 'subgroup'

class Puzzle
  def initialize(puzzle_string)
    @puzzle_string = puzzle_string
  end

  def complete?
    rows.all?(&:complete?)
  end

  def valid?
    rows.all?(&:valid?) && columns.all?(&:valid?) && subgroups.all?(&:valid?)
  end

  private

  attr_reader :puzzle_string

  def rows
    @rows ||= puzzle_string.split("\n")
      .map{ |row| Row.new(row) }
      .reject(&:divider?)
  end

  def columns
    @columns ||= rows.map(&:elements).transpose
      .map{ |col| Column.new(col) }
  end

  # This is gross. But, basically, we're just grabbing row data, and slurping out numbers in
  # subgrids of 3x3, then building Subgroup objects from the resulting arrays.
  def subgroups
    @subgroups ||= [].tap do |subgroups|
      row_data = rows.map(&:elements).map(&:dup)
      3.times do
        row_set = row_data.pop(3)
        3.times do
          subgroups << row_set.map{ |row| row.pop(3) }.flatten
        end
      end
    end.map { |elements| Subgroup.new(elements) }
  end
end