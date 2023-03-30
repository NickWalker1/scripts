#!/bin/bash

ID=$(id -u)


DEVICE=/dev/sda

if [ ! $# -eq 0 ]
  then
    DEVICE=$1
fi


if [[ ${ID} != 0 ]]; then
	printf "Must be super user...\n"
	exit 1
fi

cryptsetup luksOpen ${DEVICE} nick-mem
if [ $? != 0 ]; then
	printf "Failed luksOpen. Aborting...\n"
	exit 1
fi

#mount -a

mount -t vfat /dev/mapper/nick-mem /mnt/nick-mem/ -o uid=1000,gid=1000

if [ $? = 0 ]; then
	printf "Successful mount to /mnt/nick-mem/\n"
fi
