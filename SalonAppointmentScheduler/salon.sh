#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~"

MAIN_MENU()
{

################
    if [[ $1 ]]
    then
    echo -e "\n$1\n"
    else
    echo -e "\nWelcome to My Salon, how can I help you?\n"
    fi
################

    AVAILABLE_SERVICES=$($PSQL "SELECT service_id, name FROM services")

    echo "$AVAILABLE_SERVICES" | while read SERVICE_ID BAR SERVICE_NAME
    do
        echo "$SERVICE_ID) $SERVICE_NAME"
    done

    read SERVICE_ID_SELECTED
        
    if [[ ! $SERVICE_ID_SELECTED =~ ^[1-5]+$ ]]
    then
        # display menu for invalid entry
        MAIN_MENU "I could not find that service. What would you like today?"
    else
        SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
        SERVICE_NAME_FORMATTED=$(echo $SERVICE_NAME | sed 's/ |/"/')
        # ask for phone number
        echo -e "\nWhat's your phone number?"
        read CUSTOMER_PHONE
        # get customer name
        CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")

        if [[ -z $CUSTOMER_NAME ]]
        then
            echo -e "\nI don't have a record for that phone number, what's your name?"
            read CUSTOMER_NAME

        # insert new customer
        INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')") 
        fi
        CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
        # prompt time
        echo -e "\nWhat time would you like your $SERVICE_NAME_FORMATTED, $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')?"
        read SERVICE_TIME

        # TODO: INSERT APPOINTMENT
        INSERT_APP_RESULT=$($PSQL "INSERT INTO appointments(time, customer_id, service_id) VALUES('$SERVICE_TIME', $CUSTOMER_ID, $SERVICE_ID_SELECTED)")

        echo "\nI have put you down for a $SERVICE_NAME_FORMATTED at $SERVICE_TIME, $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')."
fi
}

MAIN_MENU
