#! /bin/bash
DB_USER_NAME=$DB_USER
DB_USER_PASSWORD=$DB_PASSWORD
mysqldump -u $DB_USER_NAME -p$DB_USER_PASSWORD --databases ShopDB --result-file=backup.sql
mysqldump -u $DB_USER_NAME -p$DB_USER_PASSWORD ShopDB --no-create-db --result-file=backup-no-create-db.sql
mysql -u $DB_USER_NAME -p$DB_USER_PASSWORD  ShopDBReserve < backup-no-create-db.sql
mysql -u $DB_USER_NAME -p$DB_USER_PASSWORD  ShopDBDevelopment < backup-no-create-db.sql

