#!/bin/sh
#update config file with env var
conf_file=/yapi/config.json
if [ $YAPI_SERVER_PORT ]; then
    sed -i "s#YAPI_SERVER_PORT#$YAPI_SERVER_PORT#" $conf_file
fi
if [ $YAPI_ADMINACCOUNT ]; then
    sed -i "s#YAPI_ADMINACCOUNT#$YAPI_ADMINACCOUNT#" $conf_file
fi
if [ $YAPI_TIMEOUT ]; then
    sed -i "s#YAPI_TIMEOUT#$YAPI_TIMEOUT#" $conf_file
fi
#mongodb
if [ $YAPI_DB_SERVERNAME ]; then
    sed -i "s#YAPI_DB_SERVERNAME#$YAPI_DB_SERVERNAME#" $conf_file
fi
if [ $YAPI_DB_DATABASE ]; then
    sed -i "s#YAPI_DB_DATABASE#$YAPI_DB_DATABASE#" $conf_file
fi
if [ $YAPI_DB_PORT ]; then
    sed -i "s#YAPI_DB_PORT#$YAPI_DB_PORT#" $conf_file
fi
if [ $YAPI_DB_USER ]; then
    sed -i "s#YAPI_DB_USER#$YAPI_DB_USER#" $conf_file
fi
if [ $YAPI_DB_PASS ]; then
    sed -i "s#YAPI_DB_PASS#$YAPI_DB_PASS#" $conf_file
fi
if [ $YAPI_DB_AUTHSOURCE ]; then
    sed -i "s#YAPI_DB_AUTHSOURCE#$YAPI_DB_AUTHSOURCE#" $conf_file
fi
#mail
if [ $YAPI_MAIL_ENABLE ]; then
    sed -i "s#YAPI_MAIL_ENABLE#$YAPI_MAIL_ENABLE#" $conf_file
fi
if [ $YAPI_MAIL_HOST ]; then
    sed -i "s#YAPI_MAIL_HOST#$YAPI_MAIL_HOST#" $conf_file
fi
if [ $YAPI_MAIL_PORT ]; then
    sed -i "s#YAPI_MAIL_PORT#$YAPI_MAIL_PORT#" $conf_file
fi
if [ $YAPI_MAIL_FROM ]; then
    sed -i "s#YAPI_MAIL_FROM#$YAPI_MAIL_FROM#" $conf_file
fi
if [ $YAPI_MAIL_USER ]; then
    sed -i "s#YAPI_MAIL_USER#$YAPI_MAIL_USER#" $conf_file
fi
if [ $YAPI_MAIL_PASS ]; then
    sed -i "s#YAPI_MAIL_PASS#$YAPI_MAIL_PASS#" $conf_file
fi
#LDAP
if [ $YAPI_LDAP_ENABLE ]; then
	sed -i "s#YAPI_LDAP_ENABLE#$YAPI_LDAP_ENABLE#" $conf_file
fi
if [ $YAPI_LDAP_SERVER ]; then
	sed -i "s#YAPI_LDAP_SERVER#$YAPI_LDAP_SERVER#" $conf_file
fi
if [ $YAPI_LDAP_BASEDN ]; then
	sed -i "s#YAPI_LDAP_BASEDN#$YAPI_LDAP_BASEDN#" $conf_file
fi
if [ $YAPI_LDAP_BINDPASSWORD ]; then
	sed -i "s#YAPI_LDAP_BINDPASSWORD#$YAPI_LDAP_BINDPASSWORD#" $conf_file
fi
if [ $YAPI_LDAP_SEARCHDN ]; then
	sed -i "s#YAPI_LDAP_SEARCHDN#$YAPI_LDAP_SEARCHDN#" $conf_file
fi
if [ $YAPI_LDAP_SEARCHSTANDARD ]; then
	sed -i "s#YAPI_LDAP_SEARCHSTANDARD#$YAPI_LDAP_SEARCHSTANDARD#" $conf_file
fi
if [ $YAPI_LDAP_EMAILPOSTFIX ]; then
	sed -i "s#YAPI_LDAP_EMAILPOSTFIX#$YAPI_LDAP_EMAILPOSTFIX#" $conf_file
fi
if [ $YAPI_LDAP_EMAILKEY ]; then
	sed -i "s#YAPI_LDAP_EMAILKEY#$YAPI_LDAP_EMAILKEY#" $conf_file
fi
if [ $YAPI_LDAP_USERNAMEKEY ]; then
	sed -i "s#YAPI_LDAP_USERNAMEKEY#$YAPI_LDAP_USERNAMEKEY#" $conf_file
fi
cat $conf_file
#start yapi
node server/app.js