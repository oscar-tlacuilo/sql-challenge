-- Consulta para listar la información de los empleados
SELECT E.emp_no, E.last_name, E.first_name, E.sex, S.salary
FROM Employees E
INNER JOIN Salaries S ON E.emp_no = S.emp_no;

-- Consulta para listar los empleados contratados en 1986
SELECT first_name, last_name, hire_date
FROM Employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

-- Consulta para listar los gerentes de cada departamento junto con la información del departamento y del empleado
SELECT DM.dept_no, D.dept_name, DM.emp_no, E.last_name, E.first_name
FROM Dept_Managers DM
INNER JOIN Departments D ON DM.dept_no = D.dept_no
INNER JOIN Employees E ON DM.emp_no = E.emp_no;

-- Consulta para listar el número de departamento para cada empleado junto con su número de empleado, apellido, nombre y nombre del departamento
SELECT DE.emp_no, E.last_name, E.first_name, D.dept_name
FROM Dept_Employees DE
INNER JOIN Employees E ON DE.emp_no = E.emp_no
INNER JOIN Departments D ON DE.dept_no = D.dept_no;

-- Consulta para listar el nombre y sexo de los empleados cuyo nombre es "Hercules" y su apellido comienza con la letra "B"
SELECT first_name, last_name, sex
FROM Employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- Consulta para listar los empleados en el departamento de ventas
SELECT E.emp_no, E.last_name, E.first_name
FROM Employees E
INNER JOIN Dept_Employees DE ON E.emp_no = DE.emp_no
INNER JOIN Departments D ON DE.dept_no = D.dept_no
WHERE D.dept_name = 'Sales';

-- Consulta para listar los empleados en los departamentos de ventas y desarrollo
SELECT E.emp_no, E.last_name, E.first_name, D.dept_name
FROM Employees E
INNER JOIN Dept_Employees DE ON E.emp_no = DE.emp_no
INNER JOIN Departments D ON DE.dept_no = D.dept_no
WHERE D.dept_name IN ('Sales', 'Development');

-- Consulta para listar el recuento de frecuencia de todos los apellidos de los empleados
SELECT last_name, COUNT(*) AS frequency
FROM Employees
GROUP BY last_name
ORDER BY frequency DESC;