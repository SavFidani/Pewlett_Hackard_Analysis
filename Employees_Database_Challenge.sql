-- Deliverable #1

SELECT emp.emp_no,
emp.first_name,
emp.last_name,
titles.title,
titles.from_date,
titles.to_date
INTO retirement_titles
FROM employees as emp
JOIN titles
ON emp.emp_no = titles.emp_no
WHERE (emp.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no ;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title

INTO Unique_Titles
FROM retirement_titles
WHERE (retirement_titles.to_date = '9999-01-01')
ORDER BY emp_no, to_date DESC;

-- Count of retiring by job title
SELECT COUNT(ut.emp_no), ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY ut.title
ORDER BY count DESC;

-- Deliverable #2
SELECT DISTINCT ON (emp_no) emp.emp_no,
emp.first_name,
emp.last_name,
emp.birth_date,
de.from_date,
de.to_date,
titles.title
INTO mentorship_eligibility
FROM employees as emp
INNER JOIN dept_emp as de
ON emp.emp_no = de.emp_no
INNER JOIN titles
ON emp.emp_no = titles.emp_no
WHERE (de.to_date = '9999-01-01')
AND (emp.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY emp_no ;





