require 'csv'

class Employee
  attr_accessor :name, :dept, :age
  def initialize(name, dept, age)
    @name =  name
    @dept = dept
    @age = age
  end

  def save_to_csv
    CSV.open('log2.csv', 'a+') do |row|
      row << attrs
    end
  end

  def self.read_from_csv
    CSV.foreach('log2.csv') do |row|
      puts row.inspect
    end
  end

  def update_csv
    csv_out = CSV.open('logs2.csv', 'wb')
    CSV.foreach('logs2.csv', :headers => false) do |row|
      newrow = row.each_with_index { |new_name| puts "#{new_name}" }
    end
    csv_out.close
  end

  def attrs
    [name, dept, age]
  end

end

class System
  class << self
  def show_menu
    puts "Welcome to Company Directory Management System: "
    puts "1 - Add new employee"
    puts "2 - Read existing employee"
    puts "3 - Update existing employee"
    puts "4 - Delete existing employee"

    input = gets.chomp

    case input
      when '1'
        add
      when '2'
        read
      when '3'
        update
      when '4'
        delete
    end
  end

  def add
		puts "Type in your name here:"
		name = gets.chomp
		puts "Type in your department here:"
		dept = gets.chomp
    puts "Type in your age here: "
    age = gets.chomp

		emp = Employee.new(name, dept, age)
		emp.save_to_csv
		puts "Employee record has been added. #{name}, #{age} from #{dept} department."
  end

  def read
		puts "Display logs? (y/n?)"
    log = gets.chomp
    log == 'y' ? puts( Employee.read_from_csv ) : puts( "no logs to display" )
  end

  def update
    puts "Enter name to update: "
    names = gets.chomp
    #logic to search name and update
      unless names
        puts "no name found"
      else
        puts "Enter the updated data below."
        puts "Enter ur new name: "
        new_name = gets.chomp
        puts "Enter ur new dept: "
        new_dept = gets.chomp
        puts "Enter ur new age: "
        new_age = gets.chomp

        e = Employee.new(new_name, new_dept, new_age)
        e.update_csv
        puts "Updated."
      end
    end

  end
end

System.show_menu
