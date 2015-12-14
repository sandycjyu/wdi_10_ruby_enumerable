class Array

  def initialize(array)
    @array = array
  end

  def sum_of_numeric_elements
    nums = array.select { |e| e.is_a?(Fixnum) || e.is_a?(Float) }
    nums.inject { |sum,n| sum + n }
  end

  def product_of_numeric_elements
    nums = array.find_all { |e| e.is_a?(Fixnum) || e.is_a?(Float) }
    nums.inject { |result, n| result*n }.floor
  end

  def even_numeric_elements
    array.select { |e| e%2 == 0 if e.is_a?(Integer) }
  end

  def odd_numeric_elements
    array.find_all { |e| e%2 != 0 if e.is_a?(Integer) }
  end

  def string_elements
    array.find_all { |e| e.is_a?(String) }
  end

  def lowercase_string_elements_as_uppercase 
    strings = array.find_all { |e| e == e.downcase if e.is_a?(String) }
    strings.map(&:capitalize)
  end

  def capitalized_elements
    words = array.select { |e| e.is_a?(String) }
    
    capitalized_elements = [];

    words.select do |e|
      word_array = e.split 
      capitalized_elements << e if word_array.all?{ |word| word == word.capitalize }
    end
  end

  private

  def array
    @array
  end

end
