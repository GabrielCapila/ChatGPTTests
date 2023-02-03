-- Create the customers table
CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    date_created DATE NOT NULL
);

-- Create the orders table
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Insert a large amount of data into the customers table
DO $$
DECLARE
   counter INT := 1;
BEGIN
   WHILE counter <= 10000
   LOOP
      INSERT INTO customers (first_name, last_name, email, date_created)
      VALUES (CONCAT('FirstName', counter), CONCAT('LastName', counter), CONCAT('email', counter, '@email.com'), '2022-01-01');

      counter := counter + 1;
   END LOOP;
END $$;

-- Insert a large amount of data into the orders table
DO $$
DECLARE
   order_counter INT := 1;
BEGIN
   WHILE order_counter <= 10000
   LOOP
      INSERT INTO orders (customer_id, order_date)
      VALUES (order_counter, '2022-01-10');

      order_counter := order_counter + 1;
   END LOOP;
END $$;

-- Verify that the data has been inserted
SELECT COUNT(*) FROM customers;
SELECT COUNT(*) FROM orders;