

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `azure_company`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `departament`
--

CREATE TABLE `departament` (
  `Dname` varchar(15) NOT NULL,
  `Dnumber` int(11) NOT NULL,
  `Mgr_ssn` char(9) NOT NULL,
  `Mgr_start_date` date DEFAULT NULL,
  `Dept_create_date` date DEFAULT NULL
) ;

--
-- Despejando dados para a tabela `departament`
--

INSERT INTO `departament` (`Dname`, `Dnumber`, `Mgr_ssn`, `Mgr_start_date`, `Dept_create_date`) VALUES
('Headquarters', 1, '888665555', '1981-06-19', '1980-06-19'),
('Administration', 4, '987654321', '1995-01-01', '1994-01-01'),
('Research', 5, '333445555', '1988-05-22', '1986-05-22');

-- --------------------------------------------------------

--
-- Estrutura para tabela `dependent`
--

CREATE TABLE `dependent` (
  `Essn` char(9) NOT NULL,
  `Dependent_name` varchar(15) NOT NULL,
  `Sex` char(1) DEFAULT NULL,
  `Bdate` date DEFAULT NULL,
  `Relationship` varchar(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `dependent`
--

INSERT INTO `dependent` (`Essn`, `Dependent_name`, `Sex`, `Bdate`, `Relationship`) VALUES
('123456789', 'Alice', 'F', '1988-12-30', 'Daughter'),
('123456789', 'Elizabeth', 'F', '1967-05-05', 'Spouse'),
('123456789', 'Michael', 'M', '1988-01-04', 'Son'),
('333445555', 'Alice', 'F', '1986-04-05', 'Daughter'),
('333445555', 'Joy', 'F', '1958-05-03', 'Spouse'),
('333445555', 'Theodore', 'M', '1983-10-25', 'Son'),
('987654321', 'Abner', 'M', '1942-02-28', 'Spouse');

-- --------------------------------------------------------

--
-- Estrutura para tabela `dept_locations`
--

CREATE TABLE `dept_locations` (
  `Dnumber` int(11) NOT NULL,
  `Dlocation` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `dept_locations`
--

INSERT INTO `dept_locations` (`Dnumber`, `Dlocation`) VALUES
(1, 'Houston'),
(4, 'Stafford'),
(5, 'Bellaire'),
(5, 'Houston'),
(5, 'Sugarland');

-- --------------------------------------------------------

--
-- Estrutura para tabela `employee`
--

CREATE TABLE `employee` (
  `Fname` varchar(15) NOT NULL,
  `Minit` char(1) DEFAULT NULL,
  `Lname` varchar(15) NOT NULL,
  `Ssn` char(9) NOT NULL,
  `Bdate` date DEFAULT NULL,
  `Address` varchar(30) DEFAULT NULL,
  `Sex` char(1) DEFAULT NULL,
  `Salary` decimal(10,2) DEFAULT NULL,
  `Super_ssn` char(9) DEFAULT NULL,
  `Dno` int(11) NOT NULL
) ;

--
-- Despejando dados para a tabela `employee`
--

INSERT INTO `employee` (`Fname`, `Minit`, `Lname`, `Ssn`, `Bdate`, `Address`, `Sex`, `Salary`, `Super_ssn`, `Dno`) VALUES
('John', 'B', 'Smith', '123456789', '1965-01-09', '731 Fondren, Houston, TX', 'M', 30000.00, '333445555', 5),
('Franklin', 'T', 'Wong', '333445555', '1955-12-08', '638 Voss, Houston, TX', 'M', 40000.00, '888665555', 5),
('Joyce', 'A', 'English', '453453453', '1972-07-31', '5631 Rice, Houston, TX', 'F', 25000.00, '333445555', 5),
('Ramesh', 'K', 'Narayan', '666884444', '1962-09-15', '975 Fire Oak, Humble, TX', 'M', 38000.00, '333445555', 5),
('James', 'E', 'Borg', '888665555', '1937-11-10', '450 Stone, Houston, TX', 'M', 55000.00, NULL, 1),
('Jennifer', 'S', 'Wallace', '987654321', '1941-06-20', '291 Berry, Bellaire, TX', 'F', 43000.00, '888665555', 4),
('Ahmad', 'V', 'Jabbar', '987987987', '1969-03-29', '980 Dallas, Houston, TX', 'M', 25000.00, '987654321', 4),
('Alicia', 'J', 'Zelaya', '999887777', '1968-01-19', '3321 Castle, Spring, TX', 'F', 25000.00, '987654321', 4);

-- --------------------------------------------------------

--
-- Estrutura para tabela `project`
--

CREATE TABLE `project` (
  `Pname` varchar(15) NOT NULL,
  `Pnumber` int(11) NOT NULL,
  `Plocation` varchar(15) DEFAULT NULL,
  `Dnum` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `project`
--

INSERT INTO `project` (`Pname`, `Pnumber`, `Plocation`, `Dnum`) VALUES
('ProductX', 1, 'Bellaire', 5),
('ProductY', 2, 'Sugarland', 5),
('ProductZ', 3, 'Houston', 5),
('Computerization', 10, 'Stafford', 4),
('Reorganization', 20, 'Houston', 1),
('Newbenefits', 30, 'Stafford', 4);

-- --------------------------------------------------------

--
-- Estrutura para tabela `works_on`
--

CREATE TABLE `works_on` (
  `Essn` char(9) NOT NULL,
  `Pno` int(11) NOT NULL,
  `Hours` decimal(3,1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `works_on`
--

INSERT INTO `works_on` (`Essn`, `Pno`, `Hours`) VALUES
('123456789', 1, 32.5),
('123456789', 2, 7.5),
('333445555', 2, 10.0),
('333445555', 3, 10.0),
('333445555', 10, 10.0),
('333445555', 20, 10.0),
('453453453', 1, 20.0),
('453453453', 2, 20.0),
('666884444', 3, 40.0),
('888665555', 20, 0.0),
('987654321', 20, 15.0),
('987654321', 30, 20.0),
('987987987', 10, 35.0),
('987987987', 30, 5.0),
('999887777', 10, 10.0),
('999887777', 30, 30.0);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `departament`
--
ALTER TABLE `departament`
  ADD PRIMARY KEY (`Dnumber`),
  ADD UNIQUE KEY `unique_name_dept` (`Dname`),
  ADD KEY `Mgr_ssn` (`Mgr_ssn`);

--
-- Índices de tabela `dependent`
--
ALTER TABLE `dependent`
  ADD PRIMARY KEY (`Essn`,`Dependent_name`);

--
-- Índices de tabela `dept_locations`
--
ALTER TABLE `dept_locations`
  ADD PRIMARY KEY (`Dnumber`,`Dlocation`);

--
-- Índices de tabela `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`Ssn`),
  ADD KEY `Super_ssn` (`Super_ssn`);

--
-- Índices de tabela `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`Pnumber`),
  ADD UNIQUE KEY `unique_project` (`Pname`),
  ADD KEY `Dnum` (`Dnum`);

--
-- Índices de tabela `works_on`
--
ALTER TABLE `works_on`
  ADD PRIMARY KEY (`Essn`,`Pno`),
  ADD KEY `Pno` (`Pno`);

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `departament`
--
ALTER TABLE `departament`
  ADD CONSTRAINT `departament_ibfk_1` FOREIGN KEY (`Mgr_ssn`) REFERENCES `employee` (`Ssn`) ON UPDATE CASCADE;

--
-- Restrições para tabelas `dependent`
--
ALTER TABLE `dependent`
  ADD CONSTRAINT `dependent_ibfk_1` FOREIGN KEY (`Essn`) REFERENCES `employee` (`Ssn`);

--
-- Restrições para tabelas `dept_locations`
--
ALTER TABLE `dept_locations`
  ADD CONSTRAINT `dept_locations_ibfk_1` FOREIGN KEY (`Dnumber`) REFERENCES `departament` (`Dnumber`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`Super_ssn`) REFERENCES `employee` (`Ssn`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Restrições para tabelas `project`
--
ALTER TABLE `project`
  ADD CONSTRAINT `project_ibfk_1` FOREIGN KEY (`Dnum`) REFERENCES `departament` (`Dnumber`) ON UPDATE CASCADE;

--
-- Restrições para tabelas `works_on`
--
ALTER TABLE `works_on`
  ADD CONSTRAINT `works_on_ibfk_1` FOREIGN KEY (`Essn`) REFERENCES `employee` (`Ssn`),
  ADD CONSTRAINT `works_on_ibfk_2` FOREIGN KEY (`Pno`) REFERENCES `project` (`Pnumber`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
