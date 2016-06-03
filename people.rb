class Person
  def initialize(name)
    @name = name
  end
  def greeting
  puts "hi my name is #{@name}"
  end
end


class Student < Person
  def learn
    puts "I get it"

  end
end

class Instructor < Person
     def teach
    puts "Everything in ruby is an Object"

  end
end

chris = Instructor.new("chris")

chris.greeting


christina = Student.new("christina")

christina.greeting

chris.teach

christina.learn

chris.learn

christina.teach

# chris and christina are not in the same class and the methods cannot be called by the other class
