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
	local checkAttendance="$(employeeAttendance)";
	if [ $checkAttendance == "Present" ]
	then
		fullDayHour=8;
	else
		fullDayHour=0;
	fi
	echo "$((fullDayHour*wagePerHour))";
}

function main() {
	local dailyWage="$(employeeDailyWage)";
	echo $dailyWage;
}

main
