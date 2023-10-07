-- Create the customer table
CREATE TABLE customer (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(255)
);

-- Create the orders table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

-- Insert sample data into the customer table
INSERT INTO customer (customer_id, customer_name)
VALUES
    (1, 'Customer A'),
    (2, 'Customer B'),
    (3, 'Customer C');

-- Insert sample data into the orders table
INSERT INTO orders (order_id, customer_id, product_id, quantity)
VALUES
    (101, 1, 101, 5),
    (102, 1, 102, 2),
    (103, 2, 103, 3),
    (104, 3, 104, 4);

SELECT c.customer_id, c.customer_name, o.order_id, o.product_id, o.quantity FROM customer c JOIN orders o ON c.customer_id = o.customer_id;