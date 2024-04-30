-- Crear la tabla Departments
CREATE TABLE Departments (
    dept_no VARCHAR(5) PRIMARY KEY,
    dept_name VARCHAR(50)
);

-- Crear la tabla Employees
CREATE TABLE Employees (
    emp_no INT PRIMARY KEY,
    emp_title_id VARCHAR(5) REFERENCES Titles(title_id),
    birth_date DATE,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    sex CHAR(1),
    hire_date DATE
);

-- Crear la tabla Titles
CREATE TABLE Titles (
    title_id VARCHAR(5) PRIMARY KEY,
    title VARCHAR(50)
);

-- Crear la tabla Salaries
CREATE TABLE Salaries (
    emp_no INT REFERENCES Employees(emp_no),
    salary INT
);

-- Crear la tabla Dept_Employees
CREATE TABLE Dept_Employees (
    emp_no INT REFERENCES Employees(emp_no),
    dept_no VARCHAR(5) REFERENCES Departments(dept_no),
    PRIMARY KEY (emp_no, dept_no)
);

-- Crear la tabla Dept_Managers
CREATE TABLE Dept_Managers (
	dept_no VARCHAR(5) REFERENCES Departments(dept_no),
    emp_no INT REFERENCES Employees(emp_no),
    PRIMARY KEY (emp_no, dept_no)
);


-- Creación de la tabla 'Dept_Managers'
CREATE TABLE IF NOT EXISTS Dept_Managers (
  emp_no int REFERENCES Employees(emp_no),
  dept_no varchar(5) REFERENCES Departments(dept_no),
  CONSTRAINT pk_dept_manager PRIMARY KEY (emp_no, dept_no)
);

