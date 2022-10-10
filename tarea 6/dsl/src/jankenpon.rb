# Domain-Specific Language Pattern
# Date: 10-Oct-2022
# Authors:
#          A01377950 Zabdiel Valentín Garduño Vivanco
#          A01377942 Luis Jonathan Rosas Ramos
#          A01377072 Emiliano Heredia García



# This class model the Spock weapon
class SpockWeapon

  # This method prints this class.
  def weapon
      "Spock"
  end

  #This method verifies which weapon won with many comparisons. It returns itself so it can print who won.
  #If this class doesn't win, then it call the funtion from the other weapon. 
  def +(weapon)

      if weapon == Scissors
          puts "Spock smashes Scissors (winner Spock)"
          return self
      elsif weapon == Spock
          puts "Spock tie (winner Spock)"
          return self
      elsif weapon == Rock
          puts "Spock vaporizes Rock (winner Spock)"
          return self
      else
          return weapon + self
      end
  end

  #This method verifies which weapon lost with many comparisons. It returns itself so it can print who lost.
  #If this class doesn't lose, then it call the funtion from the other weapon. 
  def -(weapon)
      if weapon == Lizard
          puts "Lizard poisons Spock (loser Spock)"
          return self
      elsif weapon == Paper
          puts "Paper disproves Spock (loser Spock)"
          return self
      elsif weapon == Spock
          puts "Spock tie (loser Spock)"
          return self
      else
          return weapon - self
      end
  end
end

# This class model the Lizard weapon
class LizardWeapon

  # This method prints this class.
  def weapon
      "Lizard"
  end

  #This method verifies which weapon won with many comparisons. It returns itself so it can print who won.
  #If this class doesn't win, then it call the funtion from the other weapon. 
  def +(weapon)
      if weapon == Spock
          puts "Lizard poisons Spock (winner Lizard)"
          return self
      elsif weapon == Lizard
          puts "Lizard tie (winner Lizard)"
          return self
      elsif weapon == Paper
          puts "Lizard eats Paper (winner Lizard)"
          return self
      else
          return weapon + self
      end
  end


  #This method verifies which weapon lost with many comparisons. It returns itself so it can print who lost.
  #If this class doesn't lose, then it call the funtion from the other weapon. 
  def -(weapon)
      if weapon == Rock
          puts "Rock crushes Lizard (loser Lizard)"
          return self
      elsif weapon == Lizard
          puts "Lizard tie (loser Lizard)"
          return self
      elsif weapon == Scissors
          puts "Scissors decapitate Lizard (loser Lizard)"
          return self
      else
          return weapon - self
      end
  end

end


# This class model the Paper weapon
class PaperWeapon

# This method prints this class.
  def weapon
      "Paper"
  end

  #This method verifies which weapon won with many comparisons. It returns itself so it can print who won.
  #If this class doesn't win, then it call the funtion from the other weapon. 
  def +(weapon)
      if weapon == Spock
          puts "Paper disproves Spock (winner Paper)"
          return self
      elsif weapon == Paper
          puts "Paper tie (winner Paper)"
          return self
      elsif weapon == Rock
          puts "Paper covers Rock (winner Paper)"
          return self
      else
          return weapon + self
      end
  end


  #This method verifies which weapon lost with many comparisons. It returns itself so it can print who lost.
  #If this class doesn't lose, then it call the funtion from the other weapon. 
  def -(weapon)
      if weapon == Lizard
          puts "Lizard eats Paper (loser Paper)"
          return self
      elsif weapon == Paper
          puts "Paper tie (loser Paper)"
          return self
      elsif weapon == Scissors
          puts "Scissors cut Paper (loser Paper)"
          return self
      else
          return weapon - self
      end
  end
end

# This class model the Scissor weapon
class ScissorsWeapon

# This method prints this class.
  def weapon
      "Scissors"
  end

  #This method verifies which weapon won with many comparisons. It returns itself so it can print who won.
  #If this class doesn't win, then it call the funtion from the other weapon. 
  def +(weapon)
      if weapon == Paper
          puts "Scissors cut Paper (winner Scissors)"
          return self
      elsif weapon == Scissors
          puts "Scissors tie (winner Scissors)"
          return self
      elsif weapon == Lizard
          puts "Scissors decapitate Lizard (winner Scissors)"
          return self
      else
          return weapon + self
      end
  end


  #This method verifies which weapon lost with many comparisons. It returns itself so it can print who lost.
  #If this class doesn't lose, then it call the funtion from the other weapon. 
  def -(weapon)
      if weapon == Rock
          puts "Rock crushes Scissors (loser Scissors)"
          return self

      elsif weapon == Scissors
          puts "Scissors tie (loser Scissors)"
          return self
      elsif weapon == Spock
          puts "Spock smashes Scissors (loser Scissors)"
          return self
      else
          return weapon - self
      end
  end
end


# This class model the Rock weapon
class RockWeapon

# This method prints this class.
  def weapon
      "Rock"
  end

  #This method verifies which weapon won with many comparisons. It returns itself so it can print who won.
  #If this class doesn't win, then it call the funtion from the other weapon. 
  def +(weapon)
      if weapon == Scissors
          puts "Rock crushes Scissors (winner Rock)"
          return self
      elsif weapon == Rock
          puts "Rock tie (winner Rock)"
          return self
      elsif weapon == Lizard
          puts "Rock crushes Lizard (winner Rock)"
          return self
      else
          return weapon + self
      end
  end


  #This method verifies which weapon lost with many comparisons. It returns itself so it can print who lost.
  #If this class doesn't lose, then it call the funtion from the other weapon. 
  def -(weapon)
      if weapon == Spock
          puts "Spock vaporizes Rock (loser Rock)"
          return self
      elsif weapon == Rock
          puts "Rock tie (loser Rock)"
          return self
      elsif weapon == Paper
          puts "Paper covers Rock (loser Rock)"
          return self
      else
          return weapon - self
      end
  end
end


# Method that prints who won among all weapons.
def show(expression)
  puts "Result = #{expression.weapon}"
end

# Declare literals constants.
Scissors = ScissorsWeapon.new
Lizard = LizardWeapon.new
Paper = PaperWeapon.new
Spock = SpockWeapon.new
Rock = RockWeapon.new