class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    if numbers.start_with?("//")
      delimiter = numbers[2]
      numbers = numbers[4..-1]
      values = numbers.split(delimiter)
    else
      values = numbers.split(/\n|,/)
    end

    values.map(&:to_i).sum
  end
end
