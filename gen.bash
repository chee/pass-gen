#!/usr/bin/env bash

passname="$1"
user="$2"

cry () {
	echo "$0 <pass-name> [user-name]"
	exit 1
}

if [ "$passname" == "-h" ] || [ "$passname" == "--help" ]; then
	cry
fi

if [ -z "$passname" ]; then
	cry
fi

password=$(getpassword)
userline=""

if [ ! -z "$user" ]; then
	userline="user: $user"
fi

echo "$password
$userline" | pbcopy

pass edit $passname

echo -n $password | pbcopy

$HOME/bin/sync
