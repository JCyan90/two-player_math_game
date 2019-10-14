require "./math_problem"
require "./player"


class Game

  def initialize
    @p1 = Player.new("Player 1")
    @p2 = Player.new("Player 2")
    @active_player = @p1
  end

  def switch_player
    if @active_player == @p1
      @active_player = @p2
    else 
      @active_player = @p1
    end
  end

  def run
    puts "Let's start!"
    while @active_player.lives > 0 do
      # Start of the turn
      puts "\n------ NEW TURN ------"
      puts "#{@active_player.name}, here is your question:"

      # Display the question
      @question = Math_problem.new
      @question.ask

      # Check if the answer is correct
      if @question.check_answer(gets.chomp.to_i)
        puts "✅ Correct!"
      else
        puts "❌ WROOOOONG! The correct answer was #{@question.solution}"
        @active_player.lose_life
      end

      # Check if the player still has lives
      if @active_player.lives > 0
        puts "P1: #{@p1.lives}/3 vs P2: #{@p2.lives}/3"
        switch_player
      else 
        puts "\n------ GAME OVER ------ \n#{@active_player.name} is a loser, shame on him!"
      end

    end
  end
end