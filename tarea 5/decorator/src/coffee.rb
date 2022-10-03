# Decorator  Pattern
# Date: 03-Oct-2022
# Authors:
#          A01377950 Zabdiel Valentín Garduño Vivanco
#          A01377942 Luis Jonathan Rosas Ramos
#          A01377072 Emiliano Heredia García

  #An empty class used as abstract class.
  class Beverage
    
    #It doesnt initialize anything.
    def initialize

    end
  
    #An empty function.
    def description

    end
    
    #An empty function.
    def cost

    end
  
  end


  class DarkRoast < Beverage
    
    #It doesnt initialize anything.
    def initialize

    end
  
    #Return a string with the name of the Coffee.
    def description
        return "Dark Roast Coffee"
    end

    #Return the cost of this coffee.
    def cost
        return 0.99
    end
  
  end

  class Espresso < Beverage
    
    #It doesnt initialize anything.
    def initialize

    end
  
    #Return a string with the name of the Coffee.
    def description
        return "Espresso"
    end

    #Return the cost of this coffee.
    def cost
        return 1.99
    end
  
  end

  class HouseBlend < Beverage
    
    #It doesnt initialize anything.
    def initialize

    end
  
    #Return a string with the name of the Coffee.
    def description
        return "House Blend Coffee"
    end

    #Return the cost of this coffee.
    def cost
        return 0.89
    end
  
  end

  #An empty class used as abstract class. It inherits from Beverage class.
  class CondimentDecorator < Beverage
    
    #It doesnt initialize anything.
    def initialize

    end
  
    #An empty function.
    def description

    end

    #An empty function.
    def cost

    end
  
  end


  class Mocha < CondimentDecorator
    
    #It receives a Beverage instance to initialize it as private attribute.
    def initialize(beverage)
        @beverage=beverage
    end
  
    #It call internal attribute Beverage to concatenate a string of condiments and beverages.
    def description
        otherCondimentsAndBeverages=@beverage.description
        return otherCondimentsAndBeverages+", Mocha"
    end

    #It call internal attribute Beverage to accumulate all the costs of condiments and beverages.
    def cost
        otherCosts=@beverage.cost
        return otherCosts+0.20
    end
  
  end

  class Whip < CondimentDecorator
    
    #It receives a Beverage instance to initialize it as private attribute.
    def initialize(beverage)
        @beverage=beverage
    end

    #It call internal attribute Beverage to concatenate a string of condiments and beverages.
    def description
        otherCondimentsAndBeverages=@beverage.description
        return otherCondimentsAndBeverages+", Whip"
    end

    #It call internal attribute Beverage to accumulate all the costs of condiments and beverages.
    def cost
        otherCosts=@beverage.cost
        return otherCosts+0.10
    end
  
  end

  class Soy < CondimentDecorator
    
    #It receives a Beverage instance to initialize it as private attribute.
    def initialize(beverage)
        @beverage=beverage
    end
  
    #It call internal attribute Beverage to concatenate a string of condiments and beverages.
    def description
        otherCondimentsAndBeverages=@beverage.description
        return otherCondimentsAndBeverages+", Soy"
    end

    #It call internal attribute Beverage to accumulate all the costs of condiments and beverages.
    def cost
        otherCosts=@beverage.cost
        return otherCosts+0.15
    end
  
  end

  class Milk < CondimentDecorator
    
    #It receives a Beverage instance to initialize it as private attribute.
    def initialize(beverage)
        @beverage=beverage
    end
  
    #It call internal attribute Beverage to concatenate a string of condiments and beverages.
    def description
        otherCondimentsAndBeverages=@beverage.description
        return otherCondimentsAndBeverages+", Milk"
    end

    #It call internal attribute Beverage to accumulate all the costs of condiments and beverages.
    def cost
        otherCosts=@beverage.cost
        return otherCosts+0.10
    end
  
  end