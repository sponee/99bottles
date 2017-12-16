require 'pry'
class OriginalBottles

  def verse(starting_bottles_count)
    verse = print_first_verse_line(starting_bottles_count) + print_second_verse_line(starting_bottles_count -= 1)
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
    if bottles_count == 1
      return "#{(bottles_count)} bottle"
    elsif bottles_count == 0
      return "no more bottles"
    else
      return "#{(bottles_count)} bottles"
    end
  end

  def singularize_take(bottles_count)
    if bottles_count == 0
      return "Take it"
    else
      return "Take one"
    end
  end

  def print_first_verse_line(bottles_count)
    if bottles_count > 0
      return "#{pluralize_bottle(bottles_count)} of beer on the wall, #{pluralize_bottle(bottles_count)} of beer.\n"
    else
      return "No more bottles of beer on the wall, no more bottles of beer.\n"
    end
  end

  def print_second_verse_line(bottles_count)
    if bottles_count > -1
      return "#{singularize_take(bottles_count)} down and pass it around, #{pluralize_bottle(bottles_count)} of beer on the wall.\n"
    else
      return "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    end
  end
end