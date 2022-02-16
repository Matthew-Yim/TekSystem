/*
1. Write a query to display each customer’s name (as “Customer Name”) alongside the name of the employee who is responsible for that customer’s orders. 
The employee name should be in a single “Sales Rep” column formatted as “lastName, firstName”. The output should be sorted alphabetically by customer name.


2. Determine which products are most popular with our customers. For each product, list the total quantity ordered along with the total sale generated 
(total quantity ordered * priceEach) for that product. The column headers should be “Product Name”, “Total # Ordered” and “Total Sale”. List the products by Total Sale descending.


3. Write a query which lists order status and the # of orders with that status. Column headers should be “Order Status” and “# Orders”. Sort alphabetically by status.


4. Write a query to list, for each product line, the total # of products sold from that product line. The first column should be “Product Line” and the second 
should be “# Sold”. Order by the second column descending.


5. For each employee who represents customers, output the total # of orders that employee’s customers have placed alongside the total sale amount of those orders. 
The employee name should be output as a single column named “Sales Rep” formatted as “lastName, firstName”. The second column should be titled “# Orders” and the 
third should be “Total Sales”. Sort the output by Total Sales descending. Only (and all) employees with the job title ‘Sales Rep’ should be included in the output, 
and if the employee made no sales the Total Sales should display as “0.00”.
 
 
6. Your product team is requesting data to help them create a bar-chart of monthly sales since the company’s inception. Write a query to output the month (January, February, etc.), 
4-digit year, and total sales for that month. The first column should be labeled ‘Month’, the second ‘Year’, and the third should be ‘Payments Received’. Values in the third column 
should be formatted as numbers with two decimals – for example: 694,292.68.
*/

use classicmodels;

-- Question 1:
SELECT cust.customerName as 'Customer Name', CONCAT(emp.lastName, ', ', emp.firstName) as 'Sales Rep'
FROM customers as cust
JOIN employees as emp on emp.employeeNumber = cust.salesRepEmployeeNumber 
ORDER by cust.customerName ASC

-- Question 2:
SELECT * FROM orderdetails as od
order by od.quantityOrdered DESC ;
SELECT * FROM products;

SELECT pro.productName as 'Product Name', od.quantityOrdered as 'Total # Ordered', sum(od.priceEach * od.quantityOrdered) as `Total Sale`
FROM orderdetails as od
JOIN products as pro on pro.productCode = od.productCode 
GROUP by pro.productName 
ORDER by `Total Sale` DESC

-- Question 3:
SELECT DISTINCT o.status as 'Order Status', count(o.status)
FROM orders as o
GROUP by o.status 
ORDER by o.status ASC
;

-- Question 4:
SELECT DISTINCT pro.productLine as 'Product Line', SUM(od.quantityOrdered) as '# Sold'
FROM products pro 
JOIN orderdetails od on pro.productCode = od.productCode 
GROUP by pro.productLine 
ORDER by od.quantityOrdered DESC 
;

-- 5. For each employee who represents customers, output the total # of orders that employee’s customers have placed alongside the total sale amount of those orders. 
-- The employee name should be output as a single column named “Sales Rep” formatted as “lastName, firstName”. The second column should be titled “# Orders” and the 
-- third should be “Total Sales”. Sort the output by Total Sales descending. Only (and all) employees with the job title ‘Sales Rep’ should be included in the output, 
-- and if the employee made no sales the Total Sales should display as “0.00”.

-- Output the total # of orders from employee's customers 
-- Output the total sale amount of orders 
-- Output employee name into a single column named "Sales Rep" formatted as "last name, first name"
-- Output the second column as "# Orders"
-- Output the third column as "Total Sales"
-- Sort by Total sales DESC 
-- Only 'Sales Rep' employees shall be displayed
-- If employees made no sales the Total sale shall be "0.00"
-- Question 5:
SELECT * from employees where jobTitle = 'Sales Rep';

SELECT CONCAT(emp.lastName, ', ', emp.firstName) as 'Sales Rep', sum(od.quantityOrdered) as '# Orders', sum(od.priceEach * od.quantityOrdered) as `Total Sales`, emp.jobTitle 
FROM employees as emp
Right outer JOIN customers as cus on cus.salesRepEmployeeNumber = emp.employeeNumber 
JOIN orders as o on o.customerNumber = cus.customerNumber 
JOIN orderdetails as od on od.orderNumber = o.orderNumber 
GROUP by cus.salesRepEmployeeNumber 
ORDER by `Total Sales` DESC
; -- NOT DONE

/*
6. Your product team is requesting data to help them create a bar-chart of monthly sales since the company’s inception. Write a query to output the month (January, February, etc.), 
4-digit year, and total sales for that month. The first column should be labeled ‘Month’, the second ‘Year’, and the third should be ‘Payments Received’. Values in the third column 
should be formatted as numbers with two decimals – for example: 694,292.68.
*/

SELECT * from orders;

SELECT DATE_FORMAT(o.shippedDate, '%M') as 'Month', DATE_FORMAT(o.shippedDate, '%Y') as 'Year', sum(od.quantityOrdered * od.priceEach) as 'Payment Recieved'
FROM orders as o
JOIN orderdetails as od on od.orderNumber = o.orderNumber 
WHERE o.status = 'Shipped'
GROUP by DATE_FORMAT(o.shippedDate, '%Y'), DATE_FORMAT(o.shippedDate, '%M')
;  





-- , TRUNCATE(SUM(od.quantityOrdered * od.priceEach , 2))  as 'Payments Recieved'













