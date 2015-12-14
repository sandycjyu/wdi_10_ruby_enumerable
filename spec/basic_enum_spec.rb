require './spec/spec_helper.rb'
require_relative '../lib/enum'

RSpec.describe MyEnumeration do

  # Refer to count
  # http://ruby-doc.org/core-2.1.4/Enumerable.html#method-i-count
  describe '#number_of_elements_in_collection' do
    it 'returns the number of elements in a collection' do
      my_enum = MyEnumeration.new([2, 4, 10, -22])
      expect(my_enum.number_of_elements_in_collection).to eq 4
    end
  end

  describe '#number_of_floats_or_fixnums' do
    it 'returns the number of elements that are Float or Fixnums' do
      my_enum = MyEnumeration.new([1, 2, 'Buckle my shoe', 3, 4, 'Close the door', true, 5, 6, 'pickup sticks', 3.14])
      expect(my_enum.number_of_floats_or_fixnums).to eq 7
    end
  end

  # Refer to: all?
  # http://ruby-doc.org/core-2.1.4/Enumerable.html#method-i-all-3F
  describe '#all_words_longer_than_length?' do
    it 'returns true if all the words in the collection are more than x characters long' do
      my_enum = MyEnumeration.new(["coffee", "tea", "apple", "television"])
      expect(my_enum.all_words_longer_than_length?(1)).to be true
      expect(my_enum.all_words_longer_than_length?(2)).to be true
      expect(my_enum.all_words_longer_than_length?(3)).to be false
      expect(my_enum.all_words_longer_than_length?(4)).to be false
      expect(my_enum.all_words_longer_than_length?(6)).to be false
      expect(my_enum.all_words_longer_than_length?(7)).to be false
      expect(my_enum.all_words_longer_than_length?(8)).to be false
    end
  end

  # Refer to: any?
  # http://ruby-doc.org/core-2.1.4/Enumerable.html#method-i-any-3F
  describe '#contains_a_word_longer_than?' do
    it 'returns true if any word is longer than x characters' do
      my_enum = MyEnumeration.new(["coffee", "tea", "apple", "television"])
      expect(my_enum.contains_a_word_longer_than?(1)).to be true
      expect(my_enum.contains_a_word_longer_than?(2)).to be true
      expect(my_enum.contains_a_word_longer_than?(3)).to be true
      expect(my_enum.contains_a_word_longer_than?(4)).to be true
      expect(my_enum.contains_a_word_longer_than?(6)).to be true
      expect(my_enum.contains_a_word_longer_than?(7)).to be true
      expect(my_enum.contains_a_word_longer_than?(8)).to be true
      expect(my_enum.contains_a_word_longer_than?(9)).to be true
      expect(my_enum.contains_a_word_longer_than?(10)).to be false
    end
  end

  # Refer to: collect / map
  # http://ruby-doc.org/core-2.1.4/Enumerable.html#method-i-collect
  # http://ruby-doc.org/core-2.1.4/Enumerable.html#method-i-map
  describe '#capitalize_words' do
    it 'capitalizes all words in the collection' do
      my_enum = MyEnumeration.new(["coffee", "tea", "apple", "television"])
      expect(my_enum.capitalize_words).to eq %w[Coffee Tea Apple Television]
    end
  end

  describe '#square_numbers' do
    it 'squares all the numbers in the collection' do
      my_enum = MyEnumeration.new([2, 4, 6, 8])
      expect(my_enum.square_numbers).to eq [4, 16, 36, 64]
    end
  end

  describe '#reverse_words' do
    it 'reverses all words in the collection' do
      my_enum = MyEnumeration.new(["coffee", "tea", "apple", "television"])
      expect(my_enum.reverse_words).to eq ["eeffoc", "aet", "elppa", "noisivelet"]
    end
  end

  # Refer to collect_concat or flat_map
  # http://ruby-doc.org/core-2.1.4/Enumerable.html#method-i-flat_map
  # To get the order right for the tests, you'll need to use the absolute value method
  describe '#positive_and_negative_numbers' do
    it 'returns all numbers as both positive and negative ' do
      my_enum = MyEnumeration.new([2, 4, 10, -22])
      expect(my_enum.positive_and_negative_numbers).to eq [2, -2, 4, -4, 10, -10, 22, -22]
    end
  end

  # Refer to detect or find
  # http://ruby-doc.org/core-2.1.4/Enumerable.html#method-i-detect
  # http://ruby-doc.org/core-2.1.4/Enumerable.html#method-i-find
  describe '#find_first_awesome_person' do
    it 'returns the first person who is awesome' do
      my_enum = MyEnumeration.new([{name: "JohnDoe", awesome: false}, {name: "Chris", awesome: true}, {name: "Anna", awesome: true}])
      expect(my_enum.find_first_awesome_person[:name]).to eq "Chris"
    end
  end


  # Refer to drop
  # http://ruby-doc.org/core-2.1.4/Enumerable.html#method-i-drop
  describe '#remove_first_three' do
    it 'returns an array without the first three elements' do
      my_enum = MyEnumeration.new ['Anna', 'David', 'Chris', 'Dan', 'Tom']
      expect(my_enum.remove_first_three).to eq ['Dan', 'Tom']
    end
  end

  # Refer to drop_while
  # http://ruby-doc.org/core-2.1.4/Enumerable.html#method-i-drop_while
  describe '#drop_until_its_hot' do
    it 'removes items from the array until its finds hot' do
      my_enum = MyEnumeration.new(['mild', 'cool', 'hot', 'medium', 'chilly'])
      expect(my_enum.drop_until_its_hot).to eq ['hot', 'medium', 'chilly']
    end
  end

  # Refer to each_slice
  # http://ruby-doc.org/core-2.1.4/Enumerable.html#method-i-each_slice
  describe '#groups_of' do
    it 'splits elements into groups of x size, with remaining elements in smaller set' do
      my_enum = MyEnumeration.new(['Anna', 'David', 'Chris', 'Kate', 'Dan', 'Tom', 'Karen', 'Emily', 'Dannie', 'Kel'])
      expect(my_enum.groups_of(2)).to eq([["Anna", "David"], ["Chris", "Kate"], ["Dan", "Tom"], ["Karen", "Emily"], ["Dannie", "Kel"]])
      expect(my_enum.groups_of(3)).to eq [["Anna", "David", "Chris"], ["Kate", "Dan", "Tom"], ["Karen", "Emily", "Dannie"], ["Kel"]]
      expect(my_enum.groups_of(4)).to eq [["Anna", "David", "Chris", "Kate"], ["Dan", "Tom", "Karen", "Emily"], ["Dannie", "Kel"]]
    end
  end

  # Refer to each_with_object
  # http://ruby-doc.org/core-2.1.4/Enumerable.html#method-i-each_with_object
  describe '#element_frequency_count' do
    it 'returns a hash of the frequency count of the words in an array' do

      my_enum = MyEnumeration.new(['buffalo', 'buffalo', 'buffalo', 'buffalo', 'cat', 'cat', 'dog', 2, 2, :foo, :foo])

      results = {'buffalo' => 4, 'cat' => 2, 'dog' => 1, 2 => 2, :foo => 2}

      expect(my_enum.element_frequency_count).to eq results
    end
  end

  # Refer to find_all / select
  # http://ruby-doc.org/core-2.1.4/Enumerable.html#method-i-find-all
  # http://ruby-doc.org/core-2.1.4/Enumerable.html#method-i-select
  describe '#elements_ending_in_er' do
    it 'returns an array of strings ending in er' do
      my_enum = MyEnumeration.new ['fitter', 'happier', 'more', 'productive', 'a', 'patient', 'better', 'driver']
      expect(my_enum.elements_ending_in_er).to eq ['fitter', 'happier', 'better', 'driver']
    end
  end


  # Refer to find_index
  # http://ruby-doc.org/core-2.1.4/Enumerable.html#method-i-find-index
  describe '#index_of_first_awesome_element' do
    it 'returns an index of the first awesome person' do
      my_enum = MyEnumeration.new([{name: "JohnDoe", awesome: false}, {name: "Chris", awesome: true}, {name: "Anna", awesome: true}])
      expect(my_enum.index_of_first_awesome_element).to eq 1
    end
  end

  # Refer to group_by
  # http://ruby-doc.org/core-2.1.4/Enumerable.html#method-i-group-by
  describe '#group_elements_by_favorite_language' do
    it 'returns a hash of favorite languages as keys, and hashes of who like them as elements' do
      my_enum = MyEnumeration.new([ {name: "Kelly", favorite_language: :ruby},
                                    {name: "Chris", favorite_language: :javascript},
                                    {name: "Kim", favorite_language: :ruby},
                                    {name: "Dan", favorite_language: :haskell},
                                    {name: "Martin", favorite_language: :javascript},
                                    {name: "Ki", favorite_language: :haskell},
                                    {name: "Anna", favorite_language: :ruby}])
      expected_result = {
                         ruby:      [
                                    {name: "Kelly", favorite_language: :ruby},
                                    {name: "Kim", favorite_language: :ruby},
                                    {name: "Anna", favorite_language: :ruby}],
                        javascript: [
                                    {name: "Chris", favorite_language: :javascript},
                                    {name: "Martin", favorite_language: :javascript}],
                        haskell:    [
                                    {name: "Dan", favorite_language: :haskell},
                                    {name: "Ki", favorite_language: :haskell}]}
      expect(my_enum.group_elements_by_favorite_language).to eq expected_result
    end
  end

  # Refer to inject / reduce
  # http://ruby-doc.org/core-2.1.4/Enumerable.html#method-i-inject
  # http://ruby-doc.org/core-2.1.4/Enumerable.html#method-i-reduce
  describe '#sum_of_experiences' do
    it 'returns an Fixnum sum of experiences' do
      my_enum = MyEnumeration.new([ {name: "JohnDoe", years_experience: 5},
                                    {name: "Chris", years_experience: 2},
                                    {name: "Anna", years_experience: 8},
                                    {name: "Ki", years_experience: 4}])
      expect(my_enum.sum_of_experiences).to eq 19
    end
  end

  # Refer to inject /reduce
  # http://ruby-doc.org/core-2.1.4/Enumerable.html#method-i-inject
  # http://ruby-doc.org/core-2.1.4/Enumerable.html#method-i-reduce
  describe '#longest_element_name_using_inject' do
    it 'returns the person element with the longest name' do
      my_enum = MyEnumeration.new([ {name: "Rich", years_experience: 5},
                                    {name: "Catherine", years_experience: 2},
                                    {name: "Anna", years_experience: 8},
                                    {name: "Ki", years_experience: 4},
                                    {name: "Salamar", years_experience: 1}])
      expect(my_enum.longest_element_name_using_inject).to eq ({name: "Catherine", years_experience: 2})
    end
  end


  # Refer to max_by
  # http://ruby-doc.org/core-2.1.4/Enumerable.html#method-i-max-by
  describe '#most_experienced_element' do
    it 'returns the person element with the most years experience' do
      my_enum = MyEnumeration.new([ {name: "Rich", years_experience: 5},
                                    {name: "Catherine", years_experience: 2},
                                    {name: "Anna", years_experience: 8},
                                    {name: "Ki", years_experience: 4},
                                    {name: "Salamar", years_experience: 1}])
      expect(my_enum.most_experienced_element).to eq ({name: "Anna", years_experience: 8})
    end
  end


  # Refer to max_by
  # http://ruby-doc.org/core-2.1.4/Enumerable.html#method-i-max-by
  describe '#element_present?' do
    it 'returns true if the element is present in the collection' do
      my_enum = MyEnumeration.new(['Anna', 'David', 'Chris', 'Kate', 'Dan', 'Tom', 'Karen', 'Emily', 'Dannie', 'Kel'])
      expect(my_enum.element_present?('Anna')).to eq true
      expect(my_enum.element_present?('Sarah')).to eq false
      expect(my_enum.element_present?('D')).to eq false
      expect(my_enum.element_present?('Kel')).to eq true
    end
  end

  # Refer to minmax_by
  # http://ruby-doc.org/core-2.1.4/Enumerable.html#method-i-minmax_by
  describe '#elements_with_longest_and_shortest_names' do
    it 'returns an array of elements with longest and shortest names' do
      my_enum = MyEnumeration.new([ {name: "Rich", years_experience: 5},
                                    {name: "Catherine", years_experience: 2},
                                    {name: "Anna", years_experience: 8},
                                    {name: "Ki", years_experience: 4},
                                    {name: "Salamar", years_experience: 1}])
      expect(my_enum.elements_with_longest_and_shortest_names).to eq [{name: "Ki", years_experience: 4}, {name: "Catherine", years_experience: 2} ]
    end
  end


  # Refer to partition
  # http://ruby-doc.org/core-2.1.4/Enumerable.html#method-i-partition
  describe '#separate_elements_that_like_functional_programming_from_rest' do
    it 'returns an array splitting up elements that like functional programming vs those who don\'t' do
      my_enum = MyEnumeration.new([ {name: "Rich", likes_functional_programming: true},
                                    {name: "Catherine", likes_functional_programming: true},
                                    {name: "Anna", likes_functional_programming: false},
                                    {name: "Ki", likes_functional_programming: true},
                                    {name: "Salamar", likes_functional_programming: false}])
      expected_result = [
                          [
                            {name: "Rich", likes_functional_programming: true},
                            {name: "Catherine", likes_functional_programming: true},
                            {name: "Ki", likes_functional_programming: true}],
                          [
                            {name: "Anna", likes_functional_programming: false},
                            {name: "Salamar", likes_functional_programming: false}
                          ]
                        ]

      expect(my_enum.separate_elements_that_like_functional_programming_from_rest).to eq expected_result
    end
  end


  # Refer to reject
  # http://ruby-doc.org/core-2.1.4/Enumerable.html#method-i-reject
  describe '#elements_who_dislike_functional_programming' do
    it 'returns an array of elements who do not like functional programming' do
      my_enum = MyEnumeration.new([ {name: "Rich", likes_functional_programming: true},
                                    {name: "Catherine", likes_functional_programming: true},
                                    {name: "Anna", likes_functional_programming: false},
                                    {name: "Ki", likes_functional_programming: true},
                                    {name: "Salamar", likes_functional_programming: false}])
      expected_result = [
                          {name: "Anna", likes_functional_programming: false},
                          {name: "Salamar", likes_functional_programming: false}
                        ]

      expect(my_enum.elements_who_dislike_functional_programming).to eq expected_result
    end
  end

  # Refer to sort
  # http://ruby-doc.org/core-2.1.4/Enumerable.html#method-i-sort
  # You will need to use the 'spaceship' operator <=>
  describe '#elements_sorted_by_experience' do
    it 'returns an array of elements with longest and shortest names' do
      my_enum = MyEnumeration.new([ {name: "Rich", years_experience: 5},
                                    {name: "Catherine", years_experience: 2},
                                    {name: "Anna", years_experience: 8},
                                    {name: "Ki", years_experience: 4},
                                    {name: "Salamar", years_experience: 1}])
      expected_result = [ {name: "Salamar", years_experience: 1},
                          {name: "Catherine", years_experience: 2},
                          {name: "Ki", years_experience: 4},
                          {name: "Rich", years_experience: 5},
                          {name: "Anna", years_experience: 8}]
      expect(my_enum.elements_sorted_by_experience).to eq expected_result
    end
  end

  # Refer to take
  # http://ruby-doc.org/core-2.1.4/Enumerable.html#method-i-take
  describe '#first_x_elements' do
    it 'returns an array of elements with longest and shortest names' do
      my_enum = MyEnumeration.new([ {name: "Rich", years_experience: 5},
                                    {name: "Catherine", years_experience: 2},
                                    {name: "Anna", years_experience: 8},
                                    {name: "Ki", years_experience: 4},
                                    {name: "Salamar", years_experience: 1}])
      expected_result = [ {name: "Rich", years_experience: 5},
                          {name: "Catherine", years_experience: 2}]
      expect(my_enum.first_x_elements(0)).to eq []
      expect(my_enum.first_x_elements(2)).to eq expected_result
    end
  end

end
