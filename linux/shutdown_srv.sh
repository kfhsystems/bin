#!/usr/bin/env bash

CONTROLLER="ansible_d@controller.karshi.ca"
check_status() {
        	sudo -u ansible_d ssh "${CONTROLLER}" "systemctl status automation-controller" | grep -qw "active"
}

while true; do
	if check_status
	then
		echo "The automation controller service is running. Waiting for it to turn off..."
		sleep 5
	else
		echo "The automation controller service is stopped"
		break
	fi
done
