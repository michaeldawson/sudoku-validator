require 'validator'

describe '#validate' do
  context "with a sudoku string" do
    let(:validator) { Validator.new("string") }

    context 'with a valid puzzle' do
      before :each do
        allow(validator).to receive(:puzzle)
          .and_return(double(:puzzle, valid?: true, complete?: true))
      end

      it "prints 'This sudoku is valid.'" do
        expect(validator.validate).to eq "This sudoku is valid."
      end
    end

    context 'with a valid, incomplete puzzle' do
      before :each do
        allow(validator).to receive(:puzzle)
          .and_return(double(:puzzle, valid?: true, complete?: false))
      end

      it "prints 'This sudoku is valid, but incomplete.'" do
        expect(validator.validate).to eq "This sudoku is valid, but incomplete."
      end
    end

    context 'with an invalid puzzle' do
      before :each do
        allow(validator).to receive(:puzzle)
          .and_return(double(:puzzle, valid?: false, complete?: true))
      end

      it "prints 'This sudoku is valid, but incomplete.'" do
        expect(validator.validate).to eq "This sudoku is invalid."
      end
    end
  end
end
