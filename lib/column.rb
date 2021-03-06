require_relative 'row_validator'

class Column
  attr_reader :elements

  def initialize(elements)
    @elements = elements
    @validator = RowValidator.new(elements)
  end

  def valid?
    @validator.valid?
  end
end