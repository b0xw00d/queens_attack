require 'spec_helper'

describe Runner do

  context "#get_user_input" do

    before(:all) do
      @user_input = Runner.get_user_input
    end

    it "returns args for the game" do
      expect(@user_input).to be_a Hash
    end

    it "returns two sets of coordinates" do
      expect(@user_input.values.length).to eq 2
    end

    it "returns arrays of coordinates" do
      expect(@user_input.values.all? do |value|
        value.is_a? Array
      end).to eq true
    end
  end

  context "#check_user_input" do
    it "rejects bad input" do
      expect(Runner.check_user_input([9,9], [10,10])).to eq false
      expect(Runner.check_user_input([0,0,0], [1,1,1])).to eq false
      expect(Runner.check_user_input([0,0], [7,7])).to eq true
    end
  end

  context "#goodbye" do
    let(:hit) { Game.new(white: [0,0], black: [7,7]) }
    let(:miss) { Game.new(white: [0,0], black: [5,7]) }

    it "finds hits" do
      expect(Runner.goodbye(hit)).to eq "HIT!"
    end

    it "finds misses" do
      expect(Runner.goodbye(miss)).to eq "miss..."
    end
  end

end
