module TurtleGraphics
  require 'gosu'
  require 'gl'
  require 'glu'
  require 'glut'
  
  include Gl
  include Glu
  include Math

  class World < Gosu::Window
    def initialize
      super(800, 600, false)
      self.caption = "Ruby TurtleGraphics"
    end

    def update
    end

    def draw
      gl do
        glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT)
        glMatrixMode(GL_PROJECTION) 
        glLoadIdentity 
        gluPerspective(45.0, width / height, 0.1, 100.0)
        glMatrixMode(GL_MODELVIEW) 
        glLoadIdentity
        glTranslate(0, 0, -2) # Moving function from the current point by x,y,z change
        glColor(0,1,0)
        glBegin(GL_LINES) 
          glVertex3f(-0.25, 0.25, 0)
	  glVertex3f(-0.75, 0.75, 0)
        glEnd
      end
    end

    def button_down(id)
      if id == Gosu::KbEscape
        close
      end
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
      @heading = @heading - angle
    end

    def left(angle)
      @heading = @heading + angle
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



