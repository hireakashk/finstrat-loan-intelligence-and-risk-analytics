# FinStrat — Loan Intelligence & Risk Analytics Engine

**FinStrat** stands for **Financial Strategy**. This project is a comprehensive SQL-based analytics engine built to analyze loan portfolio risk, customer lending behavior, and regional credit demand patterns.

---

## Project Overview

This repository contains a structured collection of **80 SQL queries** written against a single `LOAN` table, progressing from basic data retrieval to advanced multi-condition, subquery, and window-style analysis. The project is designed to demonstrate practical, end-to-end SQL analytical thinking — the kind of query logic a Data Analyst or SQL Analyst uses to answer real business questions about a lending portfolio.

- **Author:** Akash Kumar
- **Role Focus:** Data Analyst / SQL Analyst Portfolio Project
- **Database Engine:** PostgreSQL
- **Total Queries:** 80

---

## Objective

The goal of this project is to simulate the kind of analysis a bank or NBFC (Non-Banking Financial Company) risk and lending team would perform on its loan book, covering:

- Portfolio composition and loan distribution
- Customer creditworthiness and risk segmentation
- Regional (city/state) lending and overdue patterns
- Loan approval, disbursement, and repayment performance
- Time-based trends in applications, approvals, and disbursements

---

## Dataset Structure

All queries run against a single table named `LOAN`, which includes (based on the columns referenced across the queries):

| Column | Description |
|---|---|
| `CUSTOMER_ID` | Unique identifier for each customer |
| `CUSTOMER_NAME` | Name of the customer |
| `CITY`, `STATE` | Customer's geographic location |
| `AGE`, `EMPLOYMENT_TYPE`, `ANNUAL_INCOME` | Customer demographic and income details |
| `LOAN_ID` | Unique identifier for each loan |
| `LOAN_TYPE` | Type of loan (e.g., Personal, Home, Auto) |
| `LOAN_AMOUNT` | Principal loan amount requested/disbursed |
| `INTEREST_RATE` | Interest rate applied to the loan |
| `CREDIT_SCORE` | Customer's credit score |
| `LOAN_STATUS` | Current status (Approved, Disbursed, Rejected, Closed, etc.) |
| `PAYMENT_STATUS` | Repayment status (Paid, Overdue, etc.) |
| `OUTSTANDING_AMOUNT` | Remaining unpaid loan balance |
| `OVERDUE_AMOUNT` | Amount currently past due |
| `DEFAULT_STATUS` | Whether the loan has defaulted |
| `APPLICATION_DATE`, `APPROVAL_DATE`, `DISBURSEMENT_DATE` | Key lifecycle dates for each loan |

---

## Query Categories

The 80 queries are organized progressively by complexity and analytical purpose:

| Range | Category | What It Covers |
|---|---|---|
| Q1 – Q10 | **Basic Data Retrieval & Filtering** | Selecting columns, filtering by loan type, amount, city, credit score, income range, and status |
| Q11 – Q20 | **Sorting & Pattern Matching** | `ORDER BY`, `LIMIT`, `BETWEEN`, `LIKE`/`ILIKE`, `IN`, and `NOT` conditions |
| Q21 – Q32 | **Aggregate Functions** | Totals, averages, min/max for loan amounts, interest rates, credit scores, and income |
| Q33 – Q47 | **Grouped Analysis (`GROUP BY` / `HAVING`)** | Breakdowns by loan type, city, state, employment type, and risk-based filtering of groups |
| Q48 – Q53 | **Risk Categorization & KPIs** | `CASE`-based risk segmentation, loan approval/rejection rates, overdue percentage |
| Q54 – Q60 | **Portfolio Summary Metrics** | Disbursed amount, outstanding amount, overdue amount, default customer count |
| Q61 – Q67 | **Date & Time-Based Analysis** | Year/month-wise application, approval, and disbursement trends; average time-to-approval |
| Q68 – Q76 | **Subqueries & Ranking** | Above-average comparisons, top customers, top cities, top loan types by various metrics |
| Q77 – Q80 | **Advanced Multi-Condition & Self-Join Analysis** | Combined risk conditions, loan-to-income ratio, multiple active loans, self-joins across loan records |

---

## Skills Demonstrated

- Core SQL: `SELECT`, `WHERE`, `ORDER BY`, `LIMIT`, `BETWEEN`, `LIKE`/`ILIKE`, `IN`
- Aggregate functions: `SUM`, `AVG`, `COUNT`, `MIN`, `MAX`, `ROUND`
- Grouped analysis: `GROUP BY`, `HAVING`
- Conditional logic: `CASE WHEN` for risk segmentation
- Subqueries (scalar and derived-table subqueries)
- Self-joins for identifying multi-loan customer relationships
- Date/time functions: `EXTRACT`, date arithmetic
- Business KPI calculation: approval rate, rejection rate, overdue percentage, loan-to-income ratio

---

## Highlighted Queries

A few examples of the more advanced logic used in this project:

**Risk Segmentation using `CASE`**
```sql
SELECT
  CUSTOMER_NAME,
  CREDIT_SCORE,
  CASE
    WHEN CREDIT_SCORE >= 750 THEN 'Low Risk'
    WHEN CREDIT_SCORE >= 650 THEN 'Medium Risk'
    WHEN CREDIT_SCORE >= 550 THEN 'High Risk'
    ELSE 'Very High Risk'
  END AS RISK_CATEGORY
FROM
  LOAN;
```

**Loan Approval Rate (Conditional Aggregation)**
```sql
SELECT
    COUNT(CASE WHEN LOAN_STATUS = 'Approved' THEN 1 END) AS APPROVED_LOAN_COUNT,
    COUNT(*) AS TOTAL_APPLICATION_COUNT,
    ROUND(
        (COUNT(CASE WHEN LOAN_STATUS = 'Approved' THEN 1 END) * 100.0) / COUNT(*),
        2
    ) AS LOAN_APPROVAL_RATE_PCT
FROM
    LOAN;
```

**Loan-to-Income Ratio (Derived Business Metric)**
```sql
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
```

**Self-Join to Identify Repeat Borrowers**
```sql
SELECT DISTINCT
    a.customer_id
FROM
    loan a
JOIN
    loan b ON a.customer_id = b.customer_id
WHERE
    a.loan_status = 'Closed'
    AND b.loan_status IN ('Disbursed', 'Approved');
```

**Top 5 Customers by Total Loan Amount**
```sql
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
```

---

## How to Use

1. Set up a PostgreSQL database and create a `LOAN` table matching the structure described above (or your own dataset with equivalent columns).
2. Load sample or real loan portfolio data into the table.
3. Run the queries sequentially from `finstrat_portfolio_risk_engine.sql`, or execute individual queries by section based on the category you want to explore.

---

## Author

**Akash Kumar**
<br>
Aspiring Data Analyst / SQL Analyst

- 📧 Email: [hire.akashk@gmail.com](mailto:hire.akashk@gmail.com)
- 🔗 LinkedIn: [linkedin.com/in/akashkumar-56398241a](https://www.linkedin.com/in/akashkumar-56398241a)
 
