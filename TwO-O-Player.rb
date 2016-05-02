require 'colorize'

class Player
  attr_accessor :name, :score, :lives
  def initialize(name)
    @name = name
    @score = 0
    @lives = 3
  end
end

class GameStart
  attr_accessor :player1, :player2
  def initialize(player_1, player_2)
    @player1 = player_1
    @player2 = player_2
  end

  def ran_num_gen
    @num1 = rand(1..20)
    @num2 = rand(1..20)
  end

  def game
    go_on = true
    @p1life = @player1.lives
    @p2life = @player2.lives
    @points1 = @player1.score
    @points2 = @player2.score
  
    while go_on do
      ran_num_gen
      puts "#{@player1.name}: What does #{@num1} plus #{@num2} equal?"
      p1input = gets.chomp.to_i
      if p1input == @num1 + @num2
        @points1 += 1
        puts "Correct! You have #{@points1} points, smart-ass.".blue
      else
        @p1life -= 1
        puts "WRONG!".red
        if @p1life == 0
          puts "Game over! #{@player2.name} WINS!".red
        return go_on = false
        end
      end

      ran_num_gen
      puts "#{@player2.name}: What does #{@num1} plus #{@num2} equal?"
      p2input = gets.chomp.to_i
      if p2input == @num1 + @num2
        @points2 += 1
        puts "Correct! You have #{@points2} points, smart-ass.".blue
      else
        @p2life -= 1
        puts "WRONG!".red
        if @p2life == 0
          puts "Game over! #{@player1.name} WINS!".red
          return go_on = false
        end
      end
    end
  end
end

p1 = Player.new('hiii')
p2 = Player.new('byeee')

GameStart.new(p1, p2).game