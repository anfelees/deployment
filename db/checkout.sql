CREATE TABLE order_data (
	id serial primary key,
	client_id integer not null,
	order_date timestamp not null,
	direction varchar(50) not null
);

CREATE TABLE product (
	id serial primary key,
	product_id integer not null,
	order_id integer,
	quantity integer not null,
	cost decimal not null,
	FOREIGN KEY (order_id) REFERENCES order_data (id)
);