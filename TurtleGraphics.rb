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
      super(1024, 768, false)
      self.caption = "Ruby TurtleGraphics"

      @objects = []
    end

    def update
      @objects.each do |object|
        object.update
      end
    end

    def add_object(object)
      @objects << object
    end

    def draw
      gl do
        glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT)
        glMatrixMode(GL_PROJECTION) 
        glLoadIdentity 
        gluPerspective(45.0, width / height, 0.1, 100.0)
        glMatrixMode(GL_MODELVIEW) 
        glLoadIdentity
        glPolygonMode( GL_FRONT_AND_BACK, GL_LINE )
        glTranslatef(0.0,0.0,-6.0)
        @objects.each do |object| 
          object.draw
        end
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
      @x = 0
      @y = 0
      @heading = 0.0
      @speed = 5
      @pen = 1
      @color = 'green'
      @direction = 1
    end

    def draw()
      glColor3f(0,1,0)
      glTranslatef(@x,@y,-6.0)
      glRotatef(@heading, 0.0, 0.0, 1.0)
      glBegin(GL_TRIANGLES) 
        glVertex3f(0.0, 0.1, 0.0)
        glVertex3f(-0.1,-0.1, 0.0)
        glVertex3f( 0.1,-0.1, 0.0)
      glEnd
    end

    def update()
      if @x >= 1
        @direction = -1
      elsif @x <= -1
        @direction = 1
      end
        
      @x = @x += @direction * 0.01
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



