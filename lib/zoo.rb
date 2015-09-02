require 'pry'
class Zoo
  attr_reader :cages
  attr_accessor :employees
  def initialize(name)
    @name = name
    @cages = []
    10.times {@cages << Cage.new}
    @employees = []
  end

  def add_employee(employee)
    employees << employee
  end

  def add_animal(animal)
    cages.each do |cage|
      if cage.empty?
        cage.animal = animal
        return
      end
    end
    raise ZooAtCapacity
  end

  def visit
    greetings = ''
    employees.each { |employee| greetings += "#{employee.greet}\n" }
    cages.each do |cage|
      greetings += "#{cage.animal.speak}\n" unless cage.empty?
    end
    greetings
  end

end

class ZooAtCapacity < StandardError
end
