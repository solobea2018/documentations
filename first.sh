#!/bin/bash

echo "Hello, this is my bash script!"

Logged in user.
whoami

#SSH
  sudo systemctl status ssh
  sudo nano /etc/ssh/sshd_config
  grep -r Port /etc/ssh/sshd_config.d/
  sudo nano /etc/ssh/sshd_config

#Mysql
  sudo apt install mysql-server -y
  sudo mysql_secure_installation
  sudo mysql
  sudo nano /etc/mysql/mysql.conf.d/mysqld.cnf
  sudo systemctl restart mysql
  sudo systemctl status mysql
  sudo nano /etc/roundcube/config.inc.php
  sudo systemctl status postfix

#Statistics
  sudo netstat -tulpn | grep master
  sudo ss -tulpn | grep :25
  sudo nano /etc/postfix/main.cf
  sudo nano /etc/postfix/master.cf

#disk/File management
  pwd
  ls
  ls -l
  ls -lf
  ls -lh
  df 0h
  df -h
  ls -d
  ls -v
  ls -f
  ls -fl
  cd
  mkdir "dirname"
  mkdir -p /mnt/d
  cp
  cp -r dist/assets/* src/assets/
  mv
  sudo mv solobes.conf  solobea.conf #rename
  rm -f ./path/file
  rm -d ./path/file
  rm -rf
  fdisk -l
  df -h
  lsblk
  mount /dev/sdb1 /mnt/usb
  cd /mnt/usb/ || exit
  umount /mnt/usb/
  lsof +f -- /mnt/usb


#Uncomplicated firewall
  sudo ufw reload
  ufw status
  sudo fwupdmgr get-upgrades
  sudo fwupdmgr
  sudo fwupdmgr --help
  sudo ufw allow 25/tcp
  sudo ufw allow 587/tcp
  sudo ufw allow 465/tcp
  ufw allow 25

#Network
  ifconfig
  ip link
  ip add sho
  networkctl status

#interface enslave mode
  sudo apt install ifenslave
  sudo nano /etc/netplan/50-cloud-init.yaml
  cp /etc/netplan/50-cloud-init.yaml  ~/
  nano /etc/netplan/50-cloud-init.yaml
  networkctl status
  netplan status
  ping -c 3 google.com
  sudo networkctl up enp1s0
  ip link set wlp0s20f3 up
  netplan status  --all
  sudo netplan ip leases enp1s0
  sudo netplan ip leases wlp0s20f3
  sudo networkctl forcerenew enp1s0
  sudo networkctl forcerenew wlp0s20f3
  ip addr show enp1s0
  ip route
  ping 8.8.8.8

#Installing Java and deps
sudo apt update
  sudo apt install default-jdk -y
  java -version
  javaw
  java jar

To install node
  curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
  sudo apt install nodejs -y

#FTP
  sudo apt install vsftpd -y
  sudo nano /etc/vsftpd.conf
  sudo systemctl restart vsftpd.service
  sudo adduser ftpuser
  sudo systemctl enable vsftpd
  sudo nano /etc/vsftpd.conf
  sudo systemctl status vsftpd
  sudo cp /usr/share/doc/vsftpd/examples/vsftpd.conf /etc/vsftpd.conf

#package mgmt
  apt list |grep mail
  sudo dpkg-reconfigure  roundcube-core
#Remove the installed package/ Reinstall
  sudo apt purge vsftpd -y
  sudo apt install vsftpd -y
  sudo uninstall gdrive
  sudo rm $(which gdrive)
  command -v gdrive || echo "gdrive is uninstalled"

Apache Server
  sudo netstat -tlnp | grep 443
  sudo ss -tlnp | grep 443
  sudo apache2ctl -S
  #installs PHP and enables Apache to run PHP files.
  sudo apt install php libapache2-mod-php

  cd var/www/html || exit
  nano index.html
  nano default-ssl.conf
  nano 000-default.conf
#Making a coppy of the origin conf.
  sudo cp 000-default.conf  solobes.conf
#Enable site
  sudo a2ensite solobea

  sudo systemctl reload apache2

#Generating Certificate for ssl
  sudo apt install certbot python3-certbot-apache -y
  sudo apt update
  ping yourdomain.com
  sudo certbot --apache -d yourdomain.com -d www.yourdomain.com
## stored  /etc/letsencrypt/live/yourdomain.com/
#but automatically renewed after 90 days
  sudo certbot renew
  sudo a2enmod ssl

  sudo a2ensite solobea
  sudo systemctl reload apache2

# device
sudo dmidecode --type memory | grep -i type


#archive
  sudo apt install zip
  sudo apt install unzip
  unzip dist.zip
  tar -xf dist.zip
  tar -xf project-2025-07-13.tar
  zip -r dist2.zip dist/
  zip -r public_html.zip public_html \
    -x "public_html/vendor/*" "public_html/node_modules/*" "public_html/cache/*"


#To transfer file to server with curl
  curl -T dist2.zip ftp://amucta.ac.tz/ -u admin@amucta.ac.tz:IKUngumhula@20

#php info
  php -i
  php -i |grep sendmail_path
#email troubleshooting
  sudo postqueue -p
  sudo postcat -q 0A00B700367
  telnet gmail-smtp-in.l.google.com 25
  sudo tail -f /var/log/mail.log
  sudo tail -n 50 /var/log/mail.log
  sudo journalctl -u postfix -n 50 --no-pager

  echo -e "Subject: Test\n\nHello" | sendmail -v mabula@amucta.ac.tz
  echo "Hello" | mail -s "Test" mabula@amucta.ac.tz
  echo -e "Subject: Test\nHello" | mail -s "Test" mabula@amucta.ac.tz
  sudo postcat -q 0A00B700367
  sudo journalctl -u postfix -n 50 --no-pager
  sudo tail -n 50 /var/log/mail.log


  sudo journalctl -u postfix -f

#roundcube mail
  sudo apt install roundcube roundcube-core roundcube-mysql -y
  sudo chown -R www-data:www-data /var/lib/roundcube /var/log/roundcube
  sudo nano /etc/roundcube/config.inc.php
  sudo systemctl reload apache2.service
  sudo a2enconf roundcube
  sudo chown -R www-data:www-data /usr/share/roundcube
  sudo chmod -R 755 /usr/share/roundcube
  sudo ln -s /usr/share/roundcube/ /var/www/html/roundcube

  sudo cat /etc/passwd | grep mabula
  sudo mysql -u roundcubeuser -p

  sudo passwd mabula
  telnet localhost 25
  sudo systemctl status postfix
  echo "tetea.store" | sudo tee /etc/mailname
  sudo nano /etc/roundcube/config.inc.php
  sudo systemctl restart postfix
  sudo systemctl restart dovecot
  sudo systemctl restart roundcube
  sudo systemctl restart apache2

  sudo cp /etc/apache2/sites-available/solobea.conf /etc/apache2/sites-available/mail.conf
  sudo cp /etc/apache2/sites-available/solobea-le-ssl.conf  /etc/apache2/sites-ailable/mail-le-.conf
  sudo nano mail-le-ssl.conf
  sudo nano mail.conf
  nano roundcube.conf

  sudo a2ensite mail
  sudo nano sites-available/mail-le-ssl.conf
  sudo a2ensite mail-le-ssl.conf
  sudo systemctl  reload apache2.service

  sudo apt install php-intl php-cli php-xml php-mbstring -y
  sudo apt update && sudo apt upgrade -y
  sudo mysql
  nano /etc/dovecot/conf.d/10-mail.conf
  sudo nano /etc/postfix/main.cf
  sudo systemctl restart postfix
  sudo systemctl enable postfix
  sudo nano /etc/dovecot/dovecot.conf
  sudo nano /etc/dovecot/conf.d/10-mail.conf
  mkdir backup
  sudo cp /etc/dovecot/conf.d/10-mail.conf ~/backup/10-mail.conf
  sudo nano /etc/dovecot/conf.d/10-mail.conf
  sudo systemctl restart dovecot
  sudo systemctl enable dovecot
  sudo nano /etc/dovecot/conf.d/10-mail.conf
  sudo nano /etc/dovecot/conf.d/10-auth.conf
  sudo nano /etc/roundcube/config.inc.php

  sudo ss tulnp | grep -E '25|143|587|993'

  sudo chown -R www-data:www-data  /var/www/data
  sudo find /var/www/data -type d -exec chown 755 {} \;
  sudo find /var/www/data -type f -exec chown 644 {} \;

  sudo a2enmod rewrite

#Running a bash command
  sudo bash -c "mysqlump dashboard>db.sql"
  sudo bash -c "mysqldump dashboard>db.sql"

#User management  (with home/)
  sudo adduser amucta_user
  sudo usermod -d /var/www/data amucta_user
  sudo useradd -m -d /var/www/data -s /bin/bash amucta_user
  sudo chown -R amucta_user:amucta_user /var/www/data
  sudo chmod 775 /var/www/data/
  sudo chown -R www-data:www-data /var/www/data/images
  sudo chmod -R 755 /var/www/data/images
  sudo chown -R www-data:www-data /var/www/data
  sudo chmod -R 775 /var/www/data
  cat /etc/passwd
  cat -d: -f1 /etc/passwd
  cut -d: -f1 /etc/passwd
  who
  w
  users
  getent passwd {1000..60000}
  getent passwd {1000..60000} | grep Amucta
  su - amucta_user
  sudo chmod 777  -R .
  ls -ld .

#File Permission
  chmod +x ./mvnw
  ls -l

  fuser

