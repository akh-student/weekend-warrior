# hamming.rb

class Hamming

  def initialize

  end

  def self.compute(input1, input2)
    raise ArgumentError if input1.length != input2.length

    if input1 == input2
      return 0
    end

    differences = 0
    place = 0

    input1.length.times do
      if input1[place] != input2[place]
        differences += 1
      end
      place += 1
    end

    return differences

  end

end
