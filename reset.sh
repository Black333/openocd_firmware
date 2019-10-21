#!/bin/bash

SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")

source ${SCRIPTPATH}/common.sh

app_help()
{
	cat << help
	-i, --interface			Use the interface driver name to connect to the target."
							[jlink, stlink, ...]"
	-t, --target			Target CPU name"
							[stm32f0x, stm32f1x, stm32h7x, ...]"
help
  exit 0
}


while [ "$1" != "" ]; do
	case $1 in
		-i | --interface)		INTERFACE=$2
								shift
								;;
		-t | --target) 			TARGET=$2
								shift
								;;
		-h | --help)			app_help
								exit
								;;
		*)						echo "$1 is not an option"
								exit
								;;
	esac
	shift
done

###

app_common

###

echo

openocd -f interface/${INTERFACE}.cfg -f target/${TARGET}.cfg -c "init" -c "reset" -c "shutdown"

app_exit