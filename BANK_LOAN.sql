create database bank_loan;

use bank_loan;

#stastistics on loan amount

SELECT 
  YEAR(STR_TO_DATE(yr, '%m/%d/%Y')) AS year_val,
  SUM(loan_amnt) AS total_loan,
  AVG(loan_amnt) AS average_loan,
  MAX(loan_amnt) AS max_loan,
  MIN(loan_amnt) AS min_loan
FROM finance_1
GROUP BY YEAR(STR_TO_DATE(yr, '%m/%d/%Y'));

# GRADE WISE REVOL_BAL

SELECT 
    finance_1.grade,
    SUM(finance_2.revol_bal) AS total_revol_bal
FROM finance_1
INNER JOIN finance_2 
    ON finance_1.id = finance_2.id
GROUP BY finance_1.grade
ORDER BY finance_1.grade;

# SUB_GRADE_WISE_REVOL_BALANCE

SELECT 
    finance_1.sub_grade,
    SUM(finance_2.revol_bal) AS total_revol_bal
FROM finance_1
INNER JOIN finance_2 
    ON finance_1.id = finance_2.id
GROUP BY finance_1.sub_grade
ORDER BY finance_1.sub_grade;

# VERIFIED STATUS AND NON VERIFIED STATUS TOTAL PAYMENT

SELECT 
    finance_1.verification_status,
    SUM(finance_2.total_pymnt) AS total_total_payment
FROM finance_1
INNER JOIN finance_2 
    ON finance_1.id = finance_2.id
GROUP BY finance_1.verification_status
ORDER BY finance_1.verification_status;

# STATE_WISE_LOAN_STATUS
 
SELECT 
    addr_state,
    loan_status,
    COUNT(*) AS total_state
FROM finance_1
GROUP BY addr_state, loan_status
ORDER BY addr_state, loan_status;

# MONTH_WISE_LOAN_STATUS

SELECT 
    f2.last_pymnt_d AS payment_month,
    f1.loan_status,
    COUNT(*) AS status_count
FROM Finance_1 f1
JOIN Finance_2 f2
    ON f1.id = f2.id
GROUP BY 
    f2.last_pymnt_d,
    f1.loan_status
ORDER BY 
    f2.last_pymnt_d,
    f1.loan_status;

# HOMEOWNERSHIP V/S LAST_PAYMENT_DAY

SELECT 
    f2.last_pymnt_d AS payment_month,
    f1.home_ownership,
    COUNT(*) AS loan_count
FROM Finance_1 f1
JOIN Finance_2 f2
    ON f1.id = f2.id
GROUP BY 
    f2.last_pymnt_d,
    f1.home_ownership
ORDER BY 
    f2.last_pymnt_d,
    f1.home_ownership;
