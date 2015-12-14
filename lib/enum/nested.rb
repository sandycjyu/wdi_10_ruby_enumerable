# Don't modify the Person class
class Person
  attr_accessor :name, :age, :gender, :years_language_experience, :favorite_foods

  def initialize(name:, age:, gender:, years_language_experience:{}, favorite_foods:[])
    @name = name
    @age = age
    @gender = gender
    @years_language_experience = years_language_experience
    @favorite_foods = favorite_foods
  end
end


class People
  def initialize(people_array)
    @people = people_array
  end

  def ages_sum 
    people.inject(0) { |result, element| result + element.age } 
  end

  def average_age
     ages_sum / people.size
  end

  def total_years_programming_experience_for_all_languages
    people.inject(0) do |total, person|
       total + ( person.years_language_experience.values.inject(0) { |sum, num| sum + num } )
    end
  end

  def favorite_food_frequency 
    foods = people.inject([]) { |array, person| array << person.favorite_foods }

    foods.flatten.each_with_object(Hash.new(0)) { |food, counts| counts[food] += 1 }
  end

  def total_combined_years_language_experience(language)
    people.inject(0) do |sum, person|  
      sum + (person.years_language_experience[language] != nil ? person.years_language_experience[language] : 0) 
    end
  end

  def person_with_most_experience_in_language(language)   
    records = people.each_with_object({}) { |person, hash| (hash[person.name] = person.years_language_experience[language.to_sym]) if person.years_language_experience[language] != nil  }

    records.sort_by { |k,v| v }
   
    person = records.select { |k,v| v == records.values.sort.last }
   
    person.key(records.values.sort.last)
  end

  private

  def people
    @people
  end

end
