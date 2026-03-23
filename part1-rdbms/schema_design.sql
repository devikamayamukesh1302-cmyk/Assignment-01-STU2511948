CREATE TABLE customers (
    customer_id VARCHAR(10) PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    customer_email VARCHAR(100) NOT NULL,
    customer_city VARCHAR(50) NOT NULL
);

CREATE TABLE products (
    product_id VARCHAR(10) PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    unit_price DECIMAL(10,2) NOT NULL
);

CREATE TABLE sales_reps (
    sales_rep_id VARCHAR(10) PRIMARY KEY,
    sales_rep_name VARCHAR(100) NOT NULL,
    sales_rep_email VARCHAR(100) NOT NULL,
    office_address VARCHAR(200)
);

CREATE TABLE orders (
    order_id VARCHAR(10) PRIMARY KEY,
    customer_id VARCHAR(10),
    sales_rep_id VARCHAR(10),
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (sales_rep_id) REFERENCES sales_reps(sales_rep_id)
);

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id VARCHAR(10),
    product_id VARCHAR(10),
    quantity INT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO customers VALUES
('C101','Rahul Mehta','rahul@email.com','Mumbai'),
('C102','Priya Singh','priya@email.com','Delhi'),
('C103','Ankit Jain','ankit@email.com','Bangalore'),
('C104','Sneha Shah','sneha@email.com','Mumbai'),
('C105','Ravi Kumar','ravi@email.com','Chennai');

INSERT INTO products VALUES
('P101','Laptop','Electronics',55000),
('P102','Wireless Mouse','Electronics',850),
('P103','USB Keyboard','Electronics',950),
('P104','Office Chair','Furniture',6500),
('P105','Notebook','Stationery',120);

INSERT INTO sales_reps VALUES
('SR01','Amit Sharma','amit@company.com','Mumbai HQ'),
('SR02','Neha Verma','neha@company.com','Delhi Office'),
('SR03','Karan Patel','karan@company.com','Bangalore Office'),
('SR04','Riya Kapoor','riya@company.com','Mumbai HQ'),
('SR05','Vikas Singh','vikas@company.com','Delhi Office');

INSERT INTO orders VALUES
('ORD1','C101','SR01','2024-01-10'),
('ORD2','C102','SR02','2024-01-11'),
('ORD3','C103','SR03','2024-01-12'),
('ORD4','C104','SR01','2024-01-13'),
('ORD5','C105','SR02','2024-01-14');

INSERT INTO order_items VALUES
(1,'ORD1','P101',1),
(2,'ORD2','P102',2),
(3,'ORD3','P103',3),
(4,'ORD4','P104',1),
(5,'ORD5','P105',5);