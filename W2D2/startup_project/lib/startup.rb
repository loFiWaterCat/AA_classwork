require "employee"

class Startup
  attr_reader :name, :funding, :salaries, :employees

  def initialize(name, funding, salaries)
    @name = name
    @funding = funding
    @salaries = salaries
    @employees = []
  end

  def valid_title?(title)
    return true if @salaries.has_key?(title)
    false
  end

  def >(name)
    return true if @funding > name.funding
    false
  end

  def hire(name, title)
    if valid_title?(title)
      @employees << Employee.new(name, title)
    else
      raise RuntimeError.new("Invalid title")
    end
  end

  def size
    @employees.length
  end

  def pay_employee(name)
    salary = @salaries[name.title]
    if salary < @funding
      name.pay(salary)
      @funding -= salary
    else
      raise RuntimeError.new("Not enough funding")
    end
  end

  def payday
    @employees.each do |em|
      pay_employee(em)
    end
  end

  def average_salary
    total = 0

    @employees.each do |em|
      total += @salaries[em.title]
    end

    total / (@employees.length * 1.0)
  end

  def close
    @employees = []
    @funding = 0
  end

  def acquire(name)
    @funding += name.funding
    name.salaries.each do |title, salary|
      if !@salaries.has_key?(title)
        @salaries[title] = salary
      end
    end
    name.employees.each do |el|
      @employees << el
    end
    name.close
  end

end
