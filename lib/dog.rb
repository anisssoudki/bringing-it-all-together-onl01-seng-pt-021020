class Dog
    
    attr_accessor :name, :breed, :id

    def initialize(id:nil,name:,breed:)
        @name = name
        @breed = breed
        @id = id
    end

    def self.create_table
        sql = <<-SQL
            CREATE TABLE if NOT EXISTS dogs (
                id INTEGER PRIMARY KEY,
                name TEXT,
                breed TEXT
            );
            SQL
        DB[:conn].execute(sql)
    end
    
    def self.drop_table
      DB[:conn].execute("DROP TABLE dogs;")
    end
    
   def save
        if self.id
            update
        else
            sql = "INSERT INTO dogs (name, breed) VALUES (?,?)"
            DB[:conn].execute(sql,self.name,self.breed)
            @id = DB[:conn].execute("SELECT last_insert_rowid() FROM dogs")[0][0]
        end
        self
    end
  
end