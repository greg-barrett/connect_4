require 'connect_4.rb'
describe Game do
  a_game=Game.new
    describe a_game do
      it {should be_kind_of(Game)}
    end
  end

player_1= Player.new("Greg")
  describe player_1 do
    it {should be_kind_of(Player)}
    it {should respond_to(:name)}
  end

describe Game do
  subject(:the_game) {Game.new}

  describe "#make_board" do
    it "Creates a blank array to store the game" do
        board_array= [ [".", ".", ".", "."], [".", ".", ".", "."],
                      [".", ".", ".", "."], [".", ".", ".", "."] ]

    expect(the_game.make_board).to eql(board_array)
    end
  end

  describe "#mark" do
    it "Accepts a coordinate and updates the array" do
      board_marked= [ [".", ".", ".", "."], [".", ".", ".", "."],
                      [".", ".", ".", "."], ["X", ".", ".", "."] ]
         the_game.make_board
         the_game.current_player
      expect(the_game.mark("a")).to eql(board_marked)
    end

    it "Accepts upper or lower case inputs" do
      board_marked= [ [".", ".", ".", "."], [".", ".", ".", "."],
                      [".", ".", ".", "."], ["O", ".", ".", "."] ]
         the_game.make_board
         the_game.current_player
      expect(the_game.mark("A")).to eql(board_marked)
    end

    it "assigns the second marker above the first" do
      board_marked= [ [".", ".", ".", "."], [".", ".", ".", "."],
                      ["O", ".", ".", "."], ["X", ".", ".", "."] ]
          the_game.make_board
          the_game.current_player
          the_game.mark("a")
          the_game.current_player
      expect(the_game.mark("a")).to eql(board_marked)
    end

    it "returns error message if column is full" do
          the_game.make_board
          the_game.current_player
          the_game.mark("a")
          the_game.mark("a")
          the_game.mark("a")
          the_game.mark("a")
      expect(the_game.mark("a")).to eql("Column full.")
    end

    it "returns error message if input is not valid" do
          the_game.make_board
          the_game.current_player
      expect(the_game.mark("f")).to eql("Turn out of range. Try again")
    end
  end

  describe "#win?" do
    it "Returns true if a winning move was played" do
      the_game.make_board
      the_game.mark("a")
      the_game.mark("b")
      the_game.mark("c")
      the_game.mark("d")
      expect(the_game.win?).to be true
    end

    it "Returns false if a move didn't create a win" do
      the_game.make_board
      the_game.mark("a")
      the_game.mark("a")
      the_game.mark("a")
      the_game.mark("b")
      expect(the_game.win?).to be false
    end
    it "Returns false no moves have been played" do
      the_game.make_board
      expect(the_game.win?).to be false
    end
end

  describe "#show_board" do
    it "shows the play board in state of play" do
      the_game.make_board
      expect(the_game.show_board).to be(puts ".   .   .   .")
    end
  end

  describe "#draw?" do
    it "Return true if there are 16 marks and a winner has not been declared" do
      the_game.make_board
      @@marks=16
      expect(the_game.draw?).to eql(true)
    end

    it "Return false until all 16 moves are played" do
      the_game.make_board
      @@marks=15
      expect(the_game.draw?).to eql(false)
    end
  end

  describe "#current_player" do
    it "When the number of successful turns is even it returns 'X'" do
      @@marks=0
      expect(the_game.current_player).to eql("X")
    end

    it "When the number of successful turns is odd it returns 'O'" do
      @@marks=1
      expect(the_game.current_player).to eql("O")
    end
  end

end
