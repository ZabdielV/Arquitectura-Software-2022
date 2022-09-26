# Adapter Pattern
# Date: 26-Sep-2022
# Authors:
#          A01377950 Zabdiel Valentín Garduño Vivanco
#          A01377942 Luis Jonathan Rosas Ramos
#          A01377072 Emiliano Heredia García


#This class allows simple_queue to act as Last-In First-Out (LIFO) stack
class QueueAdapter
  attr_reader :queue

  #Initializes a queue as attribute to act as stack.
    def initialize(q)
      @queue=q
    end
    
    #Inserts x at the top of this stack. Returns this stack.
    def push(x)
      @queue.insert(x)
      self
    end

    #Returns nil if this stack is empty, otherwise removes and returns its top element.
    def pop
      if @queue.empty?
        nil
      else
        for a in 1..@queue.size-1
          element_removed=@queue.remove
          @queue.insert(element_removed)
        end
        @queue.remove
      end
    end


    #Returns nil if this stack is empty, otherwise returns its top element without removing it.
    def peek
      if @queue.empty?
        nil
      else
        element=self.pop
        @queue.insert(element)
        element
      end
    end
    #Returns true if this stack is empty, otherwise returns false.
    def empty?
      @queue.empty?
    end

    #Returns the number of elements currently stored in this stack.
    def size
      @queue.size
    end
    
    #Prints the content of the current stack structure.
    def inspect
      @queue.inspect
    end
  
end