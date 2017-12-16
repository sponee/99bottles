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
    when 1
      "#{number} #{container(number)} of beer on the wall, " +
      "#{number} #{container(number)} of beer.\n" +
      "Take it down and pass it around, " +
      "no more #{container(number - 1)} of beer on the wall.\n"
    else
      "#{number} #{container(number)} of beer on the wall, " +
      "#{number} #{container(number)} of beer.\n" +
      "Take one down and pass it around, " +
      "#{number-1} #{container(number - 1)} of beer on the wall.\n"
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
end