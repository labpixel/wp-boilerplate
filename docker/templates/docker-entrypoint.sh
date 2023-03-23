#!/usr/bin/env bash
set -Eeuo pipefail

if [[ "$1" == apache2* ]] || [ "$1" = 'php-fpm' ]; then
	uid="$(id -u)"
	gid="$(id -g)"
	if [ "$uid" = '0' ]; then
		case "$1" in
			apache2*)
				user="${APACHE_RUN_USER:-www-data}"
				group="${APACHE_RUN_GROUP:-www-data}"

				# strip off any '#' symbol ('#1000' is valid syntax for Apache)
				pound='#'
				user="${user#$pound}"
				group="${group#$pound}"
				;;
			*) # php-fpm
				user='www-data'
				group='www-data'
				;;
		esac
	else
		user="$uid"
		group="$gid"
	fi

  # check if keys.php does not exist
  if [ ! -f /var/www/html/web/keys.php ]; then
    # create keys.php with <?php
    echo "<?php" > /var/www/html/web/keys.php
    # copy text from https://api.wordpress.org/secret-key/1.1/salt/ using curl to keys.php
    curl https://api.wordpress.org/secret-key/1.1/salt/ >> /var/www/html/web/keys.php
  fi

	cp /var/www/html/wp-config.php /var/www/html/web/wp-config.php
	cp /var/www/html/wp-config-local.php /var/www/html/web/wp-config-local.php
	chown -R "$user:$group" /var/www/html/web
fi

exec "$@"
