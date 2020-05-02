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
	local employeeType=$((RANDOM%2));
	case $employeeType in
		0) fullDayHour=4;;
		1) fullDayHour=8;;
		*) fullDayHour=0;;
	esac
	echo "$((fullDayHour*wagePerHour))";
}

function main() {
	local checkAttendance="$(employeeAttendance)";
	if [ $checkAttendance == "Present" ]
   then
		local dailyWage="$(employeeDailyWage)";
		echo $dailyWage;
	fi
}

main
