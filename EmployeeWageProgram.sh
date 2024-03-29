#!/bin/bash -x
echo "Welcome to Employee Wage Computation Program"

#Array
declare -a dailyWageArray;

function employeeAttendance() {
	local present=1;
	local checkRandom=$((RANDOM%2));
	if [ $checkRandom -eq $present ]
	then
		echo "Present";
	else
		echo "Absent";
	fi
}

function employeeDailyWage() {
   local wagePerHour=20;
   local fullDayHour=0;
   local fullTimeEmployee=1;
   local partTimeEmployee=0;
   local workingDay=20;
   local totalWage=0;
   local totalHour=0;
   local day=1;
	local countWage=0;
   while [[ $day -le $workingDay && $totalHour -lt 100 ]]
   do
      local employeeType=$((RANDOM%2));
      case $employeeType in
         0) fullDayHour=4;;
         1) fullDayHour=8;;
         *) fullDayHour=0;;
      esac
		local wage=$((fullDayHour * wagePerHour));
		dailyWageArray[$countWage]=$wage;
		((countWage++));
      totalHour=$((totalHour + fullDayHour));
      totalWage=$((totalWage + wage));
      ((day++));
   done
	dailyWageArray[$countWage]=$totalWage;
	if [[ $totalHour -gt 100 ]]
	then
		local extraHour=$((totalHour % 10));
		totalHour=$((totalHour - extraHour));
	fi
	echo $totalHour;
}

function main() {
	local checkAttendance="$(employeeAttendance)";
	if [ $checkAttendance == "Present" ]
   then
		local totalHour="$(employeeDailyWage)";
		echo $totalHour;
	fi
}

main

