CREATE TABLE customer(
    customer_id SERIAL PRIMARY KEY,
    customer_name VARCHAR (50),
    customer_address VARCHAR(200),
    customer_phone BIGINT,
    customer_email VARCHAR(50) 
)

CREATE TABLE sale (
    sale_id SERIAL PRIMARY KEY,
    salesperson_id INTEGER,
    FOREIGN KEY (salesperson_id) references salesperson (salesperson_id)
)

CREATE TABLE salesperson(
    salesperson_id SERIAL PRIMARY KEY,
    store INTEGER,
    name VARCHAR (60),
    email VARCHAR(60),
    phone BIGINT,
    status VARCHAR(5)
)

CREATE TABLE car(
    car_id SERIAL PRIMARY KEY,
    customer_id INTEGER,
    year INTEGER,
    make VARCHAR (50),
    model VARCHAR (50),
    price NUMERIC (10,2),
    color VARCHAR (50),
    FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
)

CREATE TABLE serviced (
    serviced_id SERIAL PRIMARY KEY,
    mechanic_id INTEGER,
    cost NUMERIC(8,2),
    FOREIGN KEY (mechanic_id) REFERENCES mechanic (mechanic_id)
)


CREATE TABLE mechanic (
    mechanic_id SERIAL PRIMARY KEY,
    store INTEGER,
    name INTEGER,
    phone BIGINT,
    email VARCHAR (60),
    status VARCHAR (5)
)


CREATE TABLE invoice(
    invoice_id SERIAL PRIMARY KEY, 
    car_id INTEGER,
    sale_id INTEGER NULL,
    serviced_id INTEGER NULL,
    date TIMESTAMP,
    price NUMERIC (10,2),
    FOREIGN KEY(car_id) REFERENCES car(car_id),
    FOREIGN KEY(sale_id) REFERENCES sale(sale_id),
    FOREIGN KEY(serviced_id) REFERENCES serviced (serviced_id)
)



INSERT INTO customer (customer_id, customer_name, customer_address, customer_phone, customer_email)
Values('830293','Brenda Willis','123 4th St.','8057579878','BrendaWillis@aol.com');

INSERT INTO sale (sale_id,salesperson_id)
VALUES('920371', '382048')

INSERT INTO salesperson (salesperson_id, store, name, email, phone, status)
VALUES('382048',1,'Jim Talky','Jim@auto.com',8055887620,'yes')

INSERT INTO car (car_id, customer_id, year, make, model, price, color)
VALUES(836643, 830293, '2023', 'BMW','iX','100000','red')

INSERT INTO invoice (invoice_id, vin_number, car_id, sale_id, serviced_id, date, price)
VALUES (30130192,'83029M49G03PP3', '836643', '920371', '382937', '20231217', 100000)


INSERT INTO serviced (serviced_id, mechanic_id, cost)
VALUES ('382937', '1037293','100')

INSERT INTO mechanic (mechanic_id, store, name, phone, email, status)
VALUES ('1037293', '1', 'PaulRudd', '9908345623', 'PaulRudd@auto.com', 'yes')



ALTER TABLE invoice
ADD vin_number VARCHAR(60)

ALTER TABLE serviced 
ADD vin_number VARCHAR(60)

ALTER table mechanic
ALTER COLUMN Name TYPE varchar (60)


