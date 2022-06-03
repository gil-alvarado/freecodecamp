#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

if [[ -z $1 ]]
then 
  echo "Please provide an element as an argument."
#if argument is a number
elif [[ $1 =~ ^[0-9]+$ ]]
then
  ELEMENT_PROPERTIES=$($PSQL "SELECT atomic_number, symbol, name, atomic_mass, melting_point_celsius, boiling_point_celsius, type
  FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE atomic_number = $1; ")

  #if not found
  if [[ -z $ELEMENT_PROPERTIES ]]
  then 
    echo "I could not find that element in the database."
  else
    echo "$ELEMENT_PROPERTIES" | while read ATOMIC_NUMBER BAR SYMBOL BAR NAME BAR MASS BAR MELT_POINT BAR BOIL_POINT BAR TYPE
    do
      

      echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELT_POINT celsius and a boiling point of $BOIL_POINT celsius."
    done
  fi
#end elif
else 
  ELEMENT_PROPERTIES=$($PSQL "SELECT atomic_number, symbol, name, atomic_mass, melting_point_celsius, boiling_point_celsius, type
  FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE name LIKE '$1%' ORDER BY atomic_number LIMIT 1 ")

#if not found
  if [[ -z $ELEMENT_PROPERTIES ]]
  then 
    echo "I could not find that element in the database."
  else
    echo "$ELEMENT_PROPERTIES" | while read ATOMIC_NUMBER BAR SYMBOL BAR NAME BAR MASS BAR MELT_POINT BAR BOIL_POINT BAR TYPE
    do
      echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELT_POINT celsius and a boiling point of $BOIL_POINT celsius."
    done
  fi
fi
