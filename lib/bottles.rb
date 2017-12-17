class Bottles

  def song
    verses(99, 0)
  end

  def verses(starting, ending)
    starting.downto(ending).map {|i| verse(i)}.join("\n")
  end

  def verse(number)
    bottle_number           = BottleNumber.for(number)
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

  def self.for(number)
    case number 
    when 0
      BottleNumber0
    when 1
      BottleNumber1
    else
      BottleNumber
    end.new(number)
  end

  def successor
    BottleNumber.for(number - 1)
  end

  def action
    "Take #{pronoun} down and pass it around, "
  end

  def quantity
    number.to_s
  end

  def container
    "bottles"
  end

  def pronoun
    "one"
  end

  def to_s
    "#{quantity} #{container}"
  end
end

class BottleNumber0 < BottleNumber
  def successor
    BottleNumber.for(99)
  end

  def action
    "Go to the store and buy some more, "
  end

  def quantity
    "no more"
  end
end

class BottleNumber1 < BottleNumber
  def container
    "bottle"
  end

  def pronoun
    "it"
  end
end