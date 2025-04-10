#!/bin/sh
set -e
    MYSQL_PASSWORD=$(cat /run/secrets/db_password)
    MYSQL_ROOT_PASSWORD=$(cat /run/secrets/db_root_password)
    WORDPRESS_DB_USER=$(cat /run/secrets/db_user)
    echo "WordPress Downloading"

    if [ -f ./wp-config.php ]; then
        echo "WordPress already downloaded"
        exec "$@"
    fi

    if [ -d ./wp-admin ] || [ -d ./wp-content ] || [ -d ./wp-includes ]; then
      echo "WordPress files already exist. Skipping extraction."
      rm -rf ./wp-admin ./wp-content ./wp-includes
    fi
    
    echo "Downloading WordPress..."
    wget -q http://wordpress.org/latest.tar.gz
    echo "Extracting WordPress..."
    tar xfz latest.tar.gz
    mv wordpress/* .
    
    rm -rf latest.tar.gz
    rm -rf wordpress
    
    if ! command -v wp &> /dev/null; then
      echo "WP-CLI not found. Installing..."
      curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
      chmod +x wp-cli.phar
      mv wp-cli.phar /usr/local/bin/wp
      php /usr/local/bin/wp --info
      if [ $? -ne 0 ]; then
        echo "Error: WP-CLI installation failed."
        exit 1
      fi
    fi

    wp config create --dbname=$WORDPRESS_DB_NAME --dbuser=$WORDPRESS_DB_USER --dbpass=$MYSQL_PASSWORD --dbhost=$WORDPRESS_DB_HOST --skip-check --allow-root

    wp core install --url="https://mehmyilm.42.fr" --title="My WordPress Site" --admin_user="menasy" --admin_password=$MYSQL_ROOT_PASSWORD --admin_email="mehmyilm@example.com" --allow-root

    wp option update blogname "My WordPress Site" --allow-root
    wp option update blogdescription "Just another WordPress site" --allow-root


exec "$@"