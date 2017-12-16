class Bottles

  def song
    verses(99, 0)
  end

  def verses(starting, ending)
    starting.downto(ending).map {|i| verse(i)}.join("\n")
  end

  def verse(number)
    case number
    when 0
      "No more #{container(number)} of beer on the wall, " +
      "no more #{container(number)} of beer.\n" +
      "Go to the store and buy some more, " +
      "99 #{container(number)} of beer on the wall.\n"
    else
      "#{number} #{container(number)} of beer on the wall, " +
      "#{number} #{container(number)} of beer.\n" +
      "Take #{pronoun(number)} down and pass it around, " +
      "#{quantity(number - 1)} #{container(number - 1)} of beer on the wall.\n"
    end
  end

  def quantity(number)
    if number == 0
      "no more"
    else
      number
    end
  end

  def container(number)
    case number
    when 1
      "bottle"
    else
      "bottles"
    end
  end

  def pronoun(number)
    case number
    when 1
      "it"
    else
      "one"
    end
  end
end