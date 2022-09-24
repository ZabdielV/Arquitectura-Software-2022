# Adapter Pattern
# Date: 26-Sep-2022
# Authors:
#          A01377950 Zabdiel Valentín Garduño Vivanco
#          A01377942 Luis Jonathan Rosas Ramos
#          A01377072 Emiliano Heredia García



class QueueAdapter
  attr_reader :queue

    def initialize(q)
      @queue=q
    end

    def push(x)
      @queue.insert(x)
      self
    end

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

    def peek
      if @queue.empty?
        nil
      else
        element=self.pop
        @queue.insert(element)
        element
      end
    end

    def empty?
      @queue.empty?
    end

    def size
      @queue.size
    end
    
    def inspect
      @queue.inspect
    end
  
end