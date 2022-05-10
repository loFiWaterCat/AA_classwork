class Manager < Employee
    def initialize(name, title, salary, boss)
        super
        @employees = []
    end

    def bonus(multiplier)
        total_salary = 0
        @employees.each do |emp|
            total_salary += emp.salary
        end
        
    end
end