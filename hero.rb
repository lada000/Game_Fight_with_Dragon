require_relative 'character'

class Hero < Character
  attr_reader :health_potions

  MIN_DMG = 10
  MAX_DMG = 15
  POTION_STREGTH = 10

  def initialize
    @hit_points = 20
    @health_potions = 2
  end

  def drink_potion 
    if @health_potions > 0
        @hit_poinst += POTION_STREGTH
        @health_potions -= 1
    end
  end 
end