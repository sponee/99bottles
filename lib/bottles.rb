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
      "#{quantity(number).capitalize} #{container(number)} of beer on the wall, " +
      "#{quantity(number)} #{container(number)} of beer.\n" +
      "#{action(number)}" +
      "#{quantity(successor(number))} #{container(successor(number))} of beer on the wall.\n"
    else
      "#{quantity(number).capitalize} #{container(number)} of beer on the wall, " +
      "#{quantity(number)} #{container(number)} of beer.\n" +
      "#{action(number)}" +
      "#{quantity(successor(number))} #{container(successor(number))} of beer on the wall.\n"
    end
  end

  def successor(number)
    if number == 0
      99
    else
      number - 1
    end
  end

  def action(number)
    case number
    when 0
      "Go to the store and buy some more, "
    else
      "Take #{pronoun(number)} down and pass it around, "
    end
  end

  def quantity(number)
    if number == 0
      "no more"
    else
      number.to_s
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