class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    # Assumption: Delimiter can be '-'.
    delimiter, numbers = get_delimiter(numbers)
    check_valid_string(numbers, delimiter)

    values = apply_delimiter(numbers, delimiter)
    handle_negative_numbers(values)

    if values.select { |value| value > 1000 }.any?
      values = handle_big_numbers(values)
    end

    sum(values)
  end

  private

  def get_delimiter(numbers)
    if numbers.start_with?("//")
      newline_index = numbers.index("\n")
      raise "Invalid Input" if newline_index.nil?

      delimiter = numbers[2..(newline_index-1)]
      numbers = numbers[(newline_index+1)..-1]
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
    if delimiter.is_a?(String)
      pattern = /\A(-?\d+)(#{Regexp.escape(delimiter)}-?\d+)*\z/
    else
      pattern = /\A(-?\d+)([#{delimiter}]-?\d+)*\z/
    end

    raise "Invalid Input" unless pattern.match?(numbers)
  end

  def handle_negative_numbers(numbers)
    negatives = numbers.select { |number| number < 0 }
    raise "Negative Numbers are not allowed: #{negatives.join(", ")}" if negatives.any?
  end

  def handle_big_numbers(values)
    values.select { |value| value < 1000 }
  end
end
