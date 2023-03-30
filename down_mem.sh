#!/bin/bash

#TODO check where mounted incase of automount

ID=$(id -u)

if [[ ${ID} != 0 ]]; then
	printf "Must be super user...\n"
	exit 1
fi


umount /mnt/nick-mem

if [ $? != 0 ]; then
	printf "Aborting...\n"
	exit 1
fi

cryptsetup luksClose nick-mem

printf "Successfully unmounted nick-mem\n"
