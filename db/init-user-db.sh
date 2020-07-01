#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE DATABASE checkout;
    CREATE DATABASE logistic;
EOSQL

psql --username "$POSTGRES_USER" -d checkout -a -f ../checkout.sql
psql --username "$POSTGRES_USER" -d logistic -a -f ../logistic.sql