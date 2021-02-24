require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  
  def self.columns
    return @columns if @columns
    cols = DBConnection.execute2(<<-SQL).first
                                        SELECT
                                          *
                                        FROM
                                          #{self.table_name}
                                        LIMIT
                                          0
                                    SQL
    cols.map!(&:to_sym)
    @columns = cols

  end

  def self.finalize!
    self.columns.each do |col|

    end

  end

  def self.table_name=(table_name)
    @table_name = table_name
    # ...
  end

  def self.table_name
    @table_name || self.name.underscore.pluralize
    # ...
  end

  def self.all
    arr = DBConnection.execute(<<-SQL)
                                  SELECT
                                    #{table_name}.*
                                  FROM
                                    #{table_name}
                                SQL
    # ...
  end

  def self.parse_all(results)
    results.map { |result| self.new(result) }
  end

  def self.find(id)
    # results = DBConnection.execute(<<-SQL, id)
    #                                         SELECT
    #                                           #{table_name}.*
    #                                         FROM
    #                                           #{table_name}
    #                                         WHERE
    #                                           #{table_name}.id = ?
    #                                   SQL
    # # ...
  end

  def initialize(params = {})
    # ...
  end

  def attributes
    @attributes ||= {}
  end

  def attribute_values
    self.attributes.values
    # ...
  end

  def insert
    # ...
  end

  def update
    # ...
  end

  def save
    # ...
  end
end
