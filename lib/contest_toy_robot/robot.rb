module ContestToyRobot
   class Robot
      attr_reader :x_position, :y_position, :direction

      COMMANDS = {
         /^PLACE\s+(?<x>[0-4]),(?<y>[0-4]),(?<facing>NORTH|SOUTH|WEST|EAST)$/ => :place,
         /^MOVE$/ => :move,
         /^LEFT$/ => :left,
         /^RIGHT$/ => :right,
         /^REPORT$/ => :report,
      }

      def placed?
         not (!@x_position || !@y_position || !@direction)
      end

      def do command
         (method_name, args) = COMMANDS.reduce(nil) do |result, (re, method_name)|
            next result if result

            match = re.match(command)
            match && [ method_name, match[1..-1] ] || nil
         end

         method_name && method(method_name)[*args]
      end

      def place x, y, facing
         @x_position = x.to_i
         @y_position = y.to_i
         @direction = facing.downcase.to_sym
      end

      def move
         case @direction
         when :east
            @x_position += 1 if @x_position < 4
         when :west
            @x_position -= 1 if @x_position > 0
         when :north
            @y_position += 1 if @y_position < 4
         when :south
            @y_position -= 1 if @y_position > 0
         end if placed?
      end

      def left
         case @direction
         when :east
            @direction = :north
         when :west
            @direction = :south
         when :north
            @direction = :west
         when :south
            @direction = :east
         end if placed?
      end

      def right
         case @direction
         when :east
            @direction = :south
         when :west
            @direction = :north
         when :north
            @direction = :east
         when :south
            @direction = :west
         end if placed?
      end

      def report
         $stdout.puts("#{@x_position},#{@y_position},#{@direction.to_s.upcase}") if placed?
      end
   end
end
