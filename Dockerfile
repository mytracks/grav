FROM php:8.0

RUN apt-get update && apt-get install -y unzip && rm -rf /var/lib/apt/lists/*

RUN curl https://get.symfony.com/cli/installer -o - | bash && mv /root/.symfony/bin/symfony /usr/local/bin/symfony

RUN cd / && curl -o grav.zip -SL https://getgrav.org/download/core/grav/1.7.0 && unzip grav.zip && rm grav.zip

WORKDIR /grav

RUN apt-get update && apt-get install -y libpng-dev libjpeg-dev zlib1g-dev libicu-dev libzip-dev && rm -rf /var/lib/apt/lists/* \
	&& docker-php-ext-configure gd --with-jpeg \
	&& docker-php-ext-configure intl \
	&& docker-php-ext-install gd zip intl

CMD ["bin/grav", "server", "--symfony", "--ansi", "--no-interaction", "--port=8080"]
