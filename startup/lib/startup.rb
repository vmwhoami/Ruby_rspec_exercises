require 'employee'

class Startup
  attr_reader :name, :funding, :salaries, :employees
  def initialize(name, funding, salaries)
    @name = name
    @funding = funding
    @salaries = {}
    @employees = []
    salaries.each do |title, salary|
      @salaries[title] = salary
    end
  end

  def valid_title?(title)
    return true if @salaries.keys.include?(title)

    false
  end

  def >(new_startup)
    funding > new_startup.funding
  end

  def hire(employee_name, title)
    if valid_title?(title)
      @employees << Employee.new(employee_name, title)
    else
      raise 'No suck title'
    end
  end

  def size
    @employees.size
  end

  def pay_employee(employee)
    if @funding >= @salaries[employee.title]
      employee.pay(@salaries[employee.title])
      @funding -= @salaries[employee.title]
    else
      raise 'No money what do you want'
    end
  end

  def payday
    @employees.each do |employee|
      pay_employee(employee)
    end
  end

  def average_salary
    sum = 0
    @employees.each do |emp|
      sum += @salaries[emp.title]
    end
    sum / @employees.size
  end

  def close
    @employees = []
    @funding = 0
  end

  def acquire(startup)
    @funding += startup.funding
    startup.salaries.each do |title, salary|
      @salaries[title] = salary unless @salaries.key?(title)
      @employees += startup.employees
    end
    startup.close
  end
end
