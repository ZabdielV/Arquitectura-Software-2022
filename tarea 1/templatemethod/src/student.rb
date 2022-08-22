# Template Method Pattern
# Date: 22-Aug-2022
# Authors:
#          A01377950 Zabdiel Valentín Garduño Vivanco
#          A01377942 Luis Jonathan Rosas Ramos
#          A01377072 Emiliano Heredia García

# A class that models a student. It contains id, name and grades.
class Student

    include Enumerable
    # Note: This class does not support the max, min,
    # or sort methods.

    # Creates a student instance with the given id, name and grades.
    def initialize(id, name, grades)
      @id = id
      @name = name
      @grades = grades
    end

    #Returns the student id with the name.
    def inspect
      "Student(#{@id}, #{@name.inspect})"
    end

    #Returns the grade avarage of the student.
    def grade_average
      @grades.inject(:+)/@grades.size
    end

    #Returns the id, name, iterates the grades and also returns the grade avarage.
    def each &block
      yield @id
      yield @name
      @grades.each(&block)
      yield grade_average
    end

  end