#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
TRUNCATE_TABLES=$($PSQL "TRUNCATE TABLE games, teams RESTART IDENTITY")

while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do 
  #ignora cabeçalho
  if [[ $YEAR != 'year' ]]  
    then
    #Verifica se vencedor existe 
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER' ")
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT' ")
    if [[ -z $WINNER_ID ]]
      then
      #insere vencedor 
      INSERT_WINNER_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
      #pega o id do vencedor
      WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER' ")
    fi
    if [[ -z $OPPONENT_ID ]]
      then
      #insere perdedor
      INSERT_OPPONENT_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
      #Pega o id do perdedor
      OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT' ")
    fi   
  #insere jogos
    INSERT_GAME=$($PSQL "INSERT INTO games(year,round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES ($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)")    
  fi  
done < games.csv
echo "Teams and Games were inserted"
