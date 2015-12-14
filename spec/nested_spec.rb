require './spec/spec_helper.rb'
require_relative '../lib/enum'

RSpec.describe People do
  before(:each) do
    @rubyist = Person.new(name: "Jamal", age: 78, gender: 'male', years_language_experience: {java: 3, perl: 6, clojure: 3, ruby: 4}, favorite_foods: [:korean, :pizza, :american])
    test_nesting = [
      Person.new(name: "Chris", age: 31, gender: 'queer', years_language_experience: {ruby: 3, python: 6, perl: 10} , favorite_foods: [:sushi, :greek]),
      Person.new(name: "Ryan", age: 42, gender: 'male', years_language_experience: {c: 3, java: 6}, favorite_foods: [:thai, :pizza]),
      Person.new(name: "Anne", age: 19, gender: 'female', years_language_experience: {haskell: 3, erlang: 6}, favorite_foods: [:soylent, :pizza, :french]),
      Person.new(name: "Kee", age: 24, gender: 'female', years_language_experience: {lisp: 3, javascript: 6, fortran: 12}, favorite_foods: [:sushi, :german]),
      Person.new(name: "Jamie", age: 22, gender: 'queer', years_language_experience: {scheme: 3, assembly: 6, c: 10}, favorite_foods: [:indian, :italian]),
      @rubyist
    ]
    @people = People.new(test_nesting)
  end

  describe '#ages_sum' do
    it 'sums the ages of all People' do
      expect(@people.ages_sum).to eq 216
    end
  end

  describe '#average_age' do
    it 'averages the ages of all People' do
      expect(@people.average_age).to eq 36
    end
  end

  describe '#total_years_programming_experience_for_all_languages' do
    it 'returns the total years programming experience for all languages' do
      expect(@people.total_years_programming_experience_for_all_languages).to eq 93
    end
  end

  describe '#favorite_food_frequency' do
    it 'returns a hash with the frequency of favorite foods' do
      favorite_foods_result = {:sushi=>2, :greek=>1, :thai=>1, :pizza=>3, :soylent=>1, :french=>1, :german=>1, :indian=>1, :italian=>1, :korean=>1, :american=>1}
      expect(@people.favorite_food_frequency).to eq favorite_foods_result
    end
  end

  describe '#total_combined_years_language_experience' do
    it 'returns the total years of experience between all people for a language' do
      expect(@people.total_combined_years_language_experience(:ruby)).to eq 7
      expect(@people.total_combined_years_language_experience(:python)).to eq 6
      expect(@people.total_combined_years_language_experience(:javascript)).to eq 6
      expect(@people.total_combined_years_language_experience(:c)).to eq 13
    end
  end

  describe '#person_with_most_experience_in_language' do
    it 'returns the person with most experiece for a language' do
      expect(@people.person_with_most_experience_in_language(:ruby)).to eq 'Jamal'
      expect(@people.person_with_most_experience_in_language(:python)).to eq 'Chris'
      expect(@people.person_with_most_experience_in_language(:javascript)).to eq 'Kee'
      expect(@people.person_with_most_experience_in_language(:c)).to eq 'Jamie'
    end
  end

end
