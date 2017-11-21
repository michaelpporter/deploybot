FROM dsabanin/deploybot-containers:ubuntu14-v1
# if we want to install via apt

RUN sudo add-apt-repository ppa:ondrej/php
RUN sudo apt-get update
RUN sudo apt-get install php5.6 php5.6-mbstring php5.6-mcrypt php5.6-mysql php5.6-xml \
  php5.6-apcu php5.6-zip php5.6-gd php5.6-curl -y
RUN sudo a2dismod php5
RUN sudo a2enmod php5.6
RUN sudo service apache2 restart
RUN rm /etc/alternatives/php
RUN ln -s /usr/bin/php5.6 /etc/alternatives/php
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer