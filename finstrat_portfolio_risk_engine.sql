-- ==================================================================================================================================================================== 
-- PROJECT TITLE : Financial Strategy (FinStrat) Loan Intelligence & Risk Analytics Engine
-- DESCRIPTION   : Comprehensive SQL analysis of 80 portfolio risk factors, 
--                 customer lending behaviors, and regional credit demands.
-- AUTHOR        : [Akash Kumar]
-- ROLE          : Data / SQL Analyst Portfolio Project
-- DATABASE      : PostgreSQL 
-- ====================================================================================================================================================================

-- --------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- PORTFOLIO ANALYTICS & CREDIT RISK QUERIES (1-80)
-- --------------------------------------------------------------------------------------------------------------------------------------------------------------------


 --Q1.Display all loan records.

SELECT
  *
FROM
  LOAN;

--Q2.Display only customer name, city, loan type and loan amount.

SELECT
  CUSTOMER_NAME,
  CITY,
  LOAN_TYPE,
  LOAN_AMOUNT
FROM
  LOAN;

--Q3.Find all customers who have applied for a Personal Loan.

SELECT
  CUSTOMER_NAME,
  LOAN_TYPE
FROM
  LOAN
WHERE
  LOAN_TYPE = 'Personal';

--Q4.Find customers whose loan amount is greater than ₹5,00,000.

SELECT
  CUSTOMER_NAME,
  LOAN_AMOUNT
FROM
  LOAN
WHERE
  LOAN_AMOUNT > 500000;
	
--Q5.Find customers from a particular city.

SELECT 
    CUSTOMER_NAME,
    CITY
FROM 
  LOAN ;  

--Q6.Display customers whose credit score is greater than 750.

SELECT
  CUSTOMER_NAME,
  CREDIT_SCORE
FROM
  LOAN
WHERE
  CREDIT_SCORE > 750;
	
--Q7.Find customers whose annual income is between ₹5 lakh and ₹15 lakh.

SELECT
  CUSTOMER_NAME,
  ANNUAL_INCOME
FROM
  LOAN
WHERE
  ANNUAL_INCOME BETWEEN 500000 AND 1500000;

--Q8.Display all customers whose loan status is Approved.

SELECT
  *
FROM
  LOAN
WHERE
  LOAN_STATUS = 'Approved';

--Q9.Find all customers whose payment status is Overdue.

SELECT
  *
FROM
  LOAN
WHERE
  PAYMENT_STATUS = 'Overdue';

--Q10.Display loans where outstanding amount is greater than ₹2,00,000.

SELECT
  CUSTOMER_NAME,
  LOAN_AMOUNT,
  OUTSTANDING_AMOUNT
FROM
  LOAN
WHERE
  OUTSTANDING_AMOUNT > 200000;

--Q11.	Display the 10 largest loans.

SELECT 
  CUSTOMER_ID , CUSTOMER_NAME, LOAN_AMOUNT
FROM 
  LOAN
ORDER BY 
  LOAN_AMOUNT DESC
LIMIT
  10;
	
--Q12.	Display customers in descending order of credit score.

SELECT 	
  CUSTOMER_NAME, 
  CREDIT_SCORE
FROM 
  LOAN
ORDER BY 
  CREDIT_SCORE DESC;

--Q13.	Display customers in ascending order of loan amount.

SELECT 	
  CUSTOMER_NAME,
  LOAN_AMOUNT
FROM 
  LOAN 
ORDER BY
   LOAN_AMOUNT ASC;

--Q14.	Find loans with interest rates greater than 10%.

SELECT 
  CUSTOMER_NAME,
  LOAN_AMOUNT,
  INTEREST_RATE
FROM 
  LOAN
WHERE 
  INTEREST_RATE >10;
	
--Q15.	Find customers between the ages of 25 and 40.

SELECT 	
  CUSTOMER_NAME,
  AGE
FROM
  LOAN
WHERE 
  AGE BETWEEN 25 AND 40;
	
