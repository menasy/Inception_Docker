	FROM debian:bullseye

	RUN apt-get update && apt-get install -y nginx openssl

	RUN mkdir /etc/nginx/ssl

	COPY ./conf/nginx.conf /etc/nginx/sites-enabled/default

	COPY ./tools/installer.sh /var/www

	RUN chmod +x /var/www/installer.sh
	RUN mkdir -p /run/nginx

	ENTRYPOINT ["var/www/installer.sh"]

	EXPOSE 443

	CMD ["nginx", "-g", "daemon off;"]