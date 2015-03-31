require 'column'

RSpec.describe Column do
  let(:column) { Column.new(@elements) }

  describe 'valid?' do
    context 'with valid elements' do
      before :each do
        @elements = [1,2,3,4,5,6,7,8,9]
      end

      it "returns true" do
        expect(column.valid?).to be true
      end
    end

    context 'with duplicate elements' do
      before :each do
        @elements = [1,1,3,4,5,6,7,8,9]
      end

      it "returns false" do
        expect(column.valid?).to be false
      end
    end

    context 'with elements > 9' do
      before :each do
        @elements = [1,10,3,4,5,6,7,8,9]
      end

      it "returns false" do
        expect(column.valid?).to be false
      end
    end
  end
end