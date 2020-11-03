require 'csv'

class Company
  attr_accessor :name, :email, :department

  def initialize(name, email, department)
    @name =  name
    @email = email
    @department = department
  end
end

  puts "Welcome to Company Directory Management System:
  1. Add new employee
  2. Read existing employee
  3. Update existing employee
  4. Delete existing employee"

  case gets.chomp
    when '1'
      add
    when '2'
      list
    when '3'
      update
    when '4'
      delete
    else puts 'Not a valid input'
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
