# Each new term in the Fibonacci sequence is generated by adding the previous two terms. By starting with 1 and 2, the first 10 terms will be:

#   1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...

# By considering the terms in the Fibonacci sequence whose values do not exceed four million, find the sum of the even-valued terms.

class FibonacciSequence
  attr_accessor :max
  attr_reader :sequence

  def initialize( max_value )
    @max = max_value
    @sequence = []
  end

  def calculate_sequence
    loop do
      num1 = sequence[-1] || 0
      num2 = sequence[-2] || 1
      new_num = num1 + num2
      return if new_num > max
      sequence << new_num
    end
  end

  def even_numbers_in_sequence
    sequence.select{|x| x.even? }
  end

  def sum_of_even_values
    even_numbers_in_sequence.inject(:+)
  end
end

seq = FibonacciSequence.new( 4_000_000 )
seq.calculate_sequence
puts seq.sum_of_even_values