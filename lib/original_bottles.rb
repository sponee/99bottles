require 'pry'
class OriginalBottles

  def verse(starting_bottles_count)
    bottle_number = BottleNumber.new(starting_bottles_count)
    second_bottle_number = BottleNumber.new(starting_bottles_count - 1)
    return bottle_number.print_verse_line
  end

  def verses(starting_bottles_count, ending_bottles_count)
    starting_bottles_count.downto(ending_bottles_count).map { |bottles| verse(bottles) }.join("\n")
  end

  def song
    return verses(99, 0)
  end

  private

  def pluralize_bottle(bottles_count)
    BottleNumber.new(bottles_count).pluralize_bottle
  end

  def singularize_take(bottles_count)
    BottleNumber.new(bottles_count).singularize_take
  end

  def print_first_verse_line(bottles_count)
    BottleNumber.new(bottles_count).print_first_verse_line
  end

  def print_second_verse_line(bottles_count)
    BottleNumber.new(bottles_count).print_second_verse_line
  end
end

class BottleNumber
  attr_reader :bottle_number

  def initialize(bottle_number)
    @bottle_number = bottle_number
  end

  def pluralize_bottle
    if bottle_number == 0
      "no more bottles"
    elsif bottle_number == 1
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
    if @bottle_number == 0
      return "Take it"
    else
      return "Take one"
    end
  end

  def singularize_decremented_take
    if @bottle_number - 1 == 0
      return "Take it"
    else
      return "Take one"
    end
  end

  def print_verse_line
    if @bottle_number == 0
      "No more bottles of beer on the wall, no more bottles of beer.\n" + 
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    else
      "#{pluralize_bottle} of beer on the wall, #{pluralize_bottle} of beer.\n" + 
      "#{singularize_decremented_take} down and pass it around, #{pluralize_decremented_bottle} of beer on the wall.\n"
    end
  end
end