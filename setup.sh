#!/usr/bin/env bash
sudo chmod 777 /bp_src
apt-get update && apt-get -y  upgrade
apt-get -y  install software-properties-common python-software-properties
add-apt-repository -y  ppa:ondrej/php && apt-get update
debconf-set-selections <<< 'mysql-server mysql-server/root_password password pass666666'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password pass666666'
sudo apt-get -y  install git  m4 make dh-autoreconf pkg-config mysql-server libmysqlclient-dev python-mysqldb libssl-dev libcurl4-openssl-dev  libapache2-mod-php5 php5-mysql php5-cli php5-gd
mkdir /opt/boinc && git clone https://github.com/BOINC/boinc.git /opt/boinc
cd /opt/boinc && ./_autosetup && ./configure --disable-client --disable-manager && make
cd /opt/boinc/tools && touch k.k && exec 6>&1 && exec > k.k && echo y && exec 1>&6 6>&-
touch m.db.sc && exec 6>&1 && exec > m.db.sc && echo "GRANT ALL ON *.* TO 'vagrant'@'%';" && echo "SET PASSWORD FOR 'vagrant'@'%'='';" && exec 1>&6 6>&-
mysql -h localhost -u root --password=pass666 < m.db.sc
./make_project  --url_base=http://192.168.33.10/ --db_host=localhost --db_user=vagrant --project_root=/bp_src/mbp  mbp < k.k
cd /opt/boinc/tools && rm k.k && rm m.db.sc

