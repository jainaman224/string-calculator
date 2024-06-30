class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    # Assumption: Delimiter can be '-'.
    delimiter, numbers = get_delimiter(numbers)
    check_valid_string(numbers, delimiter)

    values = apply_delimiter(numbers, delimiter)
    handle_negative_numbers(values)

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
    numbers.split(delimiter).map(&:to_i)
  end

  def sum(values)
    values.sum
  end

  def check_valid_string(numbers, delimiter)
    pattern = /\A(#{delimiter})*(-?\d+(#{delimiter}))*-?\d*(#{delimiter})*\Z/
    raise "Invalid Input" unless pattern.match?(numbers)
  end

  def handle_negative_numbers(numbers)
    negatives = numbers.select { |number| number < 0 }
    raise "Negative Numbers are not allowed: #{negatives.join(", ")}" if negatives.any?
  end
end
