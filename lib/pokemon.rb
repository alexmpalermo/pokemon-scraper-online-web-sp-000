class Pokemon
  attr_accessor :id, :name, :type, :db, :hp
  
  
  def initialize(id:, name:, type:, db:, hp: "60")
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end
  
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end
  
  def self.find(id, db)
    info = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    name = info[1]
    type = info[2]
    hp = info[3]
    

    object = Pokemon.new(id: id, name: name, type: type, db: db, hp: hp)
  end
  
  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp, @id)
  end
  
end
