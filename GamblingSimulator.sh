#!/bin/bash -x

#This problem simulates a Gambler who starts with a stake and
#bets every game to win or loose some stake. Being a Calculative
#Gambler exits if the Stake reaches a high or a low limit

#CONSTANTS
IS_WIN=1
IS_LOOSE=0
STAKE=100
IS_RESIGN=0
declare -A dailyStake
#VARIABLES
declare -a dailyWin
everyGameBet=1
halfStake=$(( $STAKE / 2 ))
winLimit=$(( ( $STAKE + $halfStake ) - $STAKE ))
looseLimit=$(( ( $STAKE - $halfStake ) - $STAKE ))
totalStakeDay=0
MonthWinorLoose=0


function play()
{
for (( index1=1; index1<=$2; index1++ ))
do
	echo  $index1 "months"
	for (( index=1; index<=$1; index++ ))
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
		MonthWinorLoose=$(( $MonthWinorLoose + $totalStakeDay ))
		echo $index "day: "  $totalStakeDay "$result | total: $MonthWinorLoose"
		dailyStake[$index]=$MonthWinorLoose
	done
show
done
}


function show(){
for (( index=1; index<=${#dailyStake[@]}; index++ ))
do
	echo  $index "---" "${dailyStake["$index"]}"
done

}

#arg 1-days 2-months
play 20 3

