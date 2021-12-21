require 'scoreboard'

describe Scoreboard do
  before do
    @rolls = [1,4,4,5,6,4,5,5,10,0,1,7,3,6,4,10,2,8,6]
    @scoreboard = Scoreboard.new(@rolls)
  end

  context '#strike' do
    it 'return true when strike' do
      expect(@scoreboard.strike?(10)).to be true
    end
    it 'return false when not strike' do
      expect(@scoreboard.strike?(3)).to be_falsey
    end
  end

  context '#spare' do
    it 'return true when spare' do
      expect(@scoreboard.spare?(8, 2)).to be true
    end
    it 'return false when not spare' do
      expect(@scoreboard.spare?(3, 6)).to be_falsey
    end
  end

  context '#score' do
    it 'return the score of a game' do
      expect(@scoreboard.score).to eq 133
    end
    it 'return a perfect game score' do
      perfect_rolls = [10,10,10,10,10,10,10,10,10,10,10,10]
      scoreboard = Scoreboard.new(perfect_rolls)
      expect(scoreboard.score).to eq 300
    end
    it 'return a gutter game score' do
      gutter_rolls = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
      scoreboard = Scoreboard.new(gutter_rolls)
      expect(scoreboard.score).to eq 0
    end
  end

end
