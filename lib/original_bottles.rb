require 'pry'
class OriginalBottles

  def verse(starting_bottles_count)
    bottle_number = BottleNumber.for(starting_bottles_count)
    second_bottle_number = BottleNumber.for(starting_bottles_count - 1)
    return bottle_number.print_verse_line
  end

  def verses(starting_bottles_count, ending_bottles_count)
    starting_bottles_count.downto(ending_bottles_count).map { |bottles| verse(bottles) }.join("\n")
  end

  def song
    return verses(99, 0)
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
    else
      BottleNumber.new(number)
    end
  end

  def pluralize_bottle(bottle_number=@bottle_number)
    if bottle_number == 1
      return "#{(@bottle_number)} bottle"
    elsif bottle_number == 6
      return "1 six-pack"
    else
      return "#{(@bottle_number)} bottles"
    end
  end

  def pluralize_decremented_bottle
    if bottle_number - 1 == 0
      "no more bottles"
    elsif bottle_number - 1 == 1
      return "#{(@bottle_number - 1)} bottle"
    elsif bottle_number - 1 == 6
      return "1 six-pack"
    else
      return "#{(@bottle_number - 1)} bottles"
    end
  end

  def singularize_take
    return "Take one"
  end

  def singularize_decremented_take
    if @bottle_number - 1 == 0
      return "Take it"
    else
      return "Take one"
    end
  end

  def action
    "#{singularize_decremented_take} down and pass it around, #{pluralize_decremented_bottle} of beer on the wall.\n"
  end

  def print_verse_line
    "#{pluralize_bottle.capitalize} of beer on the wall, #{pluralize_bottle} of beer.\n" + 
    "#{action}"
  end
end

class BottleNumber0 < BottleNumber
  def pluralize_bottle
    "no more bottles"
  end

  def singularize_take
    "Take it"
  end

  def action
    "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
  end
end