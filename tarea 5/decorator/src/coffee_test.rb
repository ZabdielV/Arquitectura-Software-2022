# Decorator  Pattern
# Date: 03-Oct-2022
# Authors:
#          A01377950 Zabdiel Valentín Garduño Vivanco
#          A01377942 Luis Jonathan Rosas Ramos
#          A01377072 Emiliano Heredia García

require 'minitest/autorun'
require 'coffee'

#It evaluates three cases to test coffee.rb classes and methods.
class CoffeeTest < Minitest::Test

  #Test the behavior of Espresso class and their methods cost and description.
  def test_espresso
    beverage = Espresso.new
    assert_equal("Espresso", beverage.description)
    assert_equal(1.99, beverage.cost)
  end

  #Test the behavior of DarkRoast and the ability to add condiments classes to it.
  def test_dark_roast
    beverage = DarkRoast.new
    beverage = Milk.new(beverage)
    beverage = Mocha.new(beverage)
    beverage = Mocha.new(beverage)
    beverage = Whip.new(beverage)
    assert_equal("Dark Roast Coffee, Milk, Mocha, Mocha, Whip",
                 beverage.description)
    assert_equal(1.59, beverage.cost)
  end

  #Test the behavior of HouseBlend and the ability to add condiments classes to it.
  def test_house_blend
    beverage = HouseBlend.new
    beverage = Soy.new(beverage)
    beverage = Mocha.new(beverage)
    beverage = Whip.new(beverage)
    assert_equal("House Blend Coffee, Soy, Mocha, Whip",
                 beverage.description)
    assert_equal(1.34, beverage.cost)
  end

end