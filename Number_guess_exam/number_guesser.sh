#!/bin/bash
#random number guesser
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
RANDOM_NUMBER=$((RANDOM % 1000 + 1))
ROUND_NUMBER=0
echo "Enter your username:"
read USERNAME
USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME' ")
if [[ -z $USER_ID ]]
  then  
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  INSERT_USER=$($PSQL "INSERT INTO users(username) values ('$USERNAME')")
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME' ")
else
  USER_DATA=$($PSQL "SELECT COUNT(*), MIN(rounds) FROM games WHERE user_id = $USER_ID")
  IFS="|" read GAMES_PLAYED BEST_GAME <<< "$USER_DATA"
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi
echo "Guess the secret number between 1 and 1000:"
while read GUESS
do  
  ((ROUND_NUMBER++))
  #check if is integer
  if [[ ! $GUESS =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
  elif [[ $GUESS -eq $RANDOM_NUMBER ]]
  then
    echo "You guessed it in $ROUND_NUMBER tries. The secret number was $RANDOM_NUMBER. Nice job!"
    INSERT_GAME=$($PSQL "INSERT INTO games(user_id, rounds) values ($USER_ID, $ROUND_NUMBER)")
    break 
  elif [[ $GUESS -gt $RANDOM_NUMBER ]]
  then
    echo "It's lower than that, guess again:"
  else
    echo "It's higher than that, guess again:"
  fi  
done

