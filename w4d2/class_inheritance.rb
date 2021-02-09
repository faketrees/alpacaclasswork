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

    

    def bonus(multiplier)

    end

end