#!/bin/bash -x

#This problem simulates a Gambler who starts with a stake and
#bets every game to win or loose some stake. Being a Calculative
#Gambler exits if the Stake reaches a high or a low limit

#CONSTANTS
IS_WIN=1
IS_LOOSE=0
STAKE=100
IS_RESIGN=0
declare -A array
#VARIABLES
everyGameBet=1

halfStake=$(( $STAKE / 2 ))
winLimit=$(( ( $STAKE + $halfStake ) - $STAKE ))
looseLimit=$(( ( $STAKE - $halfStake ) - $STAKE ))
totalStakeDay=0

for (( index=1; index<=20; index++ ))
do

randomNumber=$(( RANDOM%2 ))
if [ $randomNumber -eq $IS_WIN ]
	then
		totalStakeDay=$winLimit
		result="winning"
	else
		totalStakeDay=$looseLimit
		result="loosing"
fi
echo $index "day: "  $totalStakeDay "$result"
done
