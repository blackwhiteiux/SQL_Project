CREATE SCHEMA guitar_store;

CREATE TABLE guitar_store.users (
    user_id SERIAL PRIMARY KEY,
    user_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    registered_at DATE DEFAULT CURRENT_DATE
);

CREATE TABLE guitar_store.orders(
    order_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL REFERENCES guitar_store.users(user_id),
    order_date DATE DEFAULT CURRENT_DATE
);

CREATE TABLE guitar_store.categories(
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE guitar_store.products(
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(50) NOT NULL UNIQUE,
    category_id INT NOT NULL REFERENCES guitar_store.categories(category_id),
    price NUMERIC(10,2) NOT NULL CHECK (price > 0)
);

CREATE TABLE guitar_store.order_items(
    order_id INT NOT NULL REFERENCES guitar_store.orders(order_id),
    product_id INT NOT NULL REFERENCES guitar_store.products(product_id),
    quantity INT NOT NULL CHECK (quantity > 0),
    PRIMARY KEY (order_id, product_id)
);