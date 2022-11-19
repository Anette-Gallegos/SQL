-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-11-2022 a las 22:49:36
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `recursosh`
--

create database recursosH;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `countries`
--

CREATE TABLE countries (
  Country_id int(5) NOT NULL,
  Country_name varchar(30) DEFAULT NULL,
  Region_id int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `countries`
--

INSERT INTO countries (Country_id, Country_name, Region_id) VALUES
(34540, 'PaisB', 78932),
(80260, 'PaisC', 12345),
(94653, 'PaisA', 12348);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departments`
--

CREATE TABLE departments (
  Department_id int(5) NOT NULL,
  Department_name varchar(11) DEFAULT NULL,
  Manager_id varchar(11) NOT NULL,
  Location_id int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `departments`
--

INSERT INTO departments (Department_id, Department_name, Manager_id,Location_id) VALUES
(10473, 'Departament', '12365204789', 78945),
(60503, 'Departament', '3214569875', 20130),
(65002, 'Departamane', '52136478965', 92016);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `employees`
--

CREATE TABLE employees (
  Employee_id int(5) NOT NULL,
  First_name varchar(11) NOT NULL,
  Last_name varchar(11) NOT NULL,
  email varchar(11) NOT NULL,
  Phone_number varchar(9) DEFAULT NULL,
  Hire_date date DEFAULT NULL,
  Job_id int(5) NOT NULL,
  Salary int(5) DEFAULT NULL,
  Comission_pct int(5) DEFAULT NULL,
  Manager_id int(5) DEFAULT NULL,
  Department_id int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `employees`
--

INSERT INTO employees (Employee_id, First_name, Last_name, email, Phone_number,
Hire_date, Job_id, Salary, Comission_pct, Manager_id, Department_id) VALUES
(19300, 'Zolia', 'Casa', 'C@gmeil.com', '987654321', '2022-11-02', 71113, 43, 54, 12350, 65002),
(63820, 'Hanna', 'Banana', 'B@gmeil.com', '102030789', '2022-11-16', 30203, 23, 45612, 34343, 60503),
(66220, 'Garbriel', 'Perez', 'G@gmeil.com', '123456789', '2022-11-05', 70008, 34, 10, 33000, 10473);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jobs`
--

CREATE TABLE jobs (
  Job_id int(5) NOT NULL,
  Job_title varchar(15) DEFAULT NULL,
  Min_salary int(3) DEFAULT NULL,
  Max_salary int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `jobs`
--

INSERT INTO jobs (Job_id, Job_title, Min_salary, Max_salary) VALUES
(30203, 'Trabajo1', 1, 103),
(70008, 'Trabajo3', 2, 123),
(71113, 'Trabajo2', 100, 324);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `job_history`
--

CREATE TABLE job_history (
  Employee_id int(5) NOT NULL,
  Start_date date DEFAULT NULL,
  End_date date DEFAULT NULL,
  Job_id int(5) NOT NULL,
  Department_id int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `job_history`
--

INSERT INTO job_history (Employee_id, Start_date, End_date, Job_id, Department_id) VALUES
(66220, '2022-11-01', '2022-11-26', 70008, 60503),
(19300, '2022-11-01', '2022-11-30', 71113, 10473),
(63820, '2022-11-01', '2022-11-30', 30203, 65002);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `locations`
--

CREATE TABLE locations (
  Location_id int(5) NOT NULL,
  Street_address varchar(30) DEFAULT NULL,
  Postal_code int(9) DEFAULT NULL,
  City varchar(30) DEFAULT NULL,
  State_province varchar(30) DEFAULT NULL,
  Country_id int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `locations`
--

INSERT INTO locations (Location_id, Street_address, Postal_code, City, State_province, Country_id) VALUES
(20130, 'Avenida1', 123452789, 'Ciudad7', 'Provincia3', 34540),
(78945, 'Avenida A', 123456785, 'CiudadA', 'ProvinciaC', 80260),
(92016, 'Avenida6', 123506789, 'Ciudad6', 'Provincia5', 94653);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `regions`
--

CREATE TABLE regions (
  Region_id int(5) NOT NULL,
  Region_name varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `regions`
--

INSERT INTO regions (Region_id, Region_name) VALUES
(12345, 'RegionA'),
(12348, 'RegionB'),
(78932, 'RegionC');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `countries`
--
ALTER TABLE countries
  ADD PRIMARY KEY (Country_id),
  ADD KEY FK_COUNTRIES_REGIONS (Region_id);

--
-- Indices de la tabla `departments`
--
ALTER TABLE departments
  ADD PRIMARY KEY (Department_id),
  ADD KEY FK_DEPARTMENTS_LOCATIONS (Location_id);

--
-- Indices de la tabla `employees`
--
ALTER TABLE employees
  ADD PRIMARY KEY (Employee_id),
  ADD KEY FK_EMPLOYEES_JOBS (Job_id),
  ADD KEY FK_EMPLOYEES_DEPARTMENTS (Department_id);

--
-- Indices de la tabla `jobs`
--
ALTER TABLE jobs
  ADD PRIMARY KEY (Job_id);

--
-- Indices de la tabla `job_history`
--
ALTER TABLE job_history
  ADD KEY FK_JOB_JOB_HISTORY (Job_id),
  ADD KEY FK_JOB_DEPARTMENTS (Department_id),
  ADD KEY FK_JOB_EMPLOYEE (Employee_id);

--
-- Indices de la tabla `locations`
--
ALTER TABLE locations
  ADD PRIMARY KEY (Location_id),
  ADD KEY FK_LOCATIONS_COUNTRY (Country_id);

--
-- Indices de la tabla `regions`
--
ALTER TABLE regions
  ADD PRIMARY KEY (Region_id);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `countries`
--
ALTER TABLE countries
  ADD CONSTRAINT FK_COUNTRIES_REGIONS FOREIGN KEY (Region_id) REFERENCES regions (Region_id)
 ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `departments`
--
ALTER TABLE departments
  ADD CONSTRAINT FK_DEPARTMENTS_LOCATIONS FOREIGN KEY (Location_id) REFERENCES locations (Location_id)
 ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `employees`
--
ALTER TABLE employees
  ADD CONSTRAINT FK_EMPLOYEES_DEPARTMENTS FOREIGN KEY (Department_id) REFERENCES departments (Department_id)
  ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT FK_EMPLOYEES_JOBS FOREIGN KEY (Job_id) REFERENCES jobs (Job_id) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `job_history`
--
ALTER TABLE job_history
  ADD CONSTRAINT FK_JOB_DEPARTMENTS FOREIGN KEY (Department_id) REFERENCES departments (Department_id)
  ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT FK_JOB_EMPLOYEE FOREIGN KEY (Employee_id) REFERENCES employees (Employee_id)
  ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT FK_JOB_JOB_HISTORY FOREIGN KEY (Job_id) REFERENCES jobs (Job_id) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `locations`
--
ALTER TABLE locations
  ADD CONSTRAINT FK_LOCATIONS_COUNTRY FOREIGN KEY (Country_id) REFERENCES countries (Country_id)
 ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
