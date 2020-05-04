#!/bin/bash -x
echo "Welcome to Employee Wage Comuptation Program"

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
   while [[ $day -le $workingDay && $totalHour -lt 100 ]]
   do
      local employeeType=$((RANDOM%2));
      case $employeeType in
         0) fullDayHour=4;;
         1) fullDayHour=8;;
         *) fullDayHour=0;;
      esac
      totalHour=$((totalHour + fullDayHour));
      totalWage=$((totalWage + fullDayHour * wagePerHour));
      ((day++));
   done
	echo $totalWage;
}

function main() {
	local checkAttendance="$(employeeAttendance)";
	if [ $checkAttendance == "Present" ]
   then
		local totalWage="$(employeeDailyWage)";
		echo $totalWage;
	fi
}

main
