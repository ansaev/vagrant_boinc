#!/usr/bin/env bash
sudo ln -s  /bp_src/mbp/apache__boinc_server_mbp.conf /etc/apache2/sites-enabled/apache__boinc_server_mbp.conf
# additing data about platform applications
cd /bp_src/mbp && bin/xadd
# additing password pass666 for user vagrant in admin panel
cd /bp_src/mbp/html/ops && touch k.k && exec 6>&1 && exec > k.k && echo 'pass666' && exec 1>&6 6>&-
htpasswd -c -i .htpasswd vagrant < k.k
cd /bp_src/mbp/html/ops && rm k.k
# set permissions and restart apache
sudo chmod 777 -R /bp_src/mbp
sudo service apache2 restart

