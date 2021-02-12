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

    describe "#stock_picker" do 
        it "will find the first lowest index and compare to next highest index" do 
            expect(stock_picker([9, 3, 5, 6, 7, 3])).to eq([1,4])
        end
    end



    #board class
        #represent disks with a number

        #determine if win or won?
        #can't move more than one piece at a time
        #methods needed
            #initialize
                #number of disks
                    #disks are going to need a size represented by an integer
                #board -number of posts
            
            #play 
                #should call the move method
            #move
                #playturn?
                #should call valid_move?

                #get user input. do some bullshit
                    #should get starting post and ending post
                    #convert strings to integers where applicable
                    #check if valid move
                    #if move valid then make it happen
                    #next turn
                    #repeat until win?
            #disks
                #should return the total number of disks on that post
                #
            #render_board

            #valid_move?
                    #should raise an error if you try to move a larger disk onto a smaller disk
                    #error to move piece off board
                    #error if piece is not the top
            #won?
                #goes on till stack is full on 'other side' (post 3)
                #if array[2] == array[0].dup.sort
                    #duplicate starting array
                    #board.last == starting_array_duplicate first stack. 
                    
            #move counter not necessary but interesting.... spoooky
            #



    
# game.new(64)

#board - [[1..4], [], []]
    describe Board do 
        subject(:board) { board = Board.new(4)}

        describe "#initialize" do

            it "should take in an integer as an argument for the number of disks" do
                expect{Board.new(5)}.not_to raise_error
            end

            it "adds the correct number of disks to the stack and be in the correct order" do #getter/setter methods?
                expect(board.disks[1]).to eq([4,3,2,1])
            end

            it "needs to create a board of size 3 (3 posts)" do
                expect(board.length).to eq(3)
                expect(board[0].length).to eq(4)
            end
        end

        describe "#move" do

            it "should call valid_move?" do
              expect(board.move).to receive(:valid_move?).at_least(:once)
            end


            it "should take in a start post and an end post"


            it "should raise error if disk@pos is smaller than moved disk" do
                expect{board.valid_move?}.to raise_error
            end

            it "should raise an error if you try to moe disk off the board"

        end

        describe "won?" do

          it "should return true if post 3 has all disks in order" do

          end

        end


    end


#[[4,3,2,1], [], []]    

# [1], [ ], [ ]
# [2], [ ], [ ]
# [3], [ ], [ ]
# [4], [ ], [ ]

#boad[1][4] ->[2][3]
#post number
