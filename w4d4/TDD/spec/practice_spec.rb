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

#strategery
    #test correct indices
    #indicies are sorted dictionary wise
    #what happens if there is no array or no sum
    #test complicated combinations that do add up to zero
    #test case [4, -5, 1, 3, 5, -1, -4, 9] => [[0,6], [1,4], [2,5]]
    #test case [] => []
    #[1,2,3,4,5] => []

    describe "#two_sum" do 
        it "should return the indices of all pairs whose sum is zero" do
            expect(two_sum([4, -5, 1, 3, 5, -1, -4, 9])).to eq([[0,6], [1,4], [2,5]])
        end

        it "should return an empty array if array contains no elements" do
            expect(two_sum([])).to eq([])
        end

        it "should expect empty array if no elements sum to 0" do
            expect(two_sum([1,2,3,4,5])).to eq([])
        end

    end

    #transpose a 2d matrix - switching rows with columns
    #should not call .transpose method
    #it should my_transpose([
    #[0, 1, 2],  --->  [[0, 3, 6],
    #[3, 4, 5], --->  [0, 3, 6],
    #[6, 7, 8]  ---> [2, 5, 8]]
  
    describe "#my_transpose" do
      before(:each) do 
        expect_any_instance_of(Array).not_to receive(:transpose)
      end
      it "will convert between row oriented and column oriented representations" do
        expect(my_transpose([
          [0, 1, 2],
          [3, 4, 5],
          [6, 7, 8]
          ])).to eq([
          [0, 3, 6],
          [1, 4, 7],
          [2, 5, 8]])
      end
    end

    #Stock Picker [9, 3, 5, 6, 7, 3] -> [1,4] 
