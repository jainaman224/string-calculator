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

      it 'returns sum of numbers' do
        string_calculator = StringCalculator.new
        expect(string_calculator.add(",1,5,25,45,")).to eq(76)
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

      it 'returns sum of numbers' do
        string_calculator = StringCalculator.new
        expect(string_calculator.add("1\n2,3\n")).to eq(6)
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
  end
end
