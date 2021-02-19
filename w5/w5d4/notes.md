active record is the M in MVC it is an ORM
    -represent models
    -represent associations
    -valid models and make sure they persist in Databases
    -perform all database operations (CRUD) in OOP fashion
        -C create
        -R read
        -U update
        -D delete/destroy
    

Migrations
    what is a migration
        an incremental and reversible change made to a database schema, allowing it to evolve over time
        not just ubiquitous to rails
        git is an example of db migration****
    rails allows you to use Ruby DSL to write SQL

Common terminal commands
    bundle exec g migration Create{Tablename}
    bundle exec g migration Add{ColumnName}To{Table}
    bundle exec g migration Remove{ColumnName}From{Table}
    bundle exec g migration AddIndexTo{Tablename}
    bundle exec g model {ModelName}

    common migration methods
        create_table
        add_column
        change_column
        remove_index
        add_index
        rename_column

    bundle exec rails db:migrate:status

    db:rollback
        don't use if you aren't the sole developer
        undoes most recent migration

    rake db:migrate:reset 

    rails _5.2.3_ new <application_name> <database type, default is SQLite3>

    rails _5.2.3_ new Bluebird --database=postgresql -G
        -G stops git commit
        -Creates the app 'Bluebird'
        -sets postgresql as the db
        -rails version 5.2.3

tables need to be snake case and pluralized
    add_index <table name>, <column name> ,options
        -good options for add index are unique: true
            column name can be an array
                -   [chirp_id, liker_id], unique: true
    
    should add a t.timestamps to your DB

bundle exec annotate --model



model validation is not perfectly reliable
    -use database constraints in addition to model validation

constraint - sets it on the database
validation - user experience



Common validations
    -validates :some_column, presence: true
        -similar to null: false
    -validates :other_column, uniqueness:true
        -similar to unique: true
    Custom Validations

pry rails
    -use reload! instead of reset

.create 
    -.new
    &
    -.save

Colons and Commas are super important
NOTE THE S's
validates - uses built in validations
validate - custom validate

    validates :liker_id, uniqueness: {scope: :chirp_id}

    belongs_to :chirp,
        foreign_key: :chirp_id,
        class_name: :Chirp

DONT FORGET THE COMMAS
Associations
    -belongs_to
        one to many
        -puts validations on automatically for the specific foreign key unless you create       optional: true 
            -optional: true does not overwrite custom validation


    -has_many
        many to one
    -many_to_many
        to be learned later (uses a joins table, think instructor_friendships table)



        belongs_to :method #this is a method name generally whatever table/class you are going to write the has_many definition
            primary_key: :id, #this doesn't change
            foreign key: :method_id, #points to the method_id
            class_name: Method #class of the method

        has_many :method #this should point to the table of belongs to, similar to has_one
            primary_key: :id,
            foreign_key: method_id
            class_name: :Method 

    #many_to_many is 2x has_many with a joins table
    has_many through

    to write
        -open schema
        -find foreign key
            belongs to goes on table with foreign key
            every belongs_to will have a has_many that goes with it
        -go write has_many
        


Foreign key is found in foreign table

belongs_to
    primary_key: :a
    foreign_key: :b
    class_name: Table_of_b

has_many
    primary_key: :b
    foreign_key: :a
    class_name: Table_of_a


has_many :can_be_whatever
    through: :method_name_in_the_model
    source: :method_name_on_other_table

