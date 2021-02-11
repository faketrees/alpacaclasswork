require "practice.rb"
# [] expect []
# [2, nil, nil, 2, 4] expect [2, nil, 4]
# do not use .uniq method
# [ [2, nil, 4], "hello", [8, 2], "world", [2, nil, 4], "hello", "hello world"]

describe "#my_uniq" do
  before(:each) do 
    expect_any_instance_of(Array).not_to receive(:uniq)
    expect_any_instance_of(Array).not_to receive(:uniq!)
  end
  # let(:array) { [2, nil, nil, 2, 4] }
    it "should return a new array with all duplicate elements removed" do
      expect(my_uniq([2, nil, nil, 2, 4])).to eq([2, nil, 4])
    end
    it "should not flatten out arrays" do
      expect(my_uniq([[2, nil, 4], "hello", [8, 2], "world", [2, nil, 4], "hello", "hello world"])).to eq([[2, nil, 4], "hello", [8, 2], "world", "hello world"])
    end
    it "should return empty array if given empty array" do
      expect(my_uniq([])).to eq([])
    end

end