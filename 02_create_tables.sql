USE ecommerce_sql_project;

-- =========================================
-- 1. CUSTOMERS
-- =========================================

CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    city VARCHAR(100),
    state VARCHAR(100),
    signup_date DATE
);


-- =========================================
-- 2. CATEGORIES
-- =========================================

CREATE TABLE categories (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(100) NOT NULL UNIQUE
);


-- =========================================
-- 3. PRODUCTS
-- =========================================

CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(150) NOT NULL,
    category_id INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    stock_quantity INT NOT NULL,
    created_at DATE,

    FOREIGN KEY (category_id)
        REFERENCES categories(category_id)
);


-- =========================================
-- 4. ORDERS
-- =========================================

CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    order_status VARCHAR(30) NOT NULL,
    total_amount DECIMAL(12,2),
    modified_date DATETIME NOT NULL,

    FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
);


-- =========================================
-- 5. ORDER_ITEMS
-- =========================================

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,

    FOREIGN KEY (order_id)
        REFERENCES orders(order_id),

    FOREIGN KEY (product_id)
        REFERENCES products(product_id)
);