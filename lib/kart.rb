require "rubygems"


class Ciro
  def initialize
      @hedef = 1800000
      @gerceklesen = 1442158
  end

  def hedef
    @hedef
  end

  def gerceklesen
    @gerceklesen
  end

  def basari
    ( @hedef / @gerceklesen )  * 100
  end 
  
end