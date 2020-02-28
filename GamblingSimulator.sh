#!/bin/bash -x

#This problem simulates a Gambler who starts with a stake and
#bets every game to win or loose some stake. Being a Calculative
#Gambler exits if the Stake reaches a high or a low limit



everyGameBet=1
#CONSTANTS
IS_WIN=1
IS_LOOSE=0
STAKE=100
IS_RESIGN=0

#VARIABLES
randomNumber=0
totalStakeDay=0

function play()
{
halfStake=$(( $STAKE / 2 ))
winLimit=$(( ( $STAKE + $halfStake ) - $STAKE ))
looseLimit=$(( ( $STAKE - $halfStake ) - $STAKE ))

echo $winLimit $looseLimit

while [ $IS_RESIGN == 0 ]
do
   randomNumber=$(( RANDOM % 2 ))
   if [ $randomNumber -eq $IS_WIN  ]
      then
         totalStakeDay=$(( $totalStakeDay + $everyGameBet ))
      else
         totalStakeDay=$(( $totalStakeDay - $everyGameBet ))
   fi
      if [ $totalStakeDay -ge $winLimit -o $totalStakeDay -le $looseLimit ]
         then
            printf "Resign for the day\n"
            IS_RESIGN=1
      fi
done
  echo $totalStakeDay
}

printf "$( play )"
