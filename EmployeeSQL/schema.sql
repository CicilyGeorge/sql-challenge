DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS titles;
DROP TABLE IF EXISTS departments;


CREATE TABLE departments (
  dept_no VARCHAR(5) PRIMARY KEY,
  dept_name VARCHAR(50) NOT NULL
);

CREATE TABLE titles (
  title_id VARCHAR(5) PRIMARY KEY,
  title character varying(50) NOT NULL
);

CREATE TABLE employees (
  emp_no BIGINT PRIMARY KEY,
  emp_title_id VARCHAR(5) REFERENCES titles (title_id),
  birth_date DATE NOT NULL,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  sex CHAR(1) NOT NULL,
  hire_date DATE NOT NULL
);
ALTER DATABASE employee_db SET datestyle TO 'ISO, MDY';

CREATE TABLE salaries (
    emp_no BIGINT PRIMARY KEY,
    salary BIGINT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees
);

CREATE TABLE dept_manager (
  dept_no VARCHAR(5) REFERENCES departments,
  emp_no BIGINT REFERENCES employees,
  PRIMARY KEY (dept_no, emp_no)
);

CREATE TABLE dept_emp (
  emp_no BIGINT REFERENCES employees,
  dept_no VARCHAR(5) REFERENCES departments,
  PRIMARY KEY (emp_no, dept_no)
);

