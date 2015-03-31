require_relative 'row_validator'

class Row
  attr_reader :elements

  def initialize(row_string)
    @elements = row_string.gsub('|', '').split(/\s/).map(&:to_i)
    @validator = RowValidator.new(elements)
  end

  def valid?
    @validator.valid?
  end

  def divider?
    @elements.size == 1
  end

  def complete?
    @elements.none?(&:zero?)
  end
end