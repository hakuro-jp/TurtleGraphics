module TurtleGraphics
  include Math
  class Plane
    attr_accessor :space
    def initialize()
      @space = Array.new(200) { Array.new(200) }
    end
  end

  class Turtle
    attr_accessor :x
    attr_accessor :y
    attr_accessor :heading
    attr_accessor :speed
    attr_accessor :pen
    attr_accessor :color

    def initialize()
      @x = 50
      @y = 50
      @heading = 0.0
      @speed = 5
      @pen = 1
      @color = 'green'
    end

    def right(angle)
      @heading = @heading + angle
    end

    def left(angle)
      @heading = @heading - angle
    end

    def forward(dist)
      @x = @x + dist*cos(@heading).round(0)
      @y = @y + dist*sin(@heading).round(0)
    end

    def backward(dist)
      @x = @x - dist*cos(@heading).round(0)
      @y = @y - dist*sin(@heading).round(0)
    end

    alias :fd :forward
    alias :bd :backward
  end
end

#simple test for classes
world = TurtleGraphics::Plane.new()

turtle = TurtleGraphics::Turtle.new()
junior = TurtleGraphics::Turtle.new()