--Q16.	Find customers whose names start with A.

SELECT 
  CUSTOMER_NAME
FROM 
  LOAN
WHERE 
  CUSTOMER_NAME ILIKE 'A%';

--Q17.	Find customers whose city contains the letter a.

SELECT 
  CUSTOMER_NAME,
  CITY
FROM 
  LOAN
WHERE
  CITY ILIKE '%a%';
	
--Q18.	Find customers who are not from a particular state.

SELECT
  CUSTOMER_NAME,
  STATE
FROM
  LOAN
WHERE
  STATE !='Maharashtra';
	
--Q19.	Find loans that are either Approved or Disbursed.

SELECT 
  CUSTOMER_NAME,
  LOAN_STATUS
FROM 
  LOAN
WHERE 
  LOAN_STATUS IN ('Approved','Disbursed');
	
--Q20.	Find customers whose payment status is not Paid.

SELECT 
  CUSTOMER_NAME,
  PAYMENT_STATUS
FROM 
  LOAN 
WHERE
  PAYMENT_STATUS !='Paid';

--Q21.	Total number of loan applications.

SELECT 
  COUNT(CUSTOMER_ID) AS TOTAL_APPLICATION
FROM 
  LOAN;

--Q22.	Total number of approved loans.
SELECT
  COUNT(*) AS TOTAL_APROVED
FROM
  LOAN
WHERE
  LOAN_STATUS = 'Approved';
 
--Q23.	Total loan amount requested.

SELECT
  SUM(LOAN_AMOUNT) AS TOTAL_AMOUNT_REQUESTED
FROM
  LOAN;

--Q24.	Total loan amount disbursed.

SELECT
  SUM(LOAN_AMOUNT) AS TOTAL_AMOUNT
FROM
   LOAN
WHERE
   LOAN_STATUS = 'Disbursed';
 

--Q25.	Total outstanding loan amount.

SELECT
  SUM(OUTSTANDING_AMOUNT) AS TOTAL_OUTSTANDING_AMOUNT
FROM
  LOAN;

--Q26.	Total overdue amount.

SELECT 
   PAYMENT_STATUS,
   SUM(OVERDUE_AMOUNT)
FROM 
   LOAN
WHERE 
   PAYMENT_STATUS ='Overdue'
GROUP BY 
    PAYMENT_STATUS;

--Q27.	Average loan amount.

SELECT 
   ROUND(AVG(LOAN_AMOUNT),1) AS AVG_AMOUNT
FROM 
  LOAN;
	
--Q28.	Average interest rate.

SELECT 
  ROUND(AVG(INTEREST_RATE),1) AS AVG_INTEREST
FROM 
  LOAN;
	
--Q29.	Maximum loan amount.

SELECT
  MAX(LOAN_AMOUNT) AS MAX_AMOUNT
FROM 
  LOAN;
	
--Q30.	Minimum loan amount.

SELECT
   MIN(LOAN_AMOUNT) AS MIN_LOAN_AMOUNT
FROM
   LOAN;
	
--Q31.	Average credit score.

SELECT
    ROUND(AVG(CREDIT_SCORE), 2) AS AVG_CREDIT_SCORE
FROM
   LOAN;
--Q32.	Average annual income of borrowers

SELECT
     ROUND(AVG(ANNUAL_INCOME), 2) AS AVG_BORROWER_ANNUAL_INCOME
FROM
   LOAN;

--Q33.	Find the number of loans for each loan type.

SELECT
  LOAN_TYPE,
  COUNT(*) AS TOTAL_LOANS
FROM
  LOAN
GROUP BY
  LOAN_TYPE;
		
--Q34.	Find total loan amount for each loan type.

SELECT
  LOAN_TYPE,
  SUM(LOAN_AMOUNT) AS TOTAL_LOAN_AMOUNT
FROM
  LOAN
GROUP BY
  LOAN_TYPE;
	
--Q35.	Find average loan amount for each loan type.

