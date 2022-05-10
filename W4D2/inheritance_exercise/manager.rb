require_relative "employee.rb"

class Manager < Employee
    def initialize(name, title, salary, boss)
        super
        @employees = []
    end

    def bonus(multiplier)
        total_salary = 0
        @employees.each do |emp|
            total_salary += emp.bonus(multiplier)
            if emp.is_a?(Manager)
              total_salary += emp.salary * multiplier
            end
        end

        total_salary
    end

    def add_employee(employee)
      @employees << employee
    end
end
