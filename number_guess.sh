#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=number_guess --tuples-only -c"

echo "Enter your username:"
read USERNAME

USER_RECORD=$($PSQL "SELECT user_id, username, games_played, best_game FROM users WHERE username='$USERNAME'")

if [[ -z $USER_RECORD ]]; then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  $PSQL "INSERT INTO users(username) VALUES('$USERNAME')"
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
  GAMES_PLAYED=0
  BEST_GAME=1000
else
  echo "$USER_RECORD" | while read USER_ID BAR NAME BAR GAMES_PLAYED BAR BEST_GAME; do
    echo "Welcome back, $NAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  done
fi

SECRET_NUMBER=$((RANDOM % 1000 + 1))
GUESSES=0

echo "Guess the secret number between 1 and 1000:"
while true; do
  read GUESS

  if ! [[ "$GUESS" =~ ^[0-9]+$ ]]; then
    echo "That is not an integer, guess again:"
    continue
  fi

  GUESSES=$((GUESSES + 1))

  if [[ $GUESS -lt $SECRET_NUMBER ]]; then
    echo "It's higher than that, guess again:"
  elif [[ $GUESS -gt $SECRET_NUMBER ]]; then
    echo "It's lower than that, guess again:"
  else
    echo "You guessed it in $GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
    break
  fi
done

USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(user_id, guesses) VALUES($USER_ID, $GUESSES)")
INSERT_GAME_INFO_RESULT=$($PSQL "UPDATE users SET games_played = games_played + 1 WHERE user_id = $USER_ID")

if [[ $GUESSES -lt $BEST_GAME ]]; then
  INSERT_BEST_GAME_RESULT=$($PSQL "UPDATE users SET best_game = $GUESSES WHERE user_id = $USER_ID")
fi