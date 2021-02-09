class Employee

    attr_reader :name, :salary, :title, :boss
    attr_writer :boss

    def initialize(name, title, salary, boss = nil)
        @name = name
        @title = title
        @salary = salary
        @boss = boss
    end

    def bonus(multiplier)
        salary * multiplier
    end

end

class Manager < Employee

    attr_reader :name, :title, :salary, :boss, :employees
    attr_writer :boss

    def initialize(name, title, salary, boss = nil)
        super(name, title, salary, boss)
        @employees = []
    end

    def salary_tree
        salaries = 0
        self.employees.each do |em|
            if em.is_a?(Manager)
                salaries += em.salary + em.salary_tree
            else
                salaries += em.salary 
            end
        end

        salaries
    end

    def bonus(multiplier)
        self.salary_tree * multiplier
    end

end

ned = Manager.new("Ned", 1000000, "Founder")
darren = Manager.new("Darren", 78000, "TA Manager", ned)
shawna = Employee.new("Shawna", 12000, "TA", darren)
david = Employee.new("David", 10000, "TA", darren)

p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000