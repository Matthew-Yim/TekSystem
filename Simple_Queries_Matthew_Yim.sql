/*
 1. Write a query to display the name, product line, and buy price of all products. The output columns should display as “Name”, 
 	“Product Line”, and “Buy Price”. The output should display the most expensive items first.

 

2. Write a query to display the first name, last name, and city for all customers from Germany. Columns should display as 
   “First Name”, “Last Name”, and “City”. The output should be sorted by the customer’s last name (ascending).

 

3. Write a query to display each of the unique values of the status field in the orders table. The output should be sorted 
   alphabetically increasing. Hint: the output should show exactly 6 rows.

 

4. Select all fields from the payments table for payments made on or after January 1, 2005. Output should be sorted by 
   increasing payment date.

 

5. Write a query to display all Last Name, First Name, Email and Job Title of all employees working out of the San Francisco 
   office. Output should be sorted by last name.

 

6. Write a query to display the Name, Product Line, Scale, and Vendor of all of the car products – both classic and vintage. 
   The output should display all vintage cars first (sorted alphabetically by name), and all classic cars last (also sorted alphabetically by name).
*/

use classicmodels ;

-- Question 1:
SELECT productName  as 'Name', productLine  as 'Product Line', buyPrice as 'Buy Price' 
from products
order by buyPrice DESC;
;

-- Question 2:
SELECT contactFirstName as 'First Name', contactLastName as 'Last Name', city as 'City'
FROM customers 
WHERE country = 'Germany' 
order by contactLastName ASC ;

-- Question 3:
SELECT DISTINCT status FROM orders;

-- Question 4:
SELECT * from payments
WHERE paymentDate > '2005-01-01'
ORDER by paymentDate  ASC; 

-- Question 5:
SELECT Name as ' Name', firstName as 'First Name', email as 'Email', jobTitle as 'Job Title' 
from employees
WHERE officeCode = 1
order by lastName ASC;

-- Question 6:
SELECT productName as 'Last Name', productLine as 'Product Line', productScale as 'Scale', productVendor as 'Vendor'
from products
WHERE productLine = 'Classic Cars' OR productLine = 'Vintage Cars'
order by productLine DESC,
Substring(productName, 6), productName ASC;
