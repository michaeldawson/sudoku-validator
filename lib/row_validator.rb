class RowValidator
  def initialize(elements)
    @elements = elements
  end

  def valid?
    elements_all_in_valid_range? && !elements_contain_duplicates?
  end

  private

  attr_reader :elements

  def completed_elements
    elements.reject(&:zero?)
  end

  def elements_contain_duplicates?
    !(completed_elements.uniq == completed_elements)
  end

  def elements_all_in_valid_range?
    completed_elements.all?{ |element| element.between?(1,9) }
  end
end