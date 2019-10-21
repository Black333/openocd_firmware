#!/bin/bash

readonly CONFIG="config.sh"

DEF_INTERFACE="stlink"
DEF_TARGET="stm32h7x"

read_config() {
	if [ -f ${SCRIPTPATH}/${CONFIG} ]; then
		source ${SCRIPTPATH}/${CONFIG}
		echo "Read ${CONFIG}"
	else
		echo "Info: ${CONFIG} file does not exist"
	fi
}

find_interface() {
	local result=$(find ${PATH_SHARE_OPENOCD}/scripts/interface -name ${INTERFACE}.cfg)

	if [ ${result} ] ; then
		echo "OK: Interface - ${INTERFACE}.cfg"
	else
		echo "Error: Interface - ${INTERFACE}.cfg file not found"
		app_exit
	fi
}

interface() {
	if [[ -n ${INTERFACE} ]] ; then
		echo ""
	else
		INTERFACE="${DEF_INTERFACE}"
		echo "Info: Default interface = ${INTERFACE}"
	fi
	find_interface	
}


find_target() {
	local result=$(find ${PATH_SHARE_OPENOCD}/scripts/target -name ${TARGET}.cfg)

	if [ ${result} ] ; then
		echo "OK: Target - ${TARGET}.cfg"
	else
		echo "Error: Target - ${TARGET}.cfg file not found"
		app_exit
	fi
}

target() {
	if [[ -n ${TARGET} ]] ; then
		echo ""
	else
		TARGET="${DEF_TARGET}"
		echo "Info: Default target = ${TARGET}"
	fi
	find_target
}


app_exit() {
	echo
	echo "EXIT `date +%H:%M:%S`";
	exit 0
}

app_common() {
	###

	read_config

	###

	interface

	###

	target

	###
}