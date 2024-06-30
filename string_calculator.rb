class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    values = numbers.split(',')
    return numbers.to_i if values.size == 1

    values.map(&:to_i).sum
  end
end
