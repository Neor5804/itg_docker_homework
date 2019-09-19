#!/bin/bash

read -r -p "Delete old Docker versions? [Y/n]" -n 1
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
	echo "old versions will be deleted"
fi

echo "Happy end"
exit 0
