class Dog
  
  attr_accessor :name, :breed, :id
  
  def initialize(id: nil, name:, breed:)
    @id = id
    @name = name 
    @breed = breed
  end
  
  def self.create_table
    sql = <<-SQL
    create table dogs if not exist dogs (
    id Integer primary key, 
    name text,
    breed text
    );
    SQL
    
    DB[:conn].executre(sql)
  end
end