SELECT 
  LOAN_TYPE,
   ROUND(AVG(LOAN_AMOUNT),2) AS AVERAGE_LOAN_AMOUNT
FROM 
  LOAN
GROUP BY 
  LOAN_TYPE;

--Q36.	Find total loan amount by city.

SELECT 
  CITY,
  SUM(LOAN_AMOUNT) AS TOTAL_LOAN_AMOUNT
FROM 
  LOAN
GROUP BY 
  CITY;
	
--Q37.	Find number of customers by state.

SELECT 
  STATE,
  COUNT(CUSTOMER_ID) AS NUMBER_OF_CUSTOMER
FROM 
  LOAN 
GROUP BY 
  STATE;
	
--Q38.	Find average credit score by loan type.

SELECT
  LOAN_TYPE,
  ROUND(AVG(CREDIT_SCORE),2) AS AVG_CREDIT_SCORE
FROM 
  LOAN
GROUP BY 
  LOAN_TYPE;
	
--Q39.	Find total outstanding amount by loan type.

SELECT 
  LOAN_TYPE,
  SUM(OUTSTANDING_AMOUNT) AS TOTAL_OUTSTANDING_AMOUNT
FROM 
  LOAN
GROUP BY 
   LOAN_TYPE;
	 
--Q40.	Find total overdue amount by city.

SELECT 
  CITY,
  SUM(OVERDUE_AMOUNT) AS TOTAL_OVERDUE_AMOUNT
FROM 
  LOAN
GROUP BY 
  CITY;
	
--Q41.	Find the number of loans by payment status.

SELECT 		
  PAYMENT_STATUS,
  COUNT(*) AS NUMBER_OF_LOAN
FROM 	
  LOAN
GROUP BY	
  PAYMENT_STATUS;
	
--Q42.	Find the number of loans by employment type.


SELECT 
   EMPLOYMENT_TYPE,
   COUNT(*) AS total_loans
FROM 
  LOAN
GROUP BY 
  EMPLOYMENT_TYPE;
 
--Q43.	Find loan types having more than 5 loans.

SELECT  
  LOAN_TYPE,
  COUNT(*) AS TOTAL_LOANS
FROM 
  LOAN
GROUP BY 
  LOAN_TYPE
HAVING 
  COUNT(*)>5;
	
--Q44.	Find cities where total loan disbursement is greater than ₹50 lakh.

 SELECT 	
   CITY,
   SUM(LOAN_AMOUNT) AS total_disbursement
FROM 
    LOAN
WHERE 
    LOAN_STATUS = 'Disbursed'
GROUP BY 
    CITY
HAVING 
    SUM(LOAN_AMOUNT) > 5000000;

--Q45.	Find loan types whose average loan amount is greater than ₹3 lakh.

SELECT 
  LOAN_TYPE,
  ROUND(AVG(LOAN_AMOUNT),2) AS AVG_LOAN_AMOUNT
FROM 
  LOAN
GROUP BY 
  LOAN_TYPE 
HAVING 
  AVG(LOAN_AMOUNT)>300000;
	
--Q46.	Find cities having total overdue amount greater than ₹1 lakh.

SELECT 	
  CITY,
  SUM(OVERDUE_AMOUNT) AS TOTAL_OVERDUE
FROM 
  LOAN 
GROUP BY 
  CITY
HAVING 
  SUM(OVERDUE_AMOUNT)>100000;
	
--Q47.	Find employment types having more than 10 borrowers.

SELECT 
  EMPLOYMENT_TYPE,
   COUNT(*) AS TOTAL_BORROWERS
FROM 
  LOAN
GROUP BY 
  EMPLOYMENT_TYPE
HAVING 
   COUNT(*)>10;

--Q48.	Display customer name, credit score and risk category.

SELECT 
  CUSTOMER_NAME,
  CREDIT_SCORE,
             CASE
 	        WHEN CREDIT_SCORE >=750 THEN 'Low Risk'
		WHEN CREDIT_SCORE>=650 THEN 'Medium Risk'
		WHEN CREDIT_SCORE>=550 THEN 'High Risk'
		ELSE 'Very High Risk'
           END AS RISK_CATEGORY
