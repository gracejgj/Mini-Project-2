require 'csv'

class Company
  attr_accessor :name, :dept, :time

  def initialize(name, dept, time)
    @name =  name
    @dept = dept
    @time = time
  end

  def save_to_csv
    CSV.open('C:/mp2/log2.csv', 'a+') do |row|
      row << attrs
    end
  end

  def self.read_from_csv
    CSV.foreach('C:/mp2/log2.csv') do |row|
      puts row.inspect
    end
  end

  def attrs
    [name, dept, time]
  end
end

  puts "Welcome to Company Directory Management System:
  1. Add new employee
  2. Read existing employee
  3. Update existing employee
  4. Delete existing employee"

#2.List all the current employee
#3.Without duplicate the existing employee)

  choice = gets.chomp
  case choice
    when '1'
      puts "Type in your name here:"
      name = gets.chomp
      puts "Type in your department here:"
      dept = gets.chomp
      #else
      #  puts "That name already exist!
        emp = Company.new(name, dept, Time.now)
        emp.save_to_csv
        puts "Employee record has been added. #{name} from #{dept} department."

    when '2'
      Company.read_from_csv
    else
      puts "No logs to display"

    when '3'

    when '4'

  end
    

=begin
Mini Porject(2) Requirement:
Create a ‘Company Directory Management System’
User can ADD new employee
User can READ existing employee(List all the current employee)
User can UPDATE existing employee(Without duplicate the existing employee)
User can DELETE existing employee
Save database in csv format
code push to github on regular basis
=end
