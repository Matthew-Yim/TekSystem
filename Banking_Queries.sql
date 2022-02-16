/*
1. For each product, show the product name "Product" and the product type name "Type".

2. For each branch, list the branch name and city, plus the last name and title of each employee who works in that branch.

3. Show a list of each unique employee title.

4. Show the last name and title of each employee, along with the last name and title of that employee's boss.

5. For each account, show the name of the account's product, the available balance, and the customer's last name.

6. List all account transaction details for individual customers whose last name starts with 'T'.

*/

USE Banking;
-- Question 1:
SELECT NAME  as 'Product', PRODUCT_TYPE_CD  as 'Type'
from product;

-- Question 2:
SELECT b.NAME as 'Branch Name', b.CITY as 'Branch City', e.LAST_NAME as 'Last Name', e.TITLE as 'Title'
FROM branch as b
JOIN employee as e 
ORDER by b.city ASC
;

-- Question 3:
SELECT DISTINCT e.TITLE as 'Title'
FROM employee as e
ORDER by e.TITLE ASC
;

-- Question 4:
SELECT * FROM employee ;
SELECT e.LAST_NAME  as 'Employee Last Name', e.TITLE as 'Employee Title', e_Boss.LAST_NAME as 'Boss Last Name', e_Boss.TITLE as 'Boss Title'
FROM employee e 
LEFT JOIN employee as e_Boss on e.SUPERIOR_EMP_ID = e_Boss.EMP_ID 
ORDER by e.TITLE ASC 
;

-- Question 5:
SELECT pt.NAME as 'Product Name', acc.AVAIL_BALANCE as 'Available Balance', indv.LAST_NAME as 'Customer Last Name'
FROM account as acc
JOIN product as pt on pt.PRODUCT_CD  = acc.PRODUCT_CD 
JOIN individual as indv on indv.CUST_ID = acc.CUST_ID 
ORDER by indv.LAST_NAME  ASC
;

-- Question 6:
SELECT * , indv.LAST_NAME as 'Last Name of T clients'
FROM acc_transaction as acc_trans 
JOIN account as acc on acc.ACCOUNT_ID = acc_trans.ACCOUNT_ID 
JOIN individual as indv on indv.CUST_ID = acc.CUST_ID 
WHERE indv.LAST_NAME LIKE 'T%'
ORDER by indv.LAST_NAME ASC 
;


