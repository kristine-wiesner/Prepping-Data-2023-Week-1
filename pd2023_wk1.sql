--Week 1 Challenge
--Techniques:
--1. Splitting strings with SPLIT_PART
--2. Case Statements
--3. Converting strings to dates

SELECT *
FROM pd2023_wk01 ;


-- 1. Total Values of Transactions by each bank
SELECT 
    SPLIT_PART(transaction_code,'-',1) as bank,
    SUM(value) as total_value
FROM pd2023_wk01
GROUP BY bank;

-- 2. Total Values by Bank, Day of the Week and Type of Transaction (Online or In-Person)
SELECT
    SPLIT_PART(transaction_code,'-',1) as bank,
    CASE 
    WHEN online_or_in_person=1 THEN 'Online'
    WHEN online_or_in_person=2 THEN 'In-Person'
    END as online_in_person,
    DAYNAME(DATE(transaction_date,'dd/MM/yyyy hh24:mi:ss')) as day_of_week,
    SUM(value) as total_value
FROM pd2023_wk01
GROUP BY 1,2,3;

-- 3. Total Values by Bank and Customer Code
SELECT
    SPLIT_PART(transaction_code,'-',1) as bank,
    customer_code,
    SUM(value) as total_value
FROM pd2023_wk01
GROUP BY 
    bank,
    customer_code;