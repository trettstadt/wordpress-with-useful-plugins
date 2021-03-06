FROM wordpress:5.4.1-php7.4-apache

RUN set -eux; \
	apt-get update; \
	apt-get install -y --no-install-recommends \
		unzip \
	; \
	rm -rf /var/lib/apt/lists/*

RUN set -ex; \
    curl -o w3-total-cache.zip -fSL "https://downloads.wordpress.org/plugin/w3-total-cache.0.14.1.zip"; \
    unzip w3-total-cache.zip -d /usr/src/wordpress/wp-content/plugins; \
    rm w3-total-cache.zip; \
    chown -R www-data:www-data /usr/src/wordpress/wp-content/plugins/w3-total-cache
