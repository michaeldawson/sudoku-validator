require 'puzzle'

describe "Puzzle" do
  let(:puzzle) { Puzzle.new("string") }

  describe '#complete?' do
    context "with an incomplete puzzle" do
      before :each do
        allow(puzzle).to receive(:rows)
          .and_return([
            double(:row, complete?: false),
            double(:row, complete?: true)
          ])
      end

      it "returns false" do
        expect(puzzle.complete?).to be false
      end
    end

    context "with a complete puzzle" do
      before :each do
        allow(puzzle).to receive(:rows)
          .and_return([
            double(:row, complete?: true),
            double(:row, complete?: true)
          ])
      end

      it "returns true" do
        expect(puzzle.complete?).to be true
      end
    end
  end

  describe '#valid?' do
    context "when all rows, columns and subgroups are valid" do
      before :each do
        allow(puzzle).to receive(:rows)
          .and_return([
            double(:row, valid?: true),
          ])

        allow(puzzle).to receive(:columns)
          .and_return([
            double(:column, valid?: true),
          ])

        allow(puzzle).to receive(:subgroups)
          .and_return([
            double(:subgroup, valid?: true),
          ])
      end

      it "returns true" do
        expect(puzzle.valid?).to be true
      end
    end

    context "when all rows and subgroups are valid, but some columns aren't valid" do
      before :each do
        allow(puzzle).to receive(:rows)
          .and_return([
            double(:row, valid?: true),
          ])

        allow(puzzle).to receive(:columns)
          .and_return([
            double(:column, valid?: true),
            double(:column, valid?: false),
          ])

        allow(puzzle).to receive(:subgroups)
          .and_return([
            double(:subgroup, valid?: true),
          ])
      end

      it "returns false" do
        expect(puzzle.valid?).to be false
      end
    end
  end
end
