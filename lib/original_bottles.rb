require 'pry'
class OriginalBottles

  def verse(starting_bottles_count)
    bottle_number = BottleNumber.for(starting_bottles_count)
    bottle_number.print_verse_line
  end

  def verses(starting_bottles_count, ending_bottles_count)
    starting_bottles_count.downto(ending_bottles_count).map { |bottles| verse(bottles) }.join("\n")
  end

  def song
    verses(99, 0)
  end
end

class BottleNumber
  attr_reader :bottle_number

  def initialize(bottle_number)
    @bottle_number = bottle_number
  end

  def self.for(number)
    case number
    when 0
      BottleNumber0.new(0)
    when 1
      BottleNumber1.new(1)
    when 6
      BottleNumber6.new(6)
    else
      BottleNumber.new(number)
    end
  end

  def successor
    BottleNumber.for(bottle_number - 1)
  end

  def pluralize_bottle
    "#{(@bottle_number)} bottles"
  end

  def singularize_take
    "Take one"
  end

  def action
    "#{successor.singularize_take} down and pass it around, #{successor.pluralize_bottle} of beer on the wall.\n"
  end

  def print_verse_line
    "#{pluralize_bottle.capitalize} of beer on the wall, #{pluralize_bottle} of beer.\n" + 
    "#{action}"
  end
end

class BottleNumber0 < BottleNumber
  def successor
    BottleNumber.new(99)
  end

  def pluralize_bottle
    "no more bottles"
  end

  def singularize_take
    "Take it"
  end

  def action
    "Go to the store and buy some more, #{successor.bottle_number} bottles of beer on the wall.\n"
  end
end

class BottleNumber1 < BottleNumber
  def pluralize_bottle
    "#{(@bottle_number)} bottle"
  end
end

class BottleNumber6 < BottleNumber
  def pluralize_bottle
    "1 six-pack"
  end
end