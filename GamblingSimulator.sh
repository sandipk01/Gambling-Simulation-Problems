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
	MonthWinorLoose=0
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
findLuckieDay
findUnluckieDay
done
}

function findLuckieDay()
{
local max=0
local day=1
for (( index=1; index<=${#dailyStake[@]}; index++ ))
do
   if [ "${dailyStake["$index"]}" -gt $max ]
		then
			day=$index
			max="${dailyStake["$index"]}"
	fi
done
echo "luckie day" $day "--" $max
}

function findUnluckieDay()
{
local min=${dailyStake[1]}
local day=1
for (( index=1; index<=${#dailyStake[@]}; index++ ))
do
   if [ "${dailyStake["$index"]}" -le 0 ]
      then
         if [ "${dailyStake["$index"]}" -lt $min ]
   			then
					day=$index
					min="${dailyStake["$index"]}"
			fi
	fi
done
echo "unluckie day" $day "--" $min
}

function show(){
for (( index=1; index<=${#dailyStake[@]}; index++ ))
do
	echo  $index "---" "${dailyStake["$index"]}"
done

}

#arg 1-days 2-months
play 20 3

