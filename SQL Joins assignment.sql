create database test ;
use test ;

---- customers table ----

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    City VARCHAR(50)
);
select * from customers;

INSERT INTO Customers (CustomerID, CustomerName, City)
VALUES
(1, 'John Smith', 'New York'),
(2, 'Mary Johnson', 'Chicago'),
(3, 'Peter Adams', 'Los Angeles'),
(4, 'Nancy Miller', 'Houston'),
(5, 'Robert White', 'Miami');


----- orders table ----

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    Amount INT
);
 
 select * from orders;
 
 INSERT INTO Orders (OrderID, CustomerID, OrderDate, Amount)
VALUES
(101, 1, '2024-10-01', 250),
(102, 2, '2024-10-05', 300),
(103, 1, '2024-10-07', 150),
(104, 3, '2024-10-10', 450),
(105, 6, '2024-10-12', 400);  

---- payments table ----
 
CREATE TABLE Payments (
    PaymentID VARCHAR(10) PRIMARY KEY,
    CustomerID INT,
    PaymentDate DATE,
    Amount INT
);

select * from payments;
INSERT INTO Payments (PaymentID, CustomerID, PaymentDate, Amount)
VALUES
('P001', 1, '2024-10-02', 250),
('P002', 2, '2024-10-06', 300),
('P003', 3, '2024-10-11', 450),
('P004', 4, '2024-10-15', 200);

---- employees table ------

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(50),
    ManagerID INT
);
select * from employees;

INSERT INTO Employees (EmployeeID, EmployeeName, ManagerID)
VALUES
(1, 'Alex Green', NULL),
(2, 'Brian Lee', 1),
(3, 'Carol Ray', 1),
(4, 'David Kim', 2),
(5, 'Eva Smith', 2);

---- Question 1. Retrieve all customers who have placed at least one order.

SELECT  c.CustomerID, c.CustomerName
FROM Customers c
INNER JOIN Orders o 
ON c.CustomerID = o.CustomerID;

---- Question 2. Retrieve all customers and their orders, including customers who have not placed any orders.

SELECT c.CustomerID, c.CustomerName, o.OrderID
FROM Customers c
LEFT JOIN Orders o 
ON c.CustomerID = o.CustomerID;

--- Question 3. Retrieve all orders and their corresponding customers, including orders placed by unknown customers.

SELECT 
    o.OrderID,
    o.CustomerID,
    c.CustomerName,
    c.City,
    o.OrderDate,
    o.Amount
FROM Orders o
LEFT JOIN Customers c
    ON o.CustomerID = c.CustomerID;
    
   --- Question 4. Display all customers and orders, whether matched or not.
   SELECT 
    c.CustomerID,
    c.CustomerName,
    c.City,
    o.OrderID,
    o.OrderDate,
    o.Amount
FROM Customers c
 join orders o
    ON c.CustomerID = o.CustomerID;
    
   ---- Question 5. Find customers who have not placed any orders.
   
SELECT 
    C.CustomerID,
    C.CustomerName,
    C.City
FROM Customers c
LEFT JOIN Orders o
    ON C.CustomerID = O.CustomerID
WHERE O.CustomerID IS NULL;

---- Question 6. Retrieve customers who made payments but did not place any orders
SELECT DISTINCT 
    C.CustomerID,
    C.CustomerName,
    C.City
FROM Customers c
INNER JOIN Payments p
    ON C.CustomerID = P.CustomerID
LEFT JOIN Orders o
    ON C.CustomerID = O.CustomerID
WHERE O.CustomerID IS NULL;

---- Question 7. Generate a list of all possible combinations between Customers and Orders.
SELECT 
    C.CustomerID,
    C.CustomerName,
    O.OrderID,
    O.OrderDate,
    O.Amount
FROM Customers c
CROSS JOIN Orders o;

---- Question 8. Show all customers along with order and payment amounts in one table.

SELECT 
    C.CustomerID,
    C.CustomerName,
    C.City,
    O.OrderID,
    O.OrderDate,
    O.Amount AS OrderAmount,
    P.PaymentID,
    P.PaymentDate,
    P.Amount AS PaymentAmount
FROM Customers c
LEFT JOIN Orders o
    ON C.CustomerID = O.CustomerID
LEFT JOIN Payments p
    ON C.CustomerID = P.CusomerID;
    
   ---- Question 9. Retrieve all customers who have both placed orders and made payments
   
   SELECT DISTINCT 
    C.CustomerID,
    C.CustomerName,
    C.City
FROM Customers c
INNER JOIN Orders o
    ON C.CustomerID = O.CustomerID
INNER JOIN Payments p
    ON C.CustomerID = P.CustomerID;

 
 
 
 
 
 
 