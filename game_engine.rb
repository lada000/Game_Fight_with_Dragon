require_relative 'hero'
require_relative 'dragon'

class GameEngine
  def initialize 
    @hero = Hero.new 
    @dragon = Dragon.new 
    @hero_turn = true
  end

  def run
    loop do 
      puts "Hit points #{@hero.hit_points}"
      puts "Dragon points #{@dragon.hit_points}"
     
      if @hero_turn
        do_hero_turn
      else
        puts "\nDragon walks!"
        dmg = @dragon.attack @hero
        puts "The dragon hit on #{dmg}"
      end

      if @dragon.hit_points <= 0
        puts "The HERO has won!"
        break
      end

      if @hero.hit_points <= 0
        puts "The DRAGON won"
        break
      end

      @hero_turn = !@hero_turn
    end
  end
  
  private

  def do_hero_turn
    puts "\nHero walks!"
    puts "What are we doing? Enter Z for potion(#{@hero.health_potions}) or A for attack:"
    action = gets.strip[0]

    if action == 'Z'
      @hero.drink_potion
    elsif action == 'A'
      dmg = @hero.attack @dragon
      puts "The hero hit on #{dmg}"
    else 
      puts 'Incorrect input'
    end
  end
end