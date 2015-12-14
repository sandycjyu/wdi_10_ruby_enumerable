require './spec/spec_helper.rb'
require_relative '../lib/enum'

RSpec.describe Array do
  before(:each) do
    test_array = [1, 2, 3, 7, 10, 1.1, 'ruby', 'python', false, 'Boston', 'New York', 'General Assembly', 17]
    @array = Array.new(test_array)
  end

  describe '#sum_of_numeric_elements' do
    it 'sums all Float and Fixnum elements' do
      expect(@array.sum_of_numeric_elements).to be 41.1
    end
  end

  describe '#product_of_numeric_elements' do
    it 'multiplies all Float and Fixnum elements' do
      expect(@array.product_of_numeric_elements.floor).to be 7854
    end
  end

  describe '#even_numeric_elements' do
    it 'returns only even Fixnum elements' do
      expect(@array.even_numeric_elements).to eq [2, 10]
    end
  end


  describe '#odd_numeric_elements' do
    it 'returns only odd Fixnum elements' do
      expect(@array.odd_numeric_elements).to eq [1, 3, 7, 17]
    end
  end

  describe '#string_elements' do
    it 'returns only String elements' do
      expect(@array.string_elements).to eq ["ruby", "python", "Boston", "New York", "General Assembly"]
    end
  end

  describe '#lowercase_string_elements_as_uppercase' do
    it 'returns String elements that are lowercase in uppercase' do
      expect(@array.lowercase_string_elements_as_uppercase).to eq ["Ruby", "Python"]
    end
  end

  describe '#capitalized_elements' do
    it 'returns String elements that are uppercase' do
      expect(@array.capitalized_elements).to eq ["Boston", "New York", "General Assembly"]
    end
  end

end
