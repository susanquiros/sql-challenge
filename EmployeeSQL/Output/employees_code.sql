-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

---drop if table exists
DROP TABLE IF EXISTS "departments";
DROP TABLE IF EXISTS "dept_employee";
DROP TABLE IF EXISTS  "manager";
DROP TABLE IF EXISTS  "employees";
DROP TABLE IF EXISTS  "salaries";
DROP TABLE IF EXISTS   "titles";

CREATE TABLE "departments" (
    "dept_no" VARCHAR NOT NULL,
    "dept_name" VARCHAR NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "dept_employee" (
    "id" serial NOT NULL,
    "empl_no" INT NOT NULL,
    "dept_no" VARCHAR NOT NULL,
    CONSTRAINT "pk_dept_employee" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "manager" (
    "id" serial NOT NULL,
    "dept_no" VARCHAR NOT NULL,
    "empl_no" INT NOT NULL,
    CONSTRAINT "pk_manager" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "employees" (
    "empl_no" INT NOT NULL,
    "empl_title_id" VARCHAR NOT NULL,
    "birth_date" DATE NOT NULL,
    "first_name" VARCHAR NOT NULL,
    "last_name" VARCHAR   NOT NULL,
    "sex" VARCHAR NOT NULL,
    "hire_date" DATE NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "empl_no"
     )
);

CREATE TABLE "salaries" (
    "id" serial NOT NULL,
    "empl_no" INT NOT NULL,
    "salary" INT NOT NULL,
    CONSTRAINT "pk_salaries" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "titles" (
    "tittle_id" VARCHAR NOT NULL,
    "title" VARCHAR NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "tittle_id"
     )
);

--foreign Keys
ALTER TABLE "dept_employee" ADD CONSTRAINT "fk_dept_employee_empl_no" FOREIGN KEY("empl_no")
REFERENCES "employees" ("empl_no");

ALTER TABLE "dept_employee" ADD CONSTRAINT "fk_dept_employee_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "manager" ADD CONSTRAINT "fk_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_empl_no" FOREIGN KEY("empl_no")
REFERENCES "manager" ("empl_no");

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_empl_title_id" FOREIGN KEY("empl_title_id")
REFERENCES "titles" ("tittle_id");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_empl_no" FOREIGN KEY("empl_no")
REFERENCES "employees" ("empl_no");

