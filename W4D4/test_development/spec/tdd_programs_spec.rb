require "tdd_programs.rb"
#require "rspec"


describe "#my_uniq" do
    it "removes duplicates from an array" do 
        expect([1,2,1,3,3].my_uniq).to eq([1,2,3])
    end
end

describe "#two_sum" do
    it "returns an array of the indices of pairs that sum to 0" do
        expect([-1,0,2,-2,1].two_sum).to eq([[0,4],[2,3]])
    end
end
