-- Tạo cơ sở dữ liệu
CREATE DATABASE ComputerStore
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

-- Sử dụng cơ sở dữ liệu mới tạo
USE ComputerStore;

-- Tạo bảng Supplier
CREATE TABLE Supplier (
    supplierID VARCHAR(15) PRIMARY KEY,
    name VARCHAR(100)
);

-- Tạo bảng Employee
CREATE TABLE Employee (
    employeeID VARCHAR(15) PRIMARY KEY,
    firstname VARCHAR(50),
    lastname VARCHAR(50),
    DOB VARCHAR(10),
    salary INT
);

-- Tạo bảng Customer
CREATE TABLE Customer (
    customerID VARCHAR(15) PRIMARY KEY,
    firstname VARCHAR(50),
    lastname VARCHAR(50),
    address VARCHAR(100),
    phone VARCHAR(20),
    cart VARCHAR(500)
);

-- Tạo bảng Account
CREATE TABLE Account (
    customerID VARCHAR(15) PRIMARY KEY,
    username VARCHAR(50),
    password VARCHAR(50)
);

-- Tạo bảng Product
CREATE TABLE Product (
    productID VARCHAR(15) PRIMARY KEY,
    type VARCHAR(50),
    name VARCHAR(50),
    quantity INT,
    warrantyTime INT,
    price INT
);

-- Tạo bảng ProductDetail
CREATE TABLE ProductDetail (
    productID VARCHAR(15) PRIMARY KEY,
    supplierID VARCHAR(15),
    MFG VARCHAR(10),
    RAM VARCHAR(50),
    ROM VARCHAR(50),
    CPU VARCHAR(100),
    VGA VARCHAR(100),
    keyboard VARCHAR(50),
    screen VARCHAR(50),
    OS VARCHAR(50),
    size VARCHAR(50),
    pin VARCHAR(50),
    capacity VARCHAR(50),
    bus VARCHAR(50),
    casLatency VARCHAR(50),
    layout VARCHAR(50),
    LED VARCHAR(50),
    keycap VARCHAR(50),
    switch VARCHAR(50),
    hotswap VARCHAR(3),
    writeSpeed VARCHAR(50),
    readSpeed VARCHAR(50),
    scan VARCHAR(50),
    panel VARCHAR(50),
    resolution VARCHAR(50),
    cores INT,
    threads INT,
    series VARCHAR(50),
    clock VARCHAR(50),
    FOREIGN KEY (productID) REFERENCES Product(productID),
    FOREIGN KEY (supplierID) REFERENCES Supplier(supplierID)
);

-- Tạo bảng Invoice
CREATE TABLE Invoice (
    invoiceID VARCHAR(15) PRIMARY KEY,
    employeeID VARCHAR(15),
    customerID VARCHAR(15),
    date VARCHAR(10),
    totalCost INT,
    FOREIGN KEY (employeeID) REFERENCES Employee(employeeID),
    FOREIGN KEY (customerID) REFERENCES Customer(customerID)
);

-- Tạo bảng InvoiceDetail
CREATE TABLE InvoiceDetail (
    invoiceID VARCHAR(15),
    productID VARCHAR(15),
    warrantyID VARCHAR(15),
    quantity INT,
    price INT,
    cost INT,
    PRIMARY KEY (invoiceID, productID),
    FOREIGN KEY (invoiceID) REFERENCES Invoice(invoiceID),
    FOREIGN KEY (productID) REFERENCES Product(productID)
);

-- Tạo bảng Warranty
CREATE TABLE Warranty (
    warrantyID VARCHAR(15) PRIMARY KEY,
    productID VARCHAR(15),
    invoiceID VARCHAR(15),
    customerID VARCHAR(15),
    purchaseDate VARCHAR(10),
    EXP VARCHAR(10),
    warrantyTime INT,
    FOREIGN KEY (productID) REFERENCES Product(productID),
    FOREIGN KEY (invoiceID) REFERENCES Invoice(invoiceID),
    FOREIGN KEY (customerID) REFERENCES Customer(customerID)
);

-- Tạo bảng Import
CREATE TABLE Import (
    importID VARCHAR(15) PRIMARY KEY,
    employeeID VARCHAR(15),
    supplierID VARCHAR(15),
    date VARCHAR(10),
    totalCost INT,
    FOREIGN KEY (employeeID) REFERENCES Employee(employeeID),
    FOREIGN KEY (supplierID) REFERENCES Supplier(supplierID)
);

-- Tạo bảng ImportDetail
CREATE TABLE ImportDetail (
    importID VARCHAR(15),
    productID VARCHAR(15),
    quantity INT,
    price INT,
    cost INT,
    PRIMARY KEY (importID, productID),
    FOREIGN KEY (importID) REFERENCES Import(importID),
    FOREIGN KEY (productID) REFERENCES Product(productID)
);
