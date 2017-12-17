require 'pry'
class OriginalBottles

  def verse(starting_bottles_count)
    verse = print_first_verse_line(starting_bottles_count) + print_second_verse_line(starting_bottles_count - 1)
    return verse
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
    BottleNumber.new(bottles_count).singularize_take(bottles_count)
  end

  def print_first_verse_line(bottles_count)
    BottleNumber.new(bottles_count).print_first_verse_line(bottles_count)
  end

  def print_second_verse_line(bottles_count)
    BottleNumber.new(bottles_count).print_second_verse_line(bottles_count)
  end
end

class BottleNumber
  attr_reader :bottle_number

  def initialize(bottle_number)
    @bottle_number = bottle_number
  end

  def pluralize_bottle
    if @bottle_number == 1
      return "#{(@bottle_number)} bottle"
    elsif @bottle_number == 0
      return "no more bottles"
    elsif @bottle_number == 6
      return "1 six-pack"
    else
      return "#{(@bottle_number)} bottles"
    end
  end

  def singularize_take(bottles_count)
    if @bottle_number == 0
      return "Take it"
    else
      return "Take one"
    end
  end

  def print_first_verse_line(bottles_count)
    if @bottle_number > 0
      return "#{pluralize_bottle} of beer on the wall, #{pluralize_bottle} of beer.\n"
    else
      return "No more bottles of beer on the wall, no more bottles of beer.\n"
    end
  end

  def print_second_verse_line(bottles_count)
    if @bottle_number == -1
      return "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    else
      return "#{singularize_take(@bottle_number)} down and pass it around, #{pluralize_bottle} of beer on the wall.\n"
    end
  end
end