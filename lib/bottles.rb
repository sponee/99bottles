class Bottles

  def song
    verses(99, 0)
  end

  def verses(starting, ending)
    starting.downto(ending).map {|i| verse(i)}.join("\n")
  end

  def verse(number)
    bottle_number           = BottleNumber.new(number)
    successor_bottle_number = bottle_number.successor

    "#{bottle_number.to_s.capitalize} of beer on the wall, " +
    "#{bottle_number.to_s} of beer.\n" +
    "#{bottle_number.action}" +
    "#{successor_bottle_number.to_s} of beer on the wall.\n"
  end
end

class BottleNumber
  attr_reader :number

  def initialize(number)
    @number = number
  end

  def successor
    if number == 0
      BottleNumber.new(99)
    else
      BottleNumber.new(number - 1)
    end
  end

  def action
    if number == 0
      "Go to the store and buy some more, "
    else
      "Take #{pronoun} down and pass it around, "
    end
  end

  def quantity
    if number == 0
      "no more"
    else
      number.to_s
    end
  end

  def container
    if number == 1
      "bottle"
    else
      "bottles"
    end
  end

  def pronoun
    if number == 1
      "it"
    else
      "one"
    end
  end

  def to_s
    "#{quantity} #{container}"
  end
end
