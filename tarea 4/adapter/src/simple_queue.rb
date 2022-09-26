# Adapter Pattern
# Date: 26-Sep-2022
# Authors:
#          A01377950 Zabdiel Valentín Garduño Vivanco
#          A01377942 Luis Jonathan Rosas Ramos
#          A01377072 Emiliano Heredia García

# IMPORTANT: Do not modify the following class in any way!

#A class that implements First-In First-Out (FIFO) data structure
class SimpleQueue

    #initializes an empty array
    def initialize
      @info =[]
    end

    #Inserts x at the back of this queue. Returns this queue.
    def insert(x)
      @info.push(x)
      self
    end
  
    #Removes and returns the element at the front of this queue. Raises an exception if this queue happens to be empty.
    def remove
      if empty?
        raise "Can't remove if queue is empty"
      else
        @info.shift
      end
    end
  
    #Returns true if this queue is empty, otherwise returns false.
    def empty?
      @info.empty?
    end
  
    #Returns the number of elements currently stored in this queue.
    def size
      @info.size
    end
  
    #Prints the content of the current queue structure.
    def inspect
      @info.inspect
    end
  
end