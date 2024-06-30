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
  end
end
