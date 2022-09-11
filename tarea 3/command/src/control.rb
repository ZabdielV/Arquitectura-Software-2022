# Command Pattern
# Date: 12-Sep-2022
# Authors:
#          A01377950 Zabdiel Valentín Garduño Vivanco
#          A01377942 Luis Jonathan Rosas Ramos
#          A01377072 Emiliano Heredia García

#Class that initializes arrays to make reference to "on" and "off" buttons and removes the last pushed button.
class RemoteControlWithUndo
    #It initializes two arrays to save reference of "on" and "off" classes.
    #no_command is and empty class that is saved seven times in the arrays and @undo_command attribute.
    def initialize
      @on_commands = []
      @off_commands = []
      no_command = NoCommand.new
      7.times do
        @on_commands << no_command
        @off_commands << no_command
      end
      @undo_command = no_command
    end
  
    #It saves a reference of two classes in the internal arrays in a specific index. 
    def set_command(slot, on_command, off_command)
      @on_commands[slot] = on_command
      @off_commands[slot] = off_command
    end

    #It calls the "on" execute method of an on_commands element in a specific index. 
    def on_button_was_pushed(slot)
      @on_commands[slot].execute
      @undo_command = @on_commands[slot]
    end
  
    #It calls the "off" execute method of an on_commands element in a specific index. 
    def off_button_was_pushed(slot)
      @off_commands[slot].execute
      @undo_command = @off_commands[slot]
    end
  
    #It removes the last pushed button.
    def undo_button_was_pushed()
      @undo_command.undo
    end
  
    #It prints which classes are in the on_commands and off_commands arrays.
    def inspect
      string_buff = ["\n------ Remote Control -------\n"]
      @on_commands.zip(@off_commands) \
          .each_with_index do |commands, i|
        on_command, off_command = commands
        string_buff << \
        "[slot #{i}] #{on_command.class}  " \
          "#{off_command.class}\n"
      end
      string_buff << "[undo] #{@undo_command.class}\n"
      string_buff.join
    end
  
end
  
  #This class doesn't add any value, it is used to fill empty arrays.
  class NoCommand
  
    def execute
    end
  
    def undo
    end
  
  end
  
  #A class that emulates the behaviour of light with "on", "off" and "dim" buttons.
  class Light
    
    attr_reader :level
  
    def initialize(location)
      @location = location
      @level = 0
    end
  
    def on
      @level = 100
      puts "Light is on"
    end
  
    def off
      @level = 0
      puts "Light is off"
    end
  
    def dim(level)
      @level = level
      if level == 0
        off
      else
        puts "Light is dimmed to #{@level}%"
      end
    end
  
  end
  
  #A class that emulates the behaviour of Fan with "high", "medium","low" and "off" buttons.
  class CeilingFan
  
    # Access these constants from outside this class as
    # CeilingFan::HIGH, CeilingFan::MEDIUM, and so on.
    HIGH   = 3
    MEDIUM = 2
    LOW    = 1
    OFF    = 0
  
    attr_reader :speed
  
    def initialize(location)
      @location = location
      @speed = OFF
    end
  
    def high
      @speed = HIGH
      puts "#{@location} ceiling fan is on high"
    end
  
    def medium
      @speed = MEDIUM
      puts "#{@location} ceiling fan is on medium"
    end
  
    def low
      @speed = LOW
      puts "#{@location} ceiling fan is on low"
    end
  
    def off
      @speed = OFF
      puts "#{@location} ceiling fan is off"
    end
  
  end

  
  class LightOnCommand
  
    #This method initializes a light instance.
    attr_reader :light
    def initialize(light)
     @light=light
    end

    #This method executes "on" light method.
    def execute
        @light.on
    end
  
    #This method removes the "on" light method.
    def undo
        @light.off
    end
  
  end

  class LightOffCommand
  
    attr_reader :light

    #This method initializes a light instance.
    def initialize(light)
     @light=light
    end

    #This method executes "off" light method.
    def execute
        @light.off
    end
    
    #This method removes the "off" light method.
    def undo
        @light.on
    end
  
  end

  
  class CeilingFanHighCommand
  
    #This method initializes a fan light instance.
    attr_reader :fan, :speedBeforeExecute
    def initialize(fan)
     @fan=fan
    end

    #This method saves a reference of the fan's speed before changing it to high.
    def execute
        @speedBeforeExecute=@fan.speed
        @fan.high
    end
  
    #This method compares speed before change with CeilingFan constants to change it.
    def undo
        if @speedBeforeExecute ==CeilingFan::HIGH
            @fan.high
        elsif @speedBeforeExecute ==CeilingFan::MEDIUM
            @fan.medium
        elsif @speedBeforeExecute ==CeilingFan::LOW
            @fan.low
        elsif @speedBeforeExecute ==CeilingFan::OFF
            @fan.off
        end
    end
  
  end

  class CeilingFanMediumCommand
  
    attr_reader :fan, :speedBeforeExecute

    #This method initializes a fan light instance.
    def initialize(fan)
     @fan=fan
    end

    #This method saves a reference of the fan's speed before changing it to medium.
    def execute
        @speedBeforeExecute=@fan.speed
        @fan.medium
    end
  
    #This method compares speed before change with CeilingFan constants to change it.
    def undo
        if @speedBeforeExecute ==CeilingFan::HIGH
            @fan.high
        elsif @speedBeforeExecute ==CeilingFan::MEDIUM
            @fan.medium
        elsif @speedBeforeExecute ==CeilingFan::LOW
            @fan.low
        elsif @speedBeforeExecute ==CeilingFan::OFF
            @fan.off
        end
    end
  
  end

  class CeilingFanOffCommand
  
    attr_reader :fan, :speedBeforeExecute

    #This method initializes a fan light instance.
    def initialize(fan)
     @fan=fan
    end

    #This method saves a reference of the fan's speed before changing it to off.
    def execute
        @speedBeforeExecute=@fan.speed
        @fan.off
    end
  
    #This method compares speed before change with CeilingFan constants to change it.
    def undo
        #puts("The last speed was #{fan.speed}")
        if @speedBeforeExecute ==CeilingFan::HIGH
            @fan.high
        elsif @speedBeforeExecute ==CeilingFan::MEDIUM
            @fan.medium
        elsif @speedBeforeExecute ==CeilingFan::LOW
            @fan.low
        elsif @speedBeforeExecute ==CeilingFan::OFF
            @fan.off
        end
    end
  
  end