FROM 
  LOAN;
	
--Q49.	Count customers in each risk category.

 SELECT 
    RISK_CATEGORY,
    COUNT(*) AS TOTAL_CUSTOMERS
FROM (
    SELECT 
        CASE
            WHEN CREDIT_SCORE >= 750 THEN 'Low Risk'
            WHEN CREDIT_SCORE >= 650 THEN 'Medium Risk'
            WHEN CREDIT_SCORE >= 550 THEN 'High Risk'
            ELSE 'Very High Risk'
        END AS RISK_CATEGORY
    FROM 
        LOAN
) AS RISK_DATA
GROUP BY 
    RISK_CATEGORY
ORDER BY 
    TOTAL_CUSTOMERS DESC;

--Q50.	Find the total outstanding amount for each risk category.

 SELECT 
    RISK_CATEGORY,
    SUM(OUTSTANDING_AMOUNT) AS TOTAL_OUTSTANDING_AMOUNT
FROM (
    SELECT OUTSTANDING_AMOUNT,
        CASE
            WHEN CREDIT_SCORE >= 750 THEN 'Low Risk'
            WHEN CREDIT_SCORE >= 650 THEN 'Medium Risk'
            WHEN CREDIT_SCORE >= 550 THEN 'High Risk'
            ELSE 'Very High Risk'
        END AS RISK_CATEGORY
    FROM 
        LOAN
) AS RISK_DATA
GROUP BY 
    RISK_CATEGORY
ORDER BY 
    TOTAL_OUTSTANDING_AMOUNT DESC;
	

--Q51.	Find the total overdue amount for each risk category.

 SELECT 
    RISK_CATEGORY,
    SUM(OVERDUE_AMOUNT) AS TOTAL_OVERDUE_AMOUNT
FROM (
    SELECT OVERDUE_AMOUNT ,
        CASE
            WHEN CREDIT_SCORE >= 750 THEN 'Low Risk'
            WHEN CREDIT_SCORE >= 650 THEN 'Medium Risk'
            WHEN CREDIT_SCORE >= 550 THEN 'High Risk'
            ELSE 'Very High Risk'
        END AS RISK_CATEGORY
    FROM 
        LOAN
) AS RISK_DATA
GROUP BY 
    RISK_CATEGORY
ORDER BY 
    TOTAL_OVERDUE_AMOUNT DESC;

--Q52. Loan Approval Rate.

SELECT 
    COUNT(CASE WHEN LOAN_STATUS = 'Approved' THEN 1 END) AS APPROVED_LOAN_COUNT,
    COUNT(*) AS TOTAL_APPLICATION_COUNT,
    ROUND(
        (COUNT(CASE WHEN LOAN_STATUS = 'Approved' THEN 1 END) * 100.0) / COUNT(*), 
        2
    ) AS LOAN_APPROVAL_RATE_PCT
FROM 
    LOAN;


--Q53. Loan Rejection Rate.

SELECT 
    COUNT(CASE WHEN LOAN_STATUS = 'Rejected' THEN 1 END) AS REJECTED_LOAN_COUNT,
    COUNT(*) AS TOTAL_APPLICATION_COUNT,
    ROUND(
        (COUNT(CASE WHEN LOAN_STATUS = 'Rejected' THEN 1 END) * 100.0) / COUNT(*), 
        2
    ) AS LOAN_REJECTION_RATE_PCT
FROM 
    LOAN;


--Q54. Average Loan Amount.
  
SELECT 
    ROUND(AVG(LOAN_AMOUNT), 2) AS AVERAGE_LOAN_AMOUNT
FROM 
    LOAN;


--Q55. Total Disbursed Amount.
  
SELECT 
    SUM(LOAN_AMOUNT) AS TOTAL_DISBURSED_AMOUNT
FROM 
    LOAN
