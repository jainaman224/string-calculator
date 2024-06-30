class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    # Assumption: Delimiter can be '-'.
    delimiter, numbers = get_delimiter(numbers)
    if numbers.include?("-") && delimiter != "-"
      values = apply_delimiter(numbers, delimiter)
      handle_negative_numbers(values.map(&:to_i))
    end
    raise "Invalid Input" unless valid_string?(numbers, delimiter)

    values = apply_delimiter(numbers, delimiter)
    sum(values)
  end

  private

  def get_delimiter(numbers)
    if numbers.start_with?("//")
      delimiter = numbers[2]
      numbers = numbers[4..-1]
    else
      delimiter = /\n|,/
    end
    [delimiter, numbers]
  end

  def apply_delimiter(numbers, delimiter)
    numbers.split(delimiter)
  end

  def sum(values)
    values.map(&:to_i).sum
  end

  def valid_string?(numbers, delimiter)
    pattern = /\A[\d|#{delimiter}]+\z/
    pattern.match?(numbers)
  end

  def handle_negative_numbers(numbers)
    negatives = numbers.select { |number| number < 0 }
    raise "Negative Numbers are not allowed: #{negatives.join(", ")}" if negatives.any?
  end
end
