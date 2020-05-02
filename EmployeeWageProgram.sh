#!/bin/bash -x
echo "Welcome to Employee Wage Comuptation Program"

function employeeAttendance() {
	local present=1;
	local checkRandom=$((RANDOM%2));
	if [ $checkRandom -eq $present ]
	then
		echo "Employee is present";
	else
		echo "Employee is absent";
	fi
}

function main() {
	local checkAttendance="$(employeeAttendance)";
	echo $checkAttendance;
}

main
