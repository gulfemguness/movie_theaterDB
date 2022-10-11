-- CUSTOMER --

DROP TABLE IF EXISTS customer CASCADE;
CREATE TABLE customer(
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(200)
);

INSERT INTO customer(
    first_name,
    last_name,
    email
) VALUES (
    'Angelica',
    'Pickles',
    'ang@pickles.com'
);

INSERT INTO customer(
    first_name,
    last_name,
    email
) VALUES (
    'Donald',
    'Duck',
    'donald@duck.com'
);

INSERT INTO customer(
    first_name,
    last_name,
    email
) VALUES (
    'Stewie',
    'Griffin',
    'stv@griffin.com'
);

INSERT INTO customer(
    first_name,
    last_name,
    email
) VALUES (
    'Betty',
    'Boop',
    'betty@boop.com'
);


SELECT * 
FROM customer;


-- MOVIE --

DROP TABLE IF EXISTS movie CASCADE;
CREATE TABLE movie(
    movie_id SERIAL PRIMARY KEY,
    title VARCHAR(200),
    country VARCHAR(200),
    original_language VARCHAR(200)
);

INSERT INTO movie(
    title,
    country,
    original_language
) VALUES (
    'Silent Wedding (Nunta Muta)',
    'Romania, France, Luxembourg,',
    'Romanian'
);

INSERT INTO movie(
    title,
    country,
    original_language
) VALUES (
    'Cinema Paradiso (Nuovo Cinema Paradiso)',
    'Italy, France',
    'Italian'
);

INSERT INTO movie(
    title,
    country,
    original_language
) VALUES (
    'Time of the Gypsies (Dom za vesanje)',
    'Yugoslavia, Italy, United Kingdom',
    'Romani, Serbo-Croatian, Italian'
);

SELECT * 
FROM movie


-- TICKET -- 

DROP TABLE IF EXISTS ticket CASCADE;
CREATE TABLE ticket(
    ticket_id SERIAL PRIMARY KEY,
    movie_id INTEGER,
    ticket_price NUMERIC(4,2),
    ticket_quantity INTEGER,
    ticket_total NUMERIC(4,2),
    FOREIGN KEY(movie_id) REFERENCES movie(movie_id)
);

INSERT INTO ticket(
    movie_id,
    ticket_price,
    ticket_quantity,
    ticket_total
) VALUES (
    1,
    12.50,
    2,
    25.00
);

INSERT INTO ticket(
    movie_id,
    ticket_price,
    ticket_quantity,
    ticket_total
) VALUES (
    2,
    12.50,
    3,
    37.50
);

INSERT INTO ticket(
    movie_id,
    ticket_price,
    ticket_quantity,
    ticket_total
) VALUES (
    3,
    12.50,
    1,
    12.50
);

INSERT INTO ticket(
    movie_id,
    ticket_price,
    ticket_quantity,
    ticket_total
) VALUES (
    1,
    12.50,
    2,
    25.00
);

SELECT *
FROM ticket;


-- CONCESSION --

DROP TABLE IF EXISTS concession CASCADE;
CREATE TABLE concession(
    concession_id SERIAL PRIMARY KEY,
    menu_item VARCHAR(50),
    item_price NUMERIC(4,2),
    item_quantity INTEGER,
    item_total NUMERIC(4,2)
);

INSERT INTO concession(
    menu_item,
    item_price,
    item_quantity,
    item_total
) VALUES (
    'Popcorn',
    6.99,
    2,
    13.98
);

INSERT INTO concession(
    menu_item,
    item_price,
    item_quantity,
    item_total
) VALUES (
    'Pretzel',
    11.00,
    3,
    33.00
);

INSERT INTO concession(
    menu_item,
    item_price,
    item_quantity,
    item_total
) VALUES (
    'Water',
    2.50,
    1,
    2.50
);

SELECT * 
FROM concession


-- PURCHASE --

DROP TABLE IF EXISTS purchase CASCADE;
CREATE TABLE purchase(
    purchase_id SERIAL PRIMARY KEY,
    customer_id INTEGER,
    ticket_id INTEGER,
    concession_id INTEGER,
    FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY(ticket_id) REFERENCES ticket(ticket_id),
    FOREIGN KEY(concession_id) REFERENCES concession(concession_id),
    total_purchases NUMERIC(5,2)
);

INSERT INTO purchase(
    customer_id,
    ticket_id,
    concession_id,
    total_purchases 
) VALUES (
    1,
    1,
    1,
    38.98
);

INSERT INTO purchase(
    customer_id,
    ticket_id,
    concession_id,
    total_purchases 
) VALUES (
    2,
    2,
    2,
    70.50
);

INSERT INTO purchase(
    customer_id,
    ticket_id,
    concession_id,
    total_purchases 
) VALUES (
    3,
    3,
    1,
    15.00
);

INSERT INTO purchase(
    customer_id,
    ticket_id,
    concession_id,
    total_purchases 
) VALUES (
    4,
    4,
    NULL,
    25.00
);

SELECT *
FROM purchase
