# app/models/string_calculator.rb

class StringCalculator
  def self.add(numbers)
    return 0 if numbers.blank?
    
    delimiter = ","
    if numbers.start_with?("//")
      delimiter_section = numbers[2..]
      delimiter_list = delimiter_section.scan(/\[([^\[\]]+)\]/).flatten
      if delimiter_list.any?
        delimiter = Regexp.union(delimiter_list.map { |d| Regexp.escape(d) })
      else
        delimiter = delimiter_section[0]
      end
      numbers = numbers[(numbers.index("\n") + 1)..-1]
    end
    
    numbers_arr = numbers.split(/[\n#{delimiter}]/).map(&:to_i)
    
    negative_numbers = numbers_arr.select { |num| num < 0 }
    if negative_numbers.any?
      raise "Negative numbers not allowed: #{negative_numbers.join(',')}"
    end
    
    numbers_arr.reject! { |num| num > 1000 }
    
    numbers_arr.sum
  end
end
