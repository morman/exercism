# bring in algorithm for sort()
import std/algorithm
# bring in random for randomize() and rand()
import std/random

# Call randomize() once to initialize the default random number generator.
# If this is not called, the same results will occur every time these
# examples are run.
randomize()

type
  Character* = object
    strength*: int
    dexterity*: int
    constitution*: int
    intelligence*: int
    wisdom*: int
    charisma*: int
    hitpoints*: int

proc ability*: int =
  # define dice as a type of int
  type
    dice = range[1..6]
  
  # define roll as array of 4 dice
  var  
    roll: array[4, dice]
    
  # generate potential ability score by rolling 4d6 
  roll[0] = rand(1..6)
  roll[1] = rand(1..6)
  roll[2] = rand(1..6)
  roll[3] = rand(1..6)

  # sort roll
  sort(roll)

  # return the sum of the 3 highest rolls 
  return roll[1] + roll[2] + roll[3]

proc modifier*(n: int): int =
  # TODO: build dictionary or switch
  case n
    of 3: 
      return -4
    of 4, 5:
      return -3
    of 6, 7:
      return -2
    of 8, 9:
      return -1
    of 10, 11:
      return 0
    of 12, 13:
      return 1
    of 14, 15:
      return 2 
    of 16, 17:
      return 3
    of 18:
      return 4
    else: discard   

proc initCharacter*: Character =
  # create character
  var
    character: Character

  # generate abilities 
  character.strength = ability()
  character.dexterity = ability()
  character.constitution = ability()
  character.intelligence = ability()
  character.wisdom = ability()
  character.charisma = ability()

  # assign hitpoints based on constitution
  character.hitpoints = 10 + modifier(character.constitution)
  
  return character
