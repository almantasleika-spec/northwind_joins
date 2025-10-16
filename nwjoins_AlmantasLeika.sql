-- 1. List all orders along with the customer's name who placed them.
-- Show the orderid, orderdate, and the contactname for each order.

/*SELECT
	orders.OrderID OrderID,
	orders.OrderDate OrderDate,
    customers.ContactName ContactName
FROM orders
JOIN customers
ON orders.CustomerID = customers.CustomerID;*/

-- 2. List all customers along with their orders, including customers who haven't placed any orders yet.
-- Show the customer contactname, orderid and orderdate.

/*SELECT
	customers.ContactName ContactName,
    orders.OrderID OrderID,
    orders.OrderDate OrderDate
FROM customers 
LEFT JOIN orders
ON orders.CustomerID = customers.CustomerID;*/

-- 3. For each product, show the product name along with the total quantity ordered across all orders.
-- Only include products that have been ordered at least once.

/*SELECT
	products.ProductName ProductName,
    SUM(order_details.Quantity) TotalNoOrdered -- 
FROM products
JOIN order_details
ON products.ProductID = order_details.ProductID
GROUP BY 
	products.ProductID, -- G B PID = how many products in all orders
    products.ProductName -- not aggregate value
ORDER BY TotalNoOrdered DESC*/

-- 4. Retrieve a list of customers along with their contact name and the total number of orders they have placed.
-- Only show customers who have placed more than 10 orders.

/*SELECT
	customers.ContactName,
    COUNT(orders.CustomerID)
FROM customers
JOIN orders
ON customers.CustomerID = orders.CustomerID
GROUP BY customers.ContactName
HAVING COUNT(orders.CustomerID) > 10
ORDER BY COUNT(orders.CustomerID);*/

-- 5. Find the names of all suppliers and the total number of products they supply.
-- Display the supplier's name and the count of products for each supplier.

/*SELECT
	suppliers.CompanyName SupplierName,
    COUNT(products.ProductID) NoProducts
FROM suppliers
JOIN products
ON suppliers.SupplierID = products.SupplierID
GROUP BY suppliers.CompanyName
ORDER BY suppliers.CompanyName;*/

-- 6. Retrieve the average unit price of products supplied by each supplier.
-- Show the supplier's name and the average unit price of the products they supply. The average price should be above 20$.

/*SELECT
	suppliers.CompanyName,
    ROUND(AVG(products.UnitPrice), 2) AvgUnitPrice    
FROM products
JOIN suppliers
ON products.SupplierID = suppliers.SupplierID
GROUP BY suppliers.CompanyName
HAVING AvgUnitPrice > 20
ORDER BY AvgUnitPrice DESC;*/

-- 7. List the names of customers along with the total amount they’ve spent on all orders.

/*SELECT
	customers.CompanyName,
    ROUND(SUM(order_details.Quantity * order_details.UnitPrice), 2) TotalSum
FROM customers
JOIN orders
ON customers.CustomerID = orders.CustomerID
JOIN order_details
ON orders.OrderID = order_details.OrderID
GROUP BY customers.CompanyName
ORDER BY TotalSum DESC;*/

-- 8. Find the category with the highest total sales (based on Quantity and UnitPrice). You can use LIMIT keyword to display only one row
-- Display the category name and the total sales value for each category, showing only the category with the highest total sales.

/*SELECT
	products.CategoryID,
    categories.CategoryName,
    ROUND(SUM(order_details.Quantity * order_details.UnitPrice), 2) TotalSales
FROM products
JOIN categories
ON products.CategoryID = categories.CategoryID
JOIN order_details
ON order_details.ProductID = products.ProductID
GROUP BY categories.CategoryName
ORDER BY TotalSales DESC
LIMIT 1;*/