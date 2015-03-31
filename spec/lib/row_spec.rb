require 'row'

RSpec.describe Row do
  let(:row) { Row.new(@row_string) }

  describe '#divider?' do
    context "for a row with only divider characters" do
      before :each do
        @row_string = "------+------+------"
      end

      it "returns true" do
        expect(row.divider?).to eq true
      end
    end

    context "for a row with no divider characters" do
      before :each do
        @row_string = "8 5 9 |6 1 2 |4 3 7"
      end

      it "returns false" do
        expect(row.divider?).to eq false
      end
    end
  end

  describe '#complete?' do
    context 'with all elements completed' do
      before :each do
        @row_string = "8 5 9 |6 1 2 |4 3 7"
      end

      it "returns true" do
        expect(row.complete?).to be true
      end
    end

    context 'without all elements completed' do
      before :each do
        @row_string = "8 0 9 |6 1 0 |4 3 7"
      end

      it "returns false" do
        expect(row.complete?).to be false
      end
    end
  end

  describe 'valid?' do
    context 'with valid elements' do
      before :each do
        @row_string = "1 2 3 4 5 6 7 8 9"
      end

      it "returns true" do
        expect(row.valid?).to be true
      end
    end

    context 'with duplicate elements' do
      before :each do
        @row_string = "1 1 3 4 5 6 7 8 9"
      end

      it "returns false" do
        expect(row.valid?).to be false
      end
    end

    context 'with elements > 9' do
      before :each do
        @row_string = "1 10 3 4 5 6 7 8 9"
      end

      it "returns false" do
        expect(row.valid?).to be false
      end
    end
  end
end