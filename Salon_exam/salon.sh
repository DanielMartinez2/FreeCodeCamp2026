#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=salon -t --no-align -c"

echo -e "\n~~~~~ MY SALON ~~~~~"

MAIN_MENU() {
  while true
  do
    echo -e "\nWhat service would you like?"

    $PSQL "SELECT service_id || ') ' || name
    FROM services
    ORDER BY service_id"

    read SERVICE_ID_SELECTED

    
    if [[ $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
    then
      SERVICE_NAME=$($PSQL "SELECT name
      FROM services
      WHERE service_id = $SERVICE_ID_SELECTED")
    else
      SERVICE_NAME=""
    fi

    if [[ -n $SERVICE_NAME ]]
    then
      break
    fi

    echo -e "\nI could not find that service. What would you like today?"
  done

  GET_CUSTOMER
}

GET_CUSTOMER() {
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE

  CUSTOMER_ID=$($PSQL "SELECT customer_id
  FROM customers
  WHERE phone = '$CUSTOMER_PHONE'")

  if [[ -z $CUSTOMER_ID ]]
  then
    REGISTER_CUSTOMER
  else
    CUSTOMER_NAME=$($PSQL "SELECT name
    FROM customers
    WHERE phone = '$CUSTOMER_PHONE'")
  fi

  REGISTER_APPOINTMENT
}

REGISTER_CUSTOMER() {
  echo -e "\nI don't have a record for that phone number, what's your name?"
  read CUSTOMER_NAME

  $PSQL "INSERT INTO customers(name, phone)
  VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')" > /dev/null

  CUSTOMER_ID=$($PSQL "SELECT customer_id
  FROM customers
  WHERE phone = '$CUSTOMER_PHONE'")
}

REGISTER_APPOINTMENT() {
  echo -e "\nWhat time would you like your $SERVICE_NAME, $CUSTOMER_NAME?"
  read SERVICE_TIME

  $PSQL "INSERT INTO appointments(customer_id, service_id, time)
  VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')" > /dev/null

  echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
}

MAIN_MENU