WHERE 
    LOAN_STATUS = 'Disbursed';


--Q56. Total Outstanding Amount.
 
SELECT 
    SUM(OUTSTANDING_AMOUNT) AS TOTAL_OUTSTANDING_AMOUNT
FROM 
    LOAN;


--Q57. Total Overdue Amount.
  
SELECT 
    SUM(OVERDUE_AMOUNT) AS TOTAL_OVERDUE_AMOUNT
FROM 
    LOAN
WHERE 
    PAYMENT_STATUS = 'Overdue';


--Q58. Average Credit Score.
 
SELECT 
    ROUND(AVG(CREDIT_SCORE), 2) AS AVG_CREDIT_SCORE
FROM 
    LOAN;


--Q59. Default Customer Count.
  
SELECT 
    COUNT(DISTINCT CUSTOMER_ID) AS DEFAULT_CUSTOMER_COUNT
FROM 
    LOAN
WHERE 
    DEFAULT_STATUS = 'Yes';

SELECT * FROM LOAN

--Q60. Percentage of Overdue Loans.
  
SELECT 
    COUNT(CASE WHEN PAYMENT_STATUS = 'Overdue' THEN 1 END) AS OVERDUE_LOAN_COUNT,
    COUNT(*) AS TOTAL_ACTIVE_LOANS,
    ROUND(
        (COUNT(CASE WHEN PAYMENT_STATUS = 'Overdue' THEN 1 END) * 100.0) / COUNT(*), 
        2
    ) AS PERCENTAGE_OF_OVERDUE_LOANS_PCT
FROM 
    LOAN;

--Q61.	Find loans applied for in a particular year.

  SELECT 
    loan_id, customer_id, application_date, loan_amount
FROM 
    loan
WHERE 
    EXTRACT(YEAR FROM application_date) = 2026;
	
--Q62.	Find loans approved during a particular month.

SELECT 
    loan_id, customer_id, approval_date, loan_status
FROM 
    loan
WHERE 
    loan_status = 'Disbursed' OR loan_status = 'Approved'  
    AND EXTRACT(MONTH FROM approval_date) = 1;
 
--Q63.	Find the number of loans applied for each year.

SELECT 
    EXTRACT(YEAR FROM application_date) AS application_year,
    COUNT(*) AS total_loans_applied
FROM 
    loan
GROUP BY 
    EXTRACT(YEAR FROM application_date)
ORDER BY 
    application_year DESC;
	
 --Q64. Find the total loan amount disbursed each year.
 
SELECT 
    EXTRACT(YEAR FROM disbursement_date) AS disbursement_year,
    SUM(loan_amount) AS total_amount_disbursed
FROM 
    loan
WHERE 
    loan_status = 'Disbursed'
GROUP BY 
    EXTRACT(YEAR FROM disbursement_date)
ORDER BY 
    disbursement_year DESC;


--Q65. Find customers whose loan was approved but not yet disbursed.

SELECT
	CUSTOMER_ID,
	LOAN_ID,
	LOAN_AMOUNT,
	LOAN_STATUS,
	DISBURSEMENT_DATE
FROM
	LOAN
WHERE
	LOAN_STATUS = 'Approved'
	AND DISBURSEMENT_DATE IS NULL;


--Q66. Find the number of loans approved in each month.

SELECT 
    EXTRACT(YEAR FROM approval_date) AS approval_year,
    EXTRACT(MONTH FROM approval_date) AS approval_month,
    COUNT(*) AS total_loans_approved
FROM 
    loan
WHERE 
    loan_status = 'Approved' OR loan_status = 'Disbursed'  
GROUP BY 
    EXTRACT(YEAR FROM approval_date),
    EXTRACT(MONTH FROM approval_date)  
ORDER BY 
    approval_year DESC, 
    approval_month ASC;

--Q67. Find the average number of days between application and approval.
 
SELECT 
    ROUND(AVG(approval_date - application_date), 1) AS avg_days_to_approve
FROM 
    loan
WHERE 
    approval_date IS NOT NULL;


 
 --Q68. Find customers whose loan amount is greater than the average loan amount.
 
SELECT 
    customer_id, 
    loan_id, 
    loan_amount
FROM 
    loan
WHERE 
    loan_amount > (SELECT AVG(loan_amount) FROM loan)
ORDER BY 
    loan_amount DESC;


--Q69. Find customers whose credit score is greater than the average credit score.

SELECT 
    customer_id, 
    credit_score
FROM 
    loan
WHERE 
    credit_score > (SELECT AVG(credit_score) FROM loan)
ORDER BY 
    credit_score DESC;


--Q70. Find the customer who has taken the highest loan amount.
 
SELECT 
    customer_id, 
    loan_id, 
    loan_amount
FROM 
    loan
ORDER BY 
    loan_amount DESC
LIMIT 1;


--Q71. Find customers who have outstanding amounts greater than the average outstanding amount.

SELECT 
    customer_id, 
    loan_id, 
    outstanding_amount
FROM 
    loan
WHERE 
    outstanding_amount > (SELECT AVG(outstanding_amount) FROM loan)
ORDER BY 
    outstanding_amount DESC;


--Q72. Find the loan type having the highest total loan amount.
 
SELECT 
    loan_type,
    SUM(loan_amount) AS total_loan_disbursed
FROM 
    loan
GROUP BY 
    loan_type
ORDER BY 
    total_loan_disbursed DESC
LIMIT 1;
 
--Q73. Find customers whose annual income is greater than the average annual income.

SELECT 
    customer_id, 
    annual_income
FROM 
    loan
WHERE 
    annual_income > (SELECT AVG(annual_income) FROM loan)
ORDER BY 
    annual_income DESC;

 --Q74. Find the top 5 customers by total loan amount.

SELECT 
    customer_id,
    SUM(loan_amount) AS total_loan_borrowed
FROM 
    loan
GROUP BY 
    customer_id
ORDER BY 
    total_loan_borrowed DESC
LIMIT 5;

--Q75. Find the top 3 cities by total loan disbursement.

SELECT 
    city,
    SUM(loan_amount) AS total_disbursed_amount
FROM 
    loan
WHERE 
    loan_status = 'Disbursed'
GROUP BY 
    city
ORDER BY 
    total_disbursed_amount DESC
LIMIT 3;

--Q76. Find the top 3 loan types by outstanding amount.

SELECT 
    loan_type,
    SUM(outstanding_amount) AS total_outstanding_amount
FROM 
    loan
GROUP BY 
    loan_type
ORDER BY 
    total_outstanding_amount DESC
LIMIT 3;


--Q77. Find customers who have both: Credit score below 650 AND Overdue amount greater than ₹50,000.
 
SELECT 
    customer_id,
    credit_score,
    overdue_amount
FROM 
    loan
WHERE 
    credit_score < 650 
    AND overdue_amount > 50000;


--Q78. Identify customers whose loan amount is high compared with their annual income.
 
SELECT 
    customer_id,
    loan_amount,
    annual_income,
    ROUND((loan_amount / NULLIF(annual_income, 0)), 2) AS loan_to_income_ratio
FROM 
    loan
WHERE 
    (loan_amount / NULLIF(annual_income, 0)) > 5.0
ORDER BY 
    loan_to_income_ratio DESC;


--Q79. Identify customers who have multiple loans.
 
SELECT 
    customer_id,
    COUNT(loan_id) AS total_active_loans
FROM 
    loan
GROUP BY 
    customer_id
HAVING 
    COUNT(loan_id) > 1
ORDER BY 
    total_active_loans DESC;


--Q80. Find customers whose previous loan is closed but who have another active loan.
 
SELECT DISTINCT
    a.customer_id
FROM 
    loan a
JOIN 
    loan b ON a.customer_id = b.customer_id
WHERE 
    a.loan_status = 'Closed' 
    AND b.loan_status IN ('Disbursed', 'Approved');




