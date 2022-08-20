require 'table_generator'
require 'student'

headerNums = %w{Snap Crackle Pop}


dataNums = [[10, 20, 30],
                 [12, 64, 13],
                 [34, 11, 29],
                 [99, 15, 34]]



#csv_ejemplo = CSVTableGenerator.new(headerNums,dataNums)

#puts(csv_ejemplo.generate)


# Ejemplo con html

headerHtml = %w{Snap Crackle Pop}


dataHtml = [[10, 20, 30],
                 [12, 64, 13],
                 [34, 11, 29],
                 [99, 15, 34]]


#puts(HTMLTableGenerator.new(headerNums,dataNums).generate)

headerStudents = %w{id name grade1 grade2 grade3 average}
dataStudents = [Student.new(123,
                             "Selma Bouvier",
                             [71, 84, 89]),
                 Student.new(241,
                             "Carl Carlson",
                             [78, 85, 90]),
                 Student.new(299,
                             "Todd Flanders",
                             [67, 71, 77]),
                 Student.new(311,
                             "Barney Gumble",
                             [24, 18, 35]),
                 Student.new(427,
                             "Edna Krabappel",
                             [92, 95, 99]),
                 Student.new(666,
                             "Damien Thorn",
                             [66, 66, 66]),
                 Student.new(718,
                             "Manjula Nahasapeemapetilon",
                             [53, 72, 88])]

#puts(HTMLTableGenerator.new(headerStudents,dataStudents).generate)




# Ejemplo con ascii

#puts(AsciiDocTableGenerator.new(headerNums,dataNums).generate)

#puts(AsciiDocTableGenerator.new(headerStudents,dataStudents).generate)