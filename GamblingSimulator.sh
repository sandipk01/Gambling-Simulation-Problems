#!/bin/bash -x

#This problem simulates a Gambler who starts with a stake and
#bets every game to win or loose some stake. Being a Calculative
#Gambler exits if the Stake reaches a high or a low limit



#CONSTANTS
IS_WIN=1
IS_LOOSE=0
STAKE=100

#VARIABLES
everyDayStake=100
everyGameBet=1
randomNumber=0

randomNumber=$(( RANDOM % 2 ))

if [ $randomNumber -eq $IS_WIN  ]
	then
		printf "win: $everyGameBet\n"
		everyDayStake=$(( $everyDayStake + $everyGameBet ))
	else
		everyDayStake=$(( $everyDayStake - $everyGameBet ))
		printf "loose:$everyGameBet\n"
fi

printf "Total Money: $everyDayStake\n"
