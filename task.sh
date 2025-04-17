#! /bin/bash
if [ -n "$DB_USER" ] && [ -n "$DB_PASSWORD" ]; then
  DB_USER_NAME=$DB_USER
  DB_USER_PASSWORD=$DB_PASSWORD
  mysqldump -u $DB_USER_NAME -p$DB_USER_PASSWORD --databases ShopDB --result-file=backup.sql
  mysqldump -u "$DB_USER" -p"$DB_PASSWORD" ShopDB --no-create-db --no-create-info --result-file=backup-no-create-db-no-create-info.sql
  mysql -u $DB_USER_NAME -p$DB_USER_PASSWORD  ShopDBReserve < backup-no-create-db.sql
  mysql -u $DB_USER_NAME -p$DB_USER_PASSWORD  ShopDBDevelopment < backup-no-create-db.sql
else
  echo 'DB_USER and DB_PASSWORD must be set'
fi
