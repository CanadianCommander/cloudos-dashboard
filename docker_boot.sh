#! /bin/bash

DATABASE_NAME=cloudos_dashboard
DATABASE_INSTALL_PATH=/cloudos/var/cloudos_dashboard/pgsql_data

if [[ ${BUILD_MODE} == "dev" ]]; then
    DATABASE_NAME=cloudos_dashboard_dev
fi

# init & start postgres
if [[ ! -f /cloudos/var/cloudos_dashboard/pgsql_data/PG_VERSION ]]; then
  mkdir -p /cloudos/var/cloudos_dashboard/pgsql_data && chown postgres:postgres /cloudos/var/cloudos_dashboard/pgsql_data

  su postgres -c "/usr/pgsql-11/bin/pg_ctl initdb -D ${DATABASE_INSTALL_PATH}"
  su postgres -c "/usr/pgsql-11/bin/pg_ctl -D ${DATABASE_INSTALL_PATH} -l /var/log/pgsql/pgsql-11.log start"
  su postgres -c "psql -c \"CREATE USER root;\""
  su postgres -c "psql -c \"CREATE DATABASE cloudos_dashboard_dev OWNER root;\""
else
  su postgres -c "/usr/pgsql-11/bin/pg_ctl -D ${DATABASE_INSTALL_PATH} -l /var/log/pgsql/pgsql-11.log start"
fi

# start apache
httpd

if [[ ${BUILD_MODE} == "dev" ]]; then
    # block forever
    tail -f /dev/null
else
    echo "Not setup yet"
    exit 1
fi
