#!/bin/bash
 
result=`mysqladmin -uroot -pxx ping`
expected='mysqld is alive'
 
if [[ "$result" != "$expected" ]]
then
echo "It's dead - restart mysql"
 
# email subject
SUBJECT="[MYSQL ERROR] - Attempting to restart service"
 
# Email To ?
EMAIL="xxx@qq.com"
 
# Email text/message
EMAILMESSAGE="/tmp/emailmessage.txt"
echo "$result was received"> $EMAILMESSAGE
echo "when we were expected $expected" >>$EMAILMESSAGE
# send an email using /bin/mail
mail -s "$SUBJECT" "$EMAIL" < $EMAILMESSAGE
 
sudo service mysql restart
fi
