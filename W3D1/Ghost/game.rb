require_relative "player.rb"

class Game
  attr_reader :players, :current_player, :previous_player

  def initialize(names, lives)
    @fragment = ""
    @dictionary = {}

    @player_1 = Player.new(names[0])
    @player_2 = Player.new(names[1])

    @players = [@player_1, @player_2]
    @current_player = @players[0]
    @previous_player = @players[-1]
  end

  def next_player!
    @players = @players.rotate
    @current_player = @players[0]
    @previous_player = @players[-1]
  end

end

