require 'rspec'
require_relative 'string_calculator'

RSpec.describe StringCalculator do
  describe '#add' do
    context 'when the string is empty' do
      it 'returns zero' do
        string_calculator = StringCalculator.new
        expect(string_calculator.add("")).to eq(0)
      end
    end

    context 'when string has one number' do
      it 'returns number as integer' do
        string_calculator = StringCalculator.new
        expect(string_calculator.add("1")).to eq(1)
      end

      it 'returns number as integer' do
        string_calculator = StringCalculator.new
        expect(string_calculator.add("20")).to eq(20)
      end
    end

    context 'when string has two comma separated numbers' do
      it 'returns sum of numbers' do
        string_calculator = StringCalculator.new
        expect(string_calculator.add("1,5")).to eq(6)
      end

      it 'returns sum of numbers' do
        string_calculator = StringCalculator.new
        expect(string_calculator.add("18,118")).to eq(136)
      end

      it 'returns Invalid Input Error' do
        string_calculator = StringCalculator.new
        expect {string_calculator.add("1;2,50")}.to raise_exception(RuntimeError, 'Invalid Input')
      end
    end

    context 'when string has multiple comma separated numbers' do
      it 'returns sum of numbers' do
        string_calculator = StringCalculator.new
        expect(string_calculator.add("1,5,15,20,25")).to eq(66)
      end

      it 'returns sum of numbers' do
        string_calculator = StringCalculator.new
        expect(string_calculator.add("1,5,25")).to eq(31)
      end

      # Based on https://osherove.com/tdd-kata-1/, it will fail.
      it 'returns sum of numbers' do
        string_calculator = StringCalculator.new
        expect {string_calculator.add(",1,5,25,45,")}.to raise_exception(RuntimeError, 'Invalid Input')
      end
    end

    context 'when string has multiple comma or newline(\n) separated numbers' do
      it 'returns sum of numbers' do
        string_calculator = StringCalculator.new
        expect(string_calculator.add("1\n2,3")).to eq(6)
      end

      it 'returns sum of numbers' do
        string_calculator = StringCalculator.new
        expect(string_calculator.add("1\n2,3\n4")).to eq(10)
      end

      # Based on https://osherove.com/tdd-kata-1/, it will fail.
      it 'returns sum of numbers' do
        string_calculator = StringCalculator.new
        expect {string_calculator.add("1\n2,3\n")}.to raise_exception(RuntimeError, 'Invalid Input')
      end
    end

    context 'when string has different delimiters separated numbers (//[delimiter]\n[numbers…])' do
      it 'returns sum of numbers' do
        string_calculator = StringCalculator.new
        expect(string_calculator.add("//;\n1;2")).to eq(3)
      end

      it 'returns sum of numbers' do
        string_calculator = StringCalculator.new
        expect(string_calculator.add("//:\n1:2:50")).to eq(53)
      end

      it 'returns Invalid Input Error' do
        string_calculator = StringCalculator.new
        expect {string_calculator.add("//;\n1;2,50")}.to raise_exception(RuntimeError, 'Invalid Input')
      end
    end

    context 'when string has negative numbers' do
      it 'returns exception with all negative numbers' do
        string_calculator = StringCalculator.new
        expect {string_calculator.add("//;\n-1;-2;3")}.to raise_exception(
                                                            RuntimeError, 'Negative Numbers are not allowed: -1, -2'
                                                          )
      end
    end

    context 'when string has big numbers (>1000)' do
      it 'returns sum of small numbers' do
        string_calculator = StringCalculator.new
        expect(string_calculator.add("//;\n2;1001")).to eq(2)
      end

      it 'returns sum of small numbers' do
        string_calculator = StringCalculator.new
        expect(string_calculator.add("2,1001\n5\n2000")).to eq(7)
      end
    end

    context 'when string has any length delimiters' do
      it 'returns sum of numbers' do
        string_calculator = StringCalculator.new
        expect(string_calculator.add("//__\n2__100__5")).to eq(107)
      end

      it 'returns sum of numbers' do
        string_calculator = StringCalculator.new
        expect(string_calculator.add("//+++\n2+++100+++5+++20")).to eq(127)
      end
    end
  end
end
