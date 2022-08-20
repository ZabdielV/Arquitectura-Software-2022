# Template Method Pattern
# Date: 22-Aug-2022
# Authors:
#          A01377950 Zabdiel Valentín Garduño Vivanco 
#          A01377942 Luis Jonathan Rosas Ramos
#          A01377072 Emiliano Heredia García


class Student

    include Enumerable
    # Note: This class does not support the max, min, 
    # or sort methods.
  
    def initialize(id, name, grades)
      @id = id
      @name = name
      @grades = grades
    end
  
    def inspect
      "Student(#{@id}, #{@name.inspect})"
    end
  
    def grade_average
      @grades.inject(:+)/@grades.size
    end
  
    def each &block
      yield @id
      yield @name
      @grades.each(&block)
      yield grade_average
    end
  
  end