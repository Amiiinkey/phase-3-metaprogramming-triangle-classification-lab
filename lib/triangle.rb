
class Triangle
    class TriangleError < StandardError
    end
  
    def initialize(side1, side2, side3)
      @sides = [side1, side2, side3].sort
      validate_triangle
    end
  
    def kind
      case @sides.uniq.size
      when 1 then :equilateral
      when 2 then :isosceles
      else :scalene
      end
    end
  
    private
  
    def validate_triangle
      raise TriangleError, "Illegal triangle" if @sides.any? { |s| s <= 0 }
      raise TriangleError, "Triangle inequality violated" if @sides[0] + @sides[1] <= @sides[2]
    end
  end
  