require 'rspec'
require 'array'

describe Array do
  describe '#my_uniq' do
    it "works for a standard array" do
      expect([1, 2, 1, 3, 3].my_uniq).to eq([1, 2, 3])
    end
  end

  describe '#my_uniq' do
    it "works for an empty array" do
      expect([].my_uniq).to eq([])
    end
  end

  describe '#my_uniq' do
    it "works for an multiple amounts of the same number" do
      expect([2,2,2,2,2,2,2,3,2,2,2,2,2].my_uniq).to eq([2,3])
    end
  end

  describe '#two_sum' do
    it "works for obvious example" do
      expect([-1, 0, 2, -2, 1].two_sum).to eq([[0, 4], [2, 3]])
    end
  end

  describe '#two_sum' do
    it "works for an empty array" do
      expect([].two_sum).to eq([])
    end
  end

  describe '#my_transpose' do
    it "works for a standard square array" do
      expect([[0, 1, 2],[3, 4, 5],[6, 7, 8]].my_transpose).to eq([[0, 3, 6],[1, 4, 7],[2, 5, 8]])
    end
  end

  describe '#my_transpose' do
    it "works for a rectangular array" do
      expect([[0, 3, 6],[1, 4, 7]].my_transpose).to eq([[0,1],[3,4],[6,7]])
    end
  end

  describe '#stock_pick' do
    it "works for a sorted array" do
      expect([1,2,3,4,5,6,7,8,9].stock_pick).to eq([0,8])
    end
  end

  describe '#stock_pick' do
    it "works for an unsorted array" do
      expect([4,3,6,3,1,4,7,2].stock_pick).to eq([4,6])
    end
  end

  describe '#stock_pick' do
    it "works for an array with no profitable days" do
      expect([9,8,7,6,5,4,3,2,1].stock_pick).to eq([])
    end
  end

end

describe Hanoi do
  let(:game) {Hanoi.new}

  describe '#render' do
    it "shows current board" do
      expect(game.render).to eq([[1,2,3],[],[]])
    end
  end
  
  describe '#move' do
    it "allow legal moves" do
      expect(game.move(0,1)).to eq([[2,3],[1],[]])
    end
  end

  describe '#move' do
    it "error out illegal moves" do
      expect{game.move(1,2)}.to raise_error(ArgumentError)
    end
  end

  context "at winning move" do 
    before(:each) do
      game.game = [[],[],[1,2,3]]
    end
    describe 'won?' do
      it "should show that you won, if you finished the tower" do
        expect(game.won?).to eq(true)
      end
    end
  end

end

