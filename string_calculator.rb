class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    values = numbers.split(/\n|,/)
    values.map(&:to_i).sum
  end
end
