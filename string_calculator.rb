class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    if numbers.include?("\n")
      values = numbers.split(/\n|,/)
    else
      values = numbers.split(',')
    end

    values.map(&:to_i).sum
  end
end
