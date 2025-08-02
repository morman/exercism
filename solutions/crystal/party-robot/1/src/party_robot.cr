class PartyRobot
  
  # we are making an instance method, but how to we get instance input
  def self.welcome(name : String) : String
    "Welcome to my party, #{name}!"
  end

  def self.happy_birthday(name : String, age : Int) : String
    "Happy birthday #{name}! You are now #{age} years old!"
  end

  def self.assign_table(name : String, direction : String, table : Int, distance : Float64, neighbor : String) : String
    "Welcome to my party, #{name}!\n" +
    # distance can only have decimal precision of tenths of a meter, so round 1 digit
    "You have been assigned to table #{table}. Your table is #{direction}, exactly #{distance.round(1)} meters from here.\n" +
    # get the first and last characters to make neighbor name
    "You will be sitting next to #{neighbor[0]}#{neighbor[neighbor.size - 1]}."
  end
end
