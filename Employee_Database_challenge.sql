-- Deliverable 1
-- The Number of Retiring Employees by Title.

-- Create table from Employees and Titles with birth
-- date between 1952 and 1955.
-- DROP TABLE retirement_titles;
SELECT emp.emp_no,
       emp.first_name,
       emp.last_name,
       til.title,
       til.from_date,
       til.to_date
INTO retirement_titles
FROM employees as emp 
     LEFT JOIN
     titles as til
ON emp.emp_no = til.emp_no
WHERE emp.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY emp.emp_no;

SELECT * FROM retirement_titles LIMIT 10;

-- Remove dups from data
SELECT DISTINCT ON (emp_no) 
       emp_no,
       first_name,
       last_name,
       title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;

SELECT * FROM unique_titles LIMIT 10;

-- Count number of employees by the most recent job title who
-- are about to retire.
SELECT COUNT(title), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT(title) DESC;

SELECT * FROM retiring_titles;

-- Deliverable 2
-- The Employees Eligible for the Mentorship Program.
SELECT DISTINCT ON (emp.emp_no) 
       emp.emp_no,
       emp.first_name,
       emp.last_name,
       emp.birth_date,
       de.from_date,
       de.to_date,
       til.title
INTO mentorship_eligibilty
FROM employees as emp 

     LEFT JOIN
     dept_emp as de
ON emp.emp_no = de.emp_no

     LEFT JOIN
     titles til
ON emp.emp_no = til.emp_no

WHERE (emp.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
      AND (de.to_date = '9999-01-01')
ORDER BY emp.emp_no;

SELECT * FROM mentorship_eligibilty limit 10;
