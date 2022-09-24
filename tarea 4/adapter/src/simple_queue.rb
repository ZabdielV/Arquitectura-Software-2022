# Adapter Pattern
# Date: 26-Sep-2022
# Authors:
#          A01377950 Zabdiel Valentín Garduño Vivanco
#          A01377942 Luis Jonathan Rosas Ramos
#          A01377072 Emiliano Heredia García

# IMPORTANT: Do not modify the following class in any way!

class SimpleQueue

    def initialize
      @info =[]
    end
  
    def insert(x)
      @info.push(x)
      self
    end
  
    def remove
      if empty?
        raise "Can't remove if queue is empty"
      else
        @info.shift
      end
    end
  
    def empty?
      @info.empty?
    end
  
    def size
      @info.size
    end
  
    def inspect
      @info.inspect
    end
  
end