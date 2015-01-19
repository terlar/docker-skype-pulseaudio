#!/bin/bash
set -e

if [ "$1" = 'skype' ]; then
	USER_UID=${USER_UID:-1000}
	USER_GID=${USER_GID:-1000}

	# create user group
	if ! getent group skype >/dev/null; then
		groupadd -f -g ${USER_GID} skype
	fi

	# create user with uid and gid matching that of the host user
	if ! getent passwd skype >/dev/null; then
		adduser --uid ${USER_UID} --gid ${USER_GID} \
			--disabled-login \
			--gecos 'Skype' skype
	fi

	exec su skype -c "$@"
fi

exec "$@"
