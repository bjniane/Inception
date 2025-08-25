#!/bin/sh
echo -e "\n====================================================="
echo -e "\n=============== Setting up WordPress ================"
echo -e "\n====================================================="

cd /var/www/html

echo -e "\nDownloading WordPress..."
wp core download  --allow-root

echo -e "Creating wp-config.php..."
wp config create --allow-root \
    --dbname="${WP_NAME}" \
    --dbuser="${WP_USER}" \
    --dbpass="${WP_PASSWD}" \
    --dbhost="${WP_HOST}"

echo -e "\nInstalling WordPress..."
wp core install --allow-root \
    --url="${WP_URL}" \
    --title="${WP_TITLE}" \
    --admin_user="${WP_USER}" \
    --admin_password="${WP_PASSWD}" \
    --admin_email="${WP_EMAIL}"

echo -e "\nCreating the second user..."
wp user create --allow-root \
    "${WP_USER2}" \
    "${WP_EMAIL2}" \
    --user_pass="${WP_PASSWD2}" \
    --role=author

echo -e "\nInstalling redis plugin..."
wp plugin install redis-cache --activate --allow-root

echo -e "\nsetting up redis cache configuration..."
wp config set WP_REDIS_HOST redis --allow-root
wp config set WP_REDIS_PORT 6379 --allow-root

echo -e "\nEnabling Redis cache..."
wp redis enable --allow-root
wp redis status --allow-root

echo -e "\nWordPress setup complete!"

echo -e "\ntesting redis cache..."
wp cache set "test_key" "Hello from Redis!" --allow-root
wp cache get "test_key" --allow-root

exec php-fpm7.4 -F
