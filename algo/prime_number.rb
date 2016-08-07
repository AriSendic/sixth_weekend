# Use RSpec to test the following exercise! You may wish to wrap the methods below in a class to help facilitate this.

# First, implement the is_prime? method below. It should accept a number as an argument and return
# true if the number is prime and false if it is not. A prime number is a number that is only
# divisible by itself and the number 1.
require "rspec"
class Prime
  def is_prime?(number)
    array = (2..number - 1).to_a
    array.each do |digit|
      if number % digit == 0
        @result = false
        break
      else
        @result = true
      end
    end
    @result
  end
# Second, implement the highest_prime_number_under method below. It should accept a number as
# an argument and return the highest prime number under that number. For example, the 
# highest prime number under 10 is 7.

  def highest_prime_number_under(number)
    array = (2..number - 1).to_a.reverse
    array.each do |digit|
      if is_prime?(digit) 
        @result = digit
        break
      end
    end
    @result
  end
end
RSpec.describe Prime do
  describe '#is_prime?' do
    it 'should return true for a prime number only' do
      p = Prime.new
      expect(p.is_prime?(9)).to eq(false)
      expect(p.is_prime?(5)).to eq(true)
      expect(p.is_prime?(2)).to eq(true)
      expect(p.is_prime?(49)).to eq(false)
    end
  end
  describe '#highest_prime_number_under' do
    it 'should return the highest prime number below itself' do
      p = Prime.new
      expect(p.highest_prime_number_under(10)).to eq(7)
      expect(p.highest_prime_number_under(61)).to eq(59)
      expect(p.highest_prime_number_under(7907)).to eq(7901)
    end
  end    
end   
