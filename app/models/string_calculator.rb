# app/models/string_calculator.rb

class StringCalculator
  def self.add(numbers)
    return 0 if numbers.blank?

    delimiter = detect_delimiter(numbers)
    numbers_arr = extract_numbers(numbers, delimiter)
    validate_numbers(numbers_arr)
    filter_numbers(numbers_arr)
  end

  private

  # Method to detect delimiter from input string
  def self.detect_delimiter(numbers)
    if numbers.start_with?("//")
      delimiter_section = numbers[2..]
      delimiter_list = extract_custom_delimiters(delimiter_section)
      if delimiter_list.any?
        delimiter = Regexp.union(delimiter_list.map { |d| Regexp.escape(d) })
      else
        delimiter = delimiter_section[0]
      end
    else
      delimiter = ","
    end
    delimiter
  end

  # Method to extract custom delimiters from input string
  def self.extract_custom_delimiters(delimiter_section)
    delimiter_section.scan(/\[([^\[\]]+)\]/).flatten
  end

  # Method to extract numbers from input string using provided delimiter
  def self.extract_numbers(numbers, delimiter)
    if numbers.start_with?("//")
      numbers[(numbers.index("\n") + 1)..-1]&.split(/[\n#{delimiter}]/).map(&:to_i) || []
    else
      numbers.split(/[\n#{delimiter}]/).map(&:to_i)
    end
  end

  # Method to validate numbers and raise exception for negative numbers
  def self.validate_numbers(numbers_arr)
    negative_numbers = numbers_arr.select { |num| num < 0 }
    raise "Negative numbers not allowed: #{negative_numbers.join(',')}" if negative_numbers.any?
  end

  # Method to filter out numbers greater than 1000 and return the sum
  def self.filter_numbers(numbers_arr)
    numbers_arr.reject! { |num| num > 1000 }
    numbers_arr.sum
  end
end
