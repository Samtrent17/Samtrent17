-- Active: 1729087589771@@127.0.0.1@3306@appliance_store
-- Create Supplier table first
CREATE TABLE Supplier(
    Supplier_ID INT,
    Supplier_Name VARCHAR(45),
    Contact_Number INT,
    Email_Address VARCHAR(45),
    Address_LOCATION VARCHAR(45),
    Products_Supplied VARCHAR(45),
    PRIMARY KEY (Supplier_ID)
);
CREATE TABLE CustomerId(
    customer_ID int,
    first_name VARCHAR(45),
    contact_number int,
    email_address VARCHAR(45),
    Shipping_Address VARCHAR(45),
    billing_address VARCHAR(45),
    Customer_Type VARCHAR(45),
    PRIMARY KEY (customer_ID)
);
CREATE TABLE Orders(
    order_ID INT,
    customer_ID INT,
    order_date VARCHAR(45),
    total_amount INT,
    shipping_status VARCHAR(45),
    payment_Status VARCHAR(45),
    PRIMARY KEY (order_ID),
    FOREIGN KEY (customer_ID) REFERENCES CustomerId(customer_ID)
);
CREATE TABLE Product(
    Product_ID INT,
    Product_Name VARCHAR(45),
    Product_Type VARCHAR(45),
    Brand VARCHAR(45),
    Model_Number INT,
    Price INT,
    Quantity_in_Stock VARCHAR(45),
    Supplier_ID INT,
    PRIMARY KEY (Product_ID),
    FOREIGN KEY (Supplier_ID) REFERENCES Supplier(Supplier_ID)
);
CREATE TABLE Inventory(
    Inventory_ID INT,
    Product_ID INT,
    Stock_Level VARCHAR(45),
    Last_Updated VARCHAR(45),
    PRIMARY KEY (Inventory_ID),
    FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID)
);
CREATE TABLE OrderDetails(
    OrderDetail_ID INT,
    OrderID INT,
    Product_ID INT,
    Quantity INT,
    Price VARCHAR(45),
    PRIMARY KEY (OrderDetail_ID),
    FOREIGN KEY (OrderID) REFERENCES Orders(order_ID),
    FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID)
);
CREATE TABLE Payment(
    Payment_ID INT,
    Order_ID INT,
    Payment_Date VARCHAR(45),
    Payment_Method VARCHAR(45),
    Payment_Amount INT,
    PRIMARY KEY (Payment_ID),
    FOREIGN KEY (Order_ID) REFERENCES Orders(order_ID)
);
CREATE TABLE Employee(
    Employee_ID INT,
    First_Name VARCHAR(45),
    Last_Name VARCHAR(45),
    Contact_Number INT,
    Email_Address VARCHAR(45),
    Job_Title VARCHAR(45),
    Salary VARCHAR(45),
    Hire_Date VARCHAR(45),
    PRIMARY KEY (Employee_ID)
);

INSERT INTO CustomerId VALUES 
(1, 'John', 0776543210, 'john.doe@email.com', '123 Elm St', '456 Oak St', 'Regular'),
(2, 'Jane', 0723456789, 'jane.smith@email.com', '789 Maple Ave', '101 Pine Rd', 'Premium'),
(3, 'Alice', 0712345678, 'alice.jones@email.com', '321 Cedar Blvd', '654 Birch St', 'Regular');

INSERT INTO Supplier VALUES 
(1, 'ABC Supplies', 0776543210, 'abc.supplies@email.com', '123 Main St', 'Electronics'),
(2, 'Global Tech', 0723456789, 'global.tech@email.com', '456 Market Rd', 'Appliances'),
(3, 'Prime Suppliers', 0712345678, 'prime.suppliers@email.com', '789 Industrial Ave', 'Furniture');

INSERT INTO Product VALUES 
(1, 'Washing Machine', 'Appliance', 'Whirlpool', 1010, 450, '20', 1),
(2, 'Laptop', 'Electronics', 'Dell', 2020, 1200, '15', 2),
(3, 'Sofa', 'Furniture', 'Ashley', 3030, 800, '10', 3);

INSERT INTO Orders VALUES 
(1, 1, '2024-10-01', 500, 'Shipped', 'Paid'),
(2, 2, '2024-10-05', 1500, 'Processing', 'Pending'),
(3, 3, '2024-10-07', 750, 'Delivered', 'Paid');

INSERT INTO Inventory VALUES 
(1, 1, '50', '2024-10-10'),
(2, 2, '30', '2024-10-09'),
(3, 3, '20', '2024-10-08');

INSERT INTO Order_Details VALUES 
(1, 1, 1, 1, '500'),
(2, 2, 2, 2, '1200'),
(3, 3, 3, 1, '800');

INSERT INTO Payment VALUES 
(1, 1, '2024-10-02', 'Credit Card', 500),
(2, 2, '2024-10-06', 'Bank Transfer', 1500),
(3, 3, '2024-10-08', 'Mobile Money', 750);

INSERT INTO Employee VALUES 
(1, 'Michael', 'Brown', 0771234560, 'michael.brown@email.com', 'Manager', '5000', '2024-01-01'),
(2, 'Sara', 'Connor', 0723456789, 'sara.connor@email.com', 'Sales Associate', '3000', '2024-02-15'),
(3, 'David', 'Wilson', 0712345678, 'david.wilson@email.com', 'Technician', '4000', '2024-03-20');




select*from Employee;
                                                     