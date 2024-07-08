# app/models/string_calculator.rb

class StringCalculator
  def self.add(numbers)
    return 0 if numbers.blank?
    
    delimiter = ","
    if numbers.start_with?("//")
      delimiter = numbers[2]
      numbers = numbers[(numbers.index("\n") + 1)..-1]
    end
    
    numbers.split(/[\n#{delimiter}]/).map(&:to_i).sum
  end
end
