#!/usr/bin/env bash
sudo ln -s  /bp_src/mbp/apache__boinc_server_mbp.conf /etc/apache2/sites-enabled/apache__boinc_server_mbp.conf
sudo chmod 777 -R /bp_src/mbp
sudo service apache2 restart

