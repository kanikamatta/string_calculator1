# app/models/string_calculator.rb

class StringCalculator
  def self.add(numbers)
    return 0 if numbers.blank?
    
    numbers.split(/[\n,]/).map(&:to_i).sum
  end
end
