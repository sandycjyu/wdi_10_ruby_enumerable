require 'byebug'
# Basic enumeration on collection objects (hash, array)

# This is NOT the Enumerable module.
# The name is close, but this is just us writing implementation of all of the enumerable methods in actions
class MyEnumeration
  # Do not modify the initialize
  # This statement allows the rspec tests to create a new collection that will then be tested
  # MyEnumeration.new(['foo', 'bar'])
  def initialize(collection)
    @collection = collection
  end

  # EXAMPLE: THIS ONE IS DONE FOR YOU
  # Refer to count
  # http://ruby-doc.org/core-2.1.4/Enumerable.html#method-i-count
  ## count
  ###usually meant to be used with a block or an argument and will return the number of matches
  def number_of_elements_in_collection
    # collection here refers to the collection that is set with the initialize method
    # collection() is a private accessor method at the bottom of this class that accesses @collection
    collection.count
  end

  # This one also uses 'count'
  # Try it yourself!
  def number_of_floats_or_fixnums
    collection.select { |ele| ele.is_a? (Numeric)}.count
  end

  # Refer to: all?
  # http://ruby-doc.org/core-2.1.4/Enumerable.html#method-i-all-3F
  ## all
  ### checks all values in a collection to see if it passes a given statement, 
  ###returns boolean true if all passes vice versa
  def all_words_longer_than_length?(min_length)
    collection.all? { |item| item.length > min_length}
  end

  # For the next 3 methods refer to: collect or map
  # http://ruby-doc.org/core-2.1.4/Enumerable.html#method-i-any-3F
  ## any?
  ### accepts a block and return true if at least one value passes
  ### if no block is passed, returns true if block returns a value other than nil or false
  def contains_a_word_longer_than?(min_length)
    collection.any?{ |word| word.length > min_length }
  end

  ##map
  ### outputting each returned value from the block (the original object is unchanged unless you use map!)
  ### VISIT basically the same as collect? http://ruby-doc.org/core-2.1.4/Enumerable.html#method-i-collect
  def capitalize_words
    collection.map { |word| word.capitalize }
  end

  def square_numbers
    collection.map { |x| x**2}
  end

  # Use symbol to proc notation on this one!
  def reverse_words
    collection.map(&:reverse)
  end

  # Refer to collect_concat or flat_map for these next two
  # http://ruby-doc.org/core-2.1.4/Enumerable.html#method-i-flat_map
  # To get the order right for the tests, you'll need to use the absolute value method
  ## flat_map
  ### turns an array of arrays into a one dimensional array
  def positive_and_negative_numbers
    collection.map{|num| num.abs}.flat_map{|num| [num, -num]}
  end

  # Refer to detect or find
  # http://ruby-doc.org/core-2.1.4/Enumerable.html#method-i-detect
  ## find
  ### returns the first object that returns true according to given block statement
  def find_first_awesome_person
    collection.find {|x| x[:awesome] }
  end 

  # Refer to drop
  # http://ruby-doc.org/core-2.1.4/Enumerable.html#method-i-drop
  ## drop
  ### drop the first n elements and return the remainder
  def remove_first_three
    collection.drop(3)
  end

  # Refer to drop_while
  # http://ruby-doc.org/core-2.1.4/Enumerable.html#method-i-drop_while
  ## drop_while > takes a block unlike drop
  ### drop elements upto but not including the first element that returns false/nil
  ### return remainder
  def drop_until_its_hot
    collection.drop_while { |word| word != "hot" }
  end


  # Refer to each_slice
  # http://ruby-doc.org/core-2.1.4/Enumerable.html#method-i-each_slice
  # Tip: After .each_slice chain on .to_a to turn the returned Enumerator into an array
  ## .each_slice
  ### groups results to arrays of given elements
  ### takes optional block
  def groups_of(num)
    collection.each_slice(num).to_a
  end


  # Refer to each_with_object
  # http://ruby-doc.org/core-2.1.4/Enumerable.html#method-i-each_with_object
  # Tip: You'll have to do .each_with_object(Hash.new(0)) to create a hash to start with. Do not save the hash in a variable. You may use the incrementor method here.
  ## .each_with_object
  ### builds a hash
  def element_frequency_count
    collection.each_with_object(Hash.new(0)) { |count,x| x[count]+=1 }
  end


  # Refer to find_all / select
  # http://ruby-doc.org/core-2.1.4/Enumerable.html#method-i-find-all
  # http://ruby-doc.org/core-2.1.4/Enumerable.html#method-i-select
  ## find_all
  ### returns an array of matching elements
  def elements_ending_in_er
    # collection.map { |i| i.reverse }.find_all { |i| i[0...2] == "re" }.map { |i| i.reverse }
    # another way to do it
    collection.find_all { |word| word.end_with? 'er' }
    # another way to do it
    collection.find_all { |word| word.chars[-1] == "r" && word.chars[-2] == "e"}
  end


  # Refer to find_index
  # http://ruby-doc.org/core-2.1.4/Enumerable.html#method-i-find-index
  ## find_index
  ### returns the index of the first matching element 
  def index_of_first_awesome_element
    collection.find_index{|x| x[:awesome]}
  end

  # Refer to group_by
  # http://ruby-doc.org/core-2.1.4/Enumerable.html#method-i-group-by
  ## group_by
  ### Break a collection into groups based on the result of a given block 
  def group_elements_by_favorite_language
    collection.group_by { |fido| fido.fetch(:favorite_language)}
  end

  # Refer to inject / reduce
  # http://ruby-doc.org/core-2.1.4/Enumerable.html#method-i-inject
  # http://ruby-doc.org/core-2.1.4/Enumerable.html#method-i-reduce
  ## inject
  ### use to build an object based on elements of an enumerable
  def sum_of_experiences
    collection.map{|person| person[:years_experience]}.inject(:+)
    # collection.map{|person| person[:years_experience]}.inject(0){|sum, n| sum += n}
  end

  # Refer to inject / reduce
  # http://ruby-doc.org/core-2.1.4/Enumerable.html#method-i-inject
  # http://ruby-doc.org/core-2.1.4/Enumerable.html#method-i-reduce
  def longest_element_name_using_inject
    collection.inject { |memo, person| memo[:name].length > person[:name].length ? memo : person }
  end

  # Refer to max_by
  # http://ruby-doc.org/core-2.1.4/Enumerable.html#method-i-max-by
  ## max_by
  ### Returns the object in enum that gives the maximum value from the given block.
  def most_experienced_element
    collection.max_by{|person| person[:years_experience]}
  end

  # Refer to include? / member?
  # http://ruby-doc.org/core-2.1.4/Enumerable.html#method-i-include-3F
  # http://ruby-doc.org/core-2.1.4/Enumerable.html#method-i-member-3F
  ## include?
  ### Returns true if the given object is present in self 
  def element_present?(name)
    collection.include?(name)
  end

  # Refer to minmax_by
  # http://ruby-doc.org/core-2.1.4/Enumerable.html#method-i-minmax_by
  ## minmax_by
  ### returns min and max value of enum object
  def elements_with_longest_and_shortest_names
    collection.minmax_by { |person| person[:name].length }
  end

  # Refer to partition
  # http://ruby-doc.org/core-2.1.4/Enumerable.html#method-i-partition
  ## partition
  ### returns two arrays, one in which values return true, other false
  def separate_elements_that_like_functional_programming_from_rest
    collection.partition { |item| item[:likes_functional_programming] == true }
  end

  # Refer to reject
  # http://ruby-doc.org/core-2.1.4/Enumerable.html#method-i-reject
  ## reject
  ### returns an array where values return false
  def elements_who_dislike_functional_programming
    collection.reject { |person| person[:likes_functional_programming] }
  end

  # Refer to sort
  # http://ruby-doc.org/core-2.1.4/Enumerable.html#method-i-sort
  # You will need to use the 'spaceship' operator <=>
  ## sort
  ### sorts an array 
  def elements_sorted_by_experience
    collection.sort{|memo, hash| memo[:years_experience] <=> hash[:years_experience] }
    # another way
    # collection.sort_by{|person| person[:years_experience]}
  end

  # Refer to take
  # http://ruby-doc.org/core-2.1.4/Enumerable.html#method-i-take
  ## take
  ### Returns first n elements from enum.
  def first_x_elements(x)
    collection.take(x)
  end

  private

  def collection
    @collection
  end

end
