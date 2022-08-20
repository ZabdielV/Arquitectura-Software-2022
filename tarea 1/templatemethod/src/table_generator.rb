# Template Method Pattern
# Date: 22-Aug-2022
# Authors:
#          A01377950 Zabdiel Valentín Garduño Vivanco 
#          A01377942 Luis Jonathan Rosas Ramos
#          A01377072 Emiliano Heredia García


class TableGenerator

    def initialize(header, data)
      @header = header
      @data = data
    end
  
    def generate
      generate_header_row + (@data.map {|x| generate_row(x)}).join
    end
  
    def generate_header_row
      (@header.map {|x| generate_header_item(x)}).join
    end
  
    def generate_item(item)
      item
    end
  
    def generate_row(row)
      (row.map {|x| generate_item(x)}).join
    end
  
    def generate_header_item(item)
      item
    end
  
end
  
  class CSVTableGenerator < TableGenerator
  
    def generate_row(row)
      "#{(row.map {|x| generate_item(x)}).join(',')}\n"
    end
  
    def generate_header_row
      generate_row(@header)
    end
  
  end


  class HTMLTableGenerator < TableGenerator

    def generate_row(row)
      "<tr>#{(row.map {|x| "<td>#{x}</td>" }).join}</tr>\n"
    end

    def generate_header_row
     "<tr>" +(@header.map {|x| "<th>#{x}</th>" }).join+"</tr>\n"
    end

    def generate

      "<table>\n"+generate_header_row + (@data.map {|x| generate_row(x)}).join+"</table>\n"
    end

  end


  
  class AsciiDocTableGenerator < TableGenerator

    def generate_row(row)
      "#{(row.map {|x| "|#{x}" }).join}\n"
    end


    def generate_header_row
      (@header.map {|x| "|#{x}" }).join+"\n"
    end

    def generate
      textoInicio="[options=\"header\"]\n" +"|==========\n"
      textoFinal="|==========\n"

      textoInicio+generate_header_row + (@data.map {|x| generate_row(x)}).join+textoFinal
    end


  end