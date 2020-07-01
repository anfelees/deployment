FROM postgres
COPY ./init-user-db.sh /docker-entrypoint-initdb.d/init-user-db.sh
COPY ./checkout.sql /checkout.sql
COPY ./logistic.sql /logistic.sql
#ENV POSTGRES_PASSWORD mysecretpassword