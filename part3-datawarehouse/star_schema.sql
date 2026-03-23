-- =========================
-- DIMENSION TABLES
-- =========================

CREATE TABLE dim_date (
    date_id INT PRIMARY KEY,
    full_date DATE NOT NULL,
    day INT,
    month INT,
    year INT
);

CREATE TABLE dim_store (
    store_id INT PRIMARY KEY,
    store_name VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50)
);

CREATE TABLE dim_product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50)
);

-- =========================
-- FACT TABLE
-- =========================

CREATE TABLE fact_sales (
    sales_id INT PRIMARY KEY,
    date_id INT,
    store_id INT,
    product_id INT,
    quantity INT NOT NULL,
    total_amount DECIMAL(10,2) NOT NULL,
    
    FOREIGN KEY (date_id) REFERENCES dim_date(date_id),
    FOREIGN KEY (store_id) REFERENCES dim_store(store_id),
    FOREIGN KEY (product_id) REFERENCES dim_product(product_id)
);

-- =========================
-- CLEANED DIMENSION DATA
-- =========================

-- Dates (standardized format YYYY-MM-DD)
INSERT INTO dim_date VALUES
(1, '2024-01-01', 1, 1, 2024),
(2, '2024-01-02', 2, 1, 2024),
(3, '2024-01-03', 3, 1, 2024),
(4, '2024-01-04', 4, 1, 2024),
(5, '2024-01-05', 5, 1, 2024);

-- Stores (cleaned names & locations)
INSERT INTO dim_store VALUES
(101, 'Central Store', 'Mumbai', 'Maharashtra'),
(102, 'City Mall Outlet', 'Delhi', 'Delhi'),
(103, 'Tech Plaza', 'Bangalore', 'Karnataka');

-- Products (standardized category casing)
INSERT INTO dim_product VALUES
(201, 'Laptop', 'Electronics'),
(202, 'T-Shirt', 'Clothing'),
(203, 'Rice Bag', 'Groceries'),
(204, 'Headphones', 'Electronics'),
(205, 'Jeans', 'Clothing');

-- =========================
-- FACT TABLE DATA (CLEANED)
-- =========================

INSERT INTO fact_sales VALUES
(1, 1, 101, 201, 1, 55000),
(2, 1, 102, 202, 2, 3000),
(3, 2, 103, 203, 5, 2500),
(4, 2, 101, 204, 2, 4000),
(5, 3, 102, 205, 1, 2000),
(6, 3, 103, 201, 1, 56000),
(7, 4, 101, 202, 3, 4500),
(8, 4, 102, 203, 4, 2000),
(9, 5, 103, 204, 2, 4200),
(10, 5, 101, 205, 2, 4000);
