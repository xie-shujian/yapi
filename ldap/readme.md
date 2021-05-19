# mongodb init
## login mongodb
mongo -u root -p pass
## create yapi db
use yapidb
## create yapi use
db.createUser({"user": "yapiuser","pwd": "yapipassword", "roles": [{"role": "readWrite", "db": "yapidb"}]})
# yapi install
npm run install-server