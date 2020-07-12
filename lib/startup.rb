require "employee"

class Startup
    attr_reader :name,:funding,:salaries
    def initialize(name,funding,salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
    end
    def employees
        @employees
    end
    def valid_title?(title)
        if @salaries.keys.include?(title) 
            return true 
        end
       false 
    end

    def >(other_startup)
        self.funding > other_startup.funding
    end

    def hire(name,title)
        if valid_title?(title)
            @employees << Employee.new(name,title)
        else
            raise "What are you typing therer no such person"
        end
    end
    def size
        @employees.size
    end

    def pay_employee(employee)
      owed =  @salaries[employee.title]
      if  @funding >= owed
        employee.pay(owed)
        @funding -= owed
      else
        raise "Not enouth funding"
      end
    
    end

    def payday
        @employees.map do |emp|
            self.pay_employee(emp)
        end
    end
    def average_salary
        ar = 0
        @employees.each{|employee| ar+= @salaries[employee.title]}
        ar/@employees.size.to_f
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(another_start)
        @funding += another_start.funding
    end
end
