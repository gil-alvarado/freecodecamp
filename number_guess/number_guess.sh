#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo "Enter your username:" 
read USERNAME

USER_INFO=$($PSQL "SELECT * FROM users WHERE name='$USERNAME'")

if [[ ! -z $USER_INFO ]]
then 
  GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE name = '$USERNAME'")
  BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE name = '$USERNAME'")
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
else
  INSERT_USERNAME_RESULT=$($PSQL "INSERT INTO users(name, games_played, best_game) VALUES('$USERNAME',0,0);")
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  GAMES_PLAYED=0
  BEST_GAME=0
fi

GET_INPUT(){

if [[ ! $1 ]]
then
echo -e "\nGuess the secret number between 1 and 1000: "
elif [[ $1 == ">" ]] 
then
  echo "It's lower than that, guess again: "
elif [[ $1 == "<" ]]
then 
  echo "It's higher than that, guess again: "
else
  echo "That is not an integer, guess again: "
fi
read USER_INPUT

}

RAND=$(( RANDOM % 1000 ))
COUNT=1
echo $RAND

GET_INPUT

until [[ $USER_INPUT == $RAND ]]
do
if [[ ! $USER_INPUT =~ ^[0-9]+$ ]]
then
  GET_INPUT repeat
elif [[ $USER_INPUT > $RAND ]]
then
  GET_INPUT ">"
else
  GET_INPUT "<"
fi
((COUNT++))
done
echo "You guessed it in $COUNT tries. The secret number was $USER_INPUT. Nice job!"

((GAMES_PLAYED++))
if [[ $BEST_GAME == 0 ]]
then
  UPDATE_BEST_GAME=$($PSQL "UPDATE users SET best_game = $COUNT WHERE name = '$USERNAME'")
fi
if [[ $COUNT < $BEST_GAME ]]
then
  UPDATE_BEST_GAME=$($PSQL "UPDATE users SET best_game = $COUNT WHERE name = '$USERNAME'")
fi
UPDATE_GAMES_PLAYED=$($PSQL "UPDATE users SET games_played = $GAMES_PLAYED WHERE name = '$USERNAME'")

