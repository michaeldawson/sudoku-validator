require_relative 'puzzle'

class Validator
  def initialize(puzzle_string)
    @puzzle ||= Puzzle.new(puzzle_string)
  end

  def self.validate(puzzle_string)
    new(puzzle_string).validate
  end

  def validate
    if puzzle.valid? && puzzle.complete?
      "This sudoku is valid."
    elsif puzzle.valid?
      "This sudoku is valid, but incomplete."
    else
      "This sudoku is invalid."
    end
  end

  private

  attr_reader :puzzle
end
