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
        if self.id == true
            update
        else
            sql = "INSERT INTO dogs (name, breed) VALUES (?,?)"
            DB[:conn].execute(sql, self.name, self.breed)
            @id = DB[:conn].execute("SELECT last_insert_rowid() FROM dogs")[0][0]
        end
        self
    end
    
    def self.create(name:, breed:) 
      dog = self.new(name: name, breed: breed)
      dog.save
      dog
    end
    
    def self.new_from_db(row)
      
     self.create(name: row[1], breed: row[2])
     
    end
    
    def self.find_by_id
      
      
    end
    
    
  
end