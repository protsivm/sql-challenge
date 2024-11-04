-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/Jlz6vB
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Departments Table
CREATE TABLE IF NOT EXISTS "departments" (
    "dept_no" VARCHAR NOT NULL,
    "dept_name" VARCHAR NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY ("dept_no")
);

-- Employees Table
CREATE TABLE IF NOT EXISTS "employees" (
    "emp_no" INTEGER NOT NULL,
    "emp_title_id" VARCHAR NOT NULL,
    "birth_date" DATE NOT NULL,
    "first_name" VARCHAR NOT NULL,
    "last_name" VARCHAR NOT NULL,
    "sex" CHAR(1) NOT NULL,
    "hire_date" DATE NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY ("emp_no")
);

-- Titles Table
CREATE TABLE IF NOT EXISTS "titles" (
    "emp_title_id" VARCHAR NOT NULL,
    "title" VARCHAR NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY ("emp_title_id")
);

-- Salaries Table
CREATE TABLE IF NOT EXISTS "salaries" (
    "emp_no" INTEGER NOT NULL,
    "salary" INTEGER NOT NULL,
    CONSTRAINT "pk_salaries" PRIMARY KEY ("emp_no"),
    CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no") REFERENCES "employees" ("emp_no")
);

-- Dept_Emp Table
CREATE TABLE IF NOT EXISTS "dept_emp" (
    "emp_no" INTEGER NOT NULL,
    "dept_no" VARCHAR NOT NULL,
    CONSTRAINT "pk_dept_emp" PRIMARY KEY ("emp_no", "dept_no"),
    CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no") REFERENCES "departments" ("dept_no"),
    CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no") REFERENCES "employees" ("emp_no")
);

-- Dept_Manager Table
CREATE TABLE IF NOT EXISTS "dept_manager" (
    "dept_no" VARCHAR NOT NULL,
    "emp_no" INTEGER NOT NULL,
    CONSTRAINT "pk_dept_manager" PRIMARY KEY ("dept_no", "emp_no"),
    CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no") REFERENCES "departments" ("dept_no"),
    CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no") REFERENCES "employees" ("emp_no")
);
