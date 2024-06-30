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
    end

    context 'when string has two comma separated numbers' do
      it 'returns sum of numbers' do
        string_calculator = StringCalculator.new
        expect(string_calculator.add("1,5")).to eq(6)
      end
    end

    context 'when string has multiple comma separated numbers' do
      it 'returns sum of numbers' do
        string_calculator = StringCalculator.new
        expect(string_calculator.add("1,5,15,20,25")).to eq(66)
      end
    end

    context 'when string has multiple comma or newline(\n) separated numbers' do
      it 'returns sum of numbers' do
        string_calculator = StringCalculator.new
        expect(string_calculator.add("1\n2,3")).to eq(6)
      end
    end
  end
end
