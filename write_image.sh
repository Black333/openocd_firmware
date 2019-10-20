#!/bin/bash

OFFSET=""
FILENAME=""

source ./common.sh

app_help()
{
	cat << help
	-i, --interface			Use the interface driver name to connect to the target.
							[jlink, stlink, ...]
	-t, --target			Target CPU name.
							[stm32f0x, stm32f1x, stm32h7x, ...]
	-f, --file				File firmware [.bin]
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
		-f | --file) 			FILENAME=$2
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

if [ -z $FILENAME ]; then
	echo "Error: file not selected"
	app_exit
fi

###

app_common

###

echo

openocd -f interface/${INTERFACE}.cfg -f target/${TARGET}.cfg -c "init" -c "reset init" -c "flash write_image erase ./${FILENAME} ${DEF_OFFSET}" -c "verify_image ./${FILENAME} ${DEF_OFFSET} bin" -c "reset" -c "shutdown"

app_exit