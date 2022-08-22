# Template Method Pattern
# Date: 22-Aug-2022
# Authors:
#          A01377950 Zabdiel Valentín Garduño Vivanco 
#          A01377942 Luis Jonathan Rosas Ramos
#          A01377072 Emiliano Heredia García

# This class is a parent class to inherit the functionalities to create tables
# It has header and data variables.
class TableGenerator

    #Returns an instance of the object given the header and data
    def initialize(header, data)
      @header = header
      @data = data
    end
  
    #Generates a teble.
    def generate
      generate_header_row + (@data.map {|x| generate_row(x)}).join
    end
  
    #Generates the header row
    def generate_header_row
      (@header.map {|x| generate_header_item(x)}).join
    end

    # Generates an item
    def generate_item(item)
      item
    end
  
    #Generates a row,
    def generate_row(row)
      (row.map {|x| generate_item(x)}).join
    end
  
    #Generates an item header.
    def generate_header_item(item)
      item
    end
  
end
  # This class generates a csv table. It inherits from tableGenerator
  class CSVTableGenerator < TableGenerator
  
    # This functions overwrites the tableGenerator generate_row.
    def generate_row(row)
      "#{(row.map {|x| generate_item(x)}).join(',')}\n"
    end
  
    # This functions overwrites the tableGenerator generate_header_row.
    def generate_header_row
      generate_row(@header)
    end
  
  end

  # This class generates a HTML Table. It inherits from TableGenerator
  class HTMLTableGenerator < TableGenerator

    # This functions overwrites the tableGenerator generate_row
    def generate_row(row)
      "<tr>#{(row.map {|x| "<td>#{x}</td>" }).join}</tr>\n"
    end

    # This functions overwrites the tableGenerator generate_header_row
    def generate_header_row
     "<tr>" +(@header.map {|x| "<th>#{x}</th>" }).join+"</tr>\n"
    end

    # This functions overwrites the tableGenerator generate
    def generate

      "<table>\n"+generate_header_row + (@data.map {|x| generate_row(x)}).join+"</table>\n"
    end

  end


  # This class generates a Ascii Table. It inherits from TableGenerator
  class AsciiDocTableGenerator < TableGenerator

    # This functions overwrites the tableGenerator generate_row
    def generate_row(row)
      "#{(row.map {|x| "|#{x}" }).join}\n"
    end

    # This functions overwrites the tableGenerator generate_header_row
    def generate_header_row
      (@header.map {|x| "|#{x}" }).join+"\n"
    end

    # This functions overwrites the tableGenerator generate
    def generate
      textoInicio="[options=\"header\"]\n" +"|==========\n"
      textoFinal="|==========\n"

      textoInicio+generate_header_row + (@data.map {|x| generate_row(x)}).join+textoFinal
    end


  end