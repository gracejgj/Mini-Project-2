require 'csv'

class Company
  attr_accessor :name

  def initialize(name)
    @name =  name
  end

  def save_to_csv
    CSV.open('log2.csv', 'a+') do |row|
      row << attrs
    end
  end

  def self.read_from_csv
    CSV.foreach('log2.csv', 'wb') do |row|
      puts row.inspect
    end
  end

  def update_csv
    rows_array = CSV.read('log2.csv')
    n_indices = [name] #field that i want to modify
    rows_array.each_with_index(n_indices[1]) do |row, index|
      if n_indices.include?(index)
      rows_array[index][name] = 'modification'
      end
    end
  end

  def attrs
    [name, dept]
  end

end

class Employee
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

		emp = Company.new(name)
		emp.save_to_csv
		puts "Employee record has been added. #{name} from department."
  end

  def read
		puts "Display logs? (y/n?)"
    log = gets.chomp
    log == 'y' ? puts( Company.read_from_csv ) : puts( "no logs to display" )
  end

  def update
    puts "Enter name to update: "
    names = gets.chomp
    #logic to search name and update
      if !names
        puts "no name found"
      else
        puts "Enter the updated data below."
        puts "Enter ur new name: "
        new_name = gets.chomp

        n = Company.new(name)
        n.update_csv
        puts "Updated."
      end
    end

  end
end

Employee.show_menu
