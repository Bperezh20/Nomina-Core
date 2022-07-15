-- -----------------------------------------------------
-- Schema nomina
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS nomina ;

-- -----------------------------------------------------
-- Schema nomina
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS nomina DEFAULT CHARACTER SET utf8 ;
USE nomina ;

-- -----------------------------------------------------
-- Table nomina.Rol
-- -----------------------------------------------------
DROP TABLE IF EXISTS nomina.Rol ;

CREATE TABLE IF NOT EXISTS nomina.Rol (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  PRIMARY KEY (id))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table nomina.Departament
-- -----------------------------------------------------
DROP TABLE IF EXISTS nomina.Departament ;

CREATE TABLE IF NOT EXISTS nomina.Departament (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  description MEDIUMTEXT NULL,
  max_employees INT NOT NULL,
  active INT NOT NULL,
  PRIMARY KEY (id))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table nomina.Position
-- -----------------------------------------------------
DROP TABLE IF EXISTS nomina.Position ;

CREATE TABLE IF NOT EXISTS nomina.Position (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  report_to INT NULL,
  departament_id INT NOT NULL,
  description MEDIUMTEXT,
  PRIMARY KEY (id),
  INDEX fk_Position_Position1_idx (report_to ASC),
  INDEX fk_Position_departament1_idx (departament_id ASC),
  CONSTRAINT fk_Position_Position1
    FOREIGN KEY (report_to)
    REFERENCES nomina.Position (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Position_departament1
    FOREIGN KEY (departament_id)
    REFERENCES nomina.Departament (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table nomina.Working_Day
-- -----------------------------------------------------
DROP TABLE IF EXISTS nomina.Working_Day ;

CREATE TABLE IF NOT EXISTS nomina.Working_Day (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(45) NOT NULL,
  lunch_time TIME NOT NULL,
  PRIMARY KEY (id))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table nomina.Employee
-- -----------------------------------------------------
DROP TABLE IF EXISTS nomina.Employee ;

CREATE TABLE IF NOT EXISTS nomina.Employee (
  id INT NOT NULL AUTO_INCREMENT,
  dpi VARCHAR(50) NOT NULL,
  first_name VARCHAR(50) NOT NULL,
  second_name VARCHAR(50) NULL,
  first_last_name VARCHAR(50) NOT NULL,
  second_last_name VARCHAR(50) NULL,
  birthday DATETIME NOT NULL,
  active INT NOT NULL,
  email VARCHAR(100) NULL,
  no_account VARCHAR(50) NOT NULL,
  account_type VARCHAR(45) NOT NULL,
  type_currency VARCHAR(20) NOT NULL,
  phone_number VARCHAR(25) NOT NULL,
  phone_number_second VARCHAR(25) NOT NULL,
  position_id INT NOT NULL,
  base_salary DECIMAL(9,2) NOT NULL,
  working_day_id INT NOT NULL,
  created_at DATETIME NOT NULL,
  created_by INT NOT NULL,
  PRIMARY KEY (id),
  INDEX fk_Employee_Position1_idx (position_id ASC),
  INDEX fk_Employee_working_day1_idx (working_day_id ASC),
  CONSTRAINT fk_Employee_Position1
    FOREIGN KEY (position_id)
    REFERENCES nomina.Position (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Employee_working_day1
    FOREIGN KEY (working_day_id)
    REFERENCES nomina.Working_Day (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table nomina.User
-- -----------------------------------------------------
DROP TABLE IF EXISTS nomina.User ;

CREATE TABLE IF NOT EXISTS nomina.User (
  id INT NOT NULL AUTO_INCREMENT,
  employee_id INT NOT NULL,
  user_name VARCHAR(50) NOT NULL,
  rol_id INT NOT NULL,
  password VARCHAR(150) NOT NULL,
  change_password_date DATETIME NOT NULL,
  PRIMARY KEY (id),
  INDEX fk_User_Rol_idx (rol_id ASC),
  INDEX fk_User_Employee1_idx (employee_id ASC),
  CONSTRAINT fk_User_Rol
    FOREIGN KEY (rol_id)
    REFERENCES nomina.Rol (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_User_Employee1
    FOREIGN KEY (employee_id)
    REFERENCES nomina.Employee (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table nomina.Mark_type
-- -----------------------------------------------------
DROP TABLE IF EXISTS nomina.Mark_type ;

CREATE TABLE IF NOT EXISTS nomina.Mark_type (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  active INT DEFAULT 1,
  PRIMARY KEY (id))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table nomina.mark
-- -----------------------------------------------------
DROP TABLE IF EXISTS nomina.mark ;

CREATE TABLE IF NOT EXISTS nomina.mark (
  id INT NOT NULL AUTO_INCREMENT,
  employee_id INT NOT NULL,
  mark_type_id INT NOT NULL,
  checkin DATETIME NOT NULL,
  checkout DATETIME NULL,
  PRIMARY KEY (id),
  INDEX fk_mark_Mark_type1_idx (mark_type_id ASC),
  INDEX fk_mark_Employee1_idx (employee_id ASC),
  CONSTRAINT fk_mark_Mark_type1
    FOREIGN KEY (mark_type_id)
    REFERENCES nomina.Mark_type (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_mark_Employee1
    FOREIGN KEY (employee_id)
    REFERENCES nomina.Employee (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table nomina.Discount_Type
-- -----------------------------------------------------
DROP TABLE IF EXISTS nomina.Discount_Type ;

CREATE TABLE IF NOT EXISTS nomina.Discount_Type (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  max_pay_qty INT NOT NULL,
  min_pay_qty INT NOT NULL,
  interest_percentage DECIMAL(5,2) NOT NULL,
  interest_late_pay DECIMAL(5,2) NOT NULL,
  PRIMARY KEY (id))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table nomina.Discount
-- -----------------------------------------------------
DROP TABLE IF EXISTS nomina.Discount ;

CREATE TABLE IF NOT EXISTS nomina.Discount (
  id INT NOT NULL AUTO_INCREMENT,
  discount_type_id INT NOT NULL,
  discount_date DATETIME NOT NULL,
  employee_id INT NOT NULL,
  to_pay DECIMAL(12,2) NOT NULL,
  paid DECIMAL(12,2) NULL,
  status ENUM('pendiente', 'pagado', 'cancelado') NULL,
  INDEX fk_Discount_Discount_Type1_idx (discount_type_id ASC),
  PRIMARY KEY (id),
  INDEX fk_Discount_Employee1_idx (employee_id ASC),
  CONSTRAINT fk_Discount_Discount_Type1
    FOREIGN KEY (discount_type_id)
    REFERENCES nomina.Discount_Type (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Discount_Employee1
    FOREIGN KEY (employee_id)
    REFERENCES nomina.Employee (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table nomina.Company
-- -----------------------------------------------------
DROP TABLE IF EXISTS nomina.Company ;

CREATE TABLE IF NOT EXISTS nomina.Company (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  nit VARCHAR(20) NOT NULL,
  manager_dpi VARCHAR(20) NOT NULL,
  address VARCHAR(200) NOT NULL,
  phone_number VARCHAR(30) NOT NULL,
  PRIMARY KEY (id))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table nomina.Company_Account
-- -----------------------------------------------------
DROP TABLE IF EXISTS nomina.Company_Account ;

CREATE TABLE IF NOT EXISTS nomina.Company_Account (
  id INT NOT NULL AUTO_INCREMENT,
  company_id INT NOT NULL,
  bank_name VARCHAR(45) NOT NULL,
  account_type VARCHAR(45) NOT NULL,
  type_currency VARCHAR(45) NOT NULL,
  PRIMARY KEY (id),
  INDEX fk_Company_Account_Company1_idx (company_id ASC),
  CONSTRAINT fk_Company_Account_Company1
    FOREIGN KEY (company_id)
    REFERENCES nomina.Company (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table nomina.Permission_Type
-- -----------------------------------------------------
DROP TABLE IF EXISTS nomina.Permission_Type ;

CREATE TABLE IF NOT EXISTS nomina.Permission_Type (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(45) NOT NULL,
  salary_payment INT NOT NULL DEFAULT 1,
  PRIMARY KEY (id))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table nomina.Permission
-- -----------------------------------------------------
DROP TABLE IF EXISTS nomina.Permission ;

CREATE TABLE IF NOT EXISTS nomina.Permission (
  id INT NOT NULL AUTO_INCREMENT,
  employee_id INT NOT NULL,
  permission_type_id INT NOT NULL,
  init_date DATETIME NOT NULL,
  end_date DATETIME NOT NULL,
  approved INT NOT NULL DEFAULT 0,
  complete_day INT NOT NULL,
  PRIMARY KEY (id),
  INDEX fk_Permission_Permission_Type1_idx (permission_type_id ASC),
  INDEX fk_Permission_Employee1_idx (employee_id ASC),
  CONSTRAINT fk_Permission_Permission_Type1
    FOREIGN KEY (permission_type_id)
    REFERENCES nomina.Permission_Type (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Permission_Employee1
    FOREIGN KEY (employee_id)
    REFERENCES nomina.Employee (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table nomina.Working_Day_Detail
-- -----------------------------------------------------
DROP TABLE IF EXISTS nomina.Working_Day_Detail ;

CREATE TABLE IF NOT EXISTS nomina.Working_Day_Detail (
  id INT NOT NULL AUTO_INCREMENT,
  working_day_id INT NOT NULL,
  day_of_week VARCHAR(45) NOT NULL,
  init_hour TIME NOT NULL,
  end_hour TIME NOT NULL,
  daily_hour INT NOT NULL,
  lunch_hour DECIMAL(5,2) NOT NULL,
  PRIMARY KEY (id),
  INDEX fk_table1_working_day1_idx (working_day_id ASC),
  CONSTRAINT fk_table1_working_day1
    FOREIGN KEY (working_day_id)
    REFERENCES nomina.Working_Day (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
-- -----------------------------------------------------
-- Schema nomina
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS nomina ;

-- -----------------------------------------------------
-- Schema nomina
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS nomina DEFAULT CHARACTER SET utf8 ;
USE nomina ;

-- -----------------------------------------------------
-- Table nomina.Rol
-- -----------------------------------------------------
DROP TABLE IF EXISTS nomina.Rol ;

CREATE TABLE IF NOT EXISTS nomina.Rol (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  PRIMARY KEY (id))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table nomina.Departament
-- -----------------------------------------------------
DROP TABLE IF EXISTS nomina.Departament ;

CREATE TABLE IF NOT EXISTS nomina.Departament (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  description MEDIUMTEXT NULL,
  max_employees INT NOT NULL,
  active INT NOT NULL,
  PRIMARY KEY (id))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table nomina.Position
-- -----------------------------------------------------
DROP TABLE IF EXISTS nomina.Position ;

CREATE TABLE IF NOT EXISTS nomina.Position (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  report_to INT NULL,
  departament_id INT NOT NULL,
  PRIMARY KEY (id),
  INDEX fk_Position_Position1_idx (report_to ASC),
  INDEX fk_Position_departament1_idx (departament_id ASC),
  CONSTRAINT fk_Position_Position1
    FOREIGN KEY (report_to)
    REFERENCES nomina.Position (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Position_departament1
    FOREIGN KEY (departament_id)
    REFERENCES nomina.Departament (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table nomina.Working_Day
-- -----------------------------------------------------
DROP TABLE IF EXISTS nomina.Working_Day ;

CREATE TABLE IF NOT EXISTS nomina.Working_Day (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(45) NOT NULL,
  lunch_time TIME NOT NULL,
  PRIMARY KEY (id))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table nomina.Employee
-- -----------------------------------------------------
DROP TABLE IF EXISTS nomina.Employee ;

CREATE TABLE IF NOT EXISTS nomina.Employee (
  id INT NOT NULL AUTO_INCREMENT,
  dpi VARCHAR(50) NOT NULL,
  first_name VARCHAR(50) NOT NULL,
  second_name VARCHAR(50) NULL,
  first_last_name VARCHAR(50) NOT NULL,
  second_last_name VARCHAR(50) NULL,
  birthday DATETIME NOT NULL,
  active INT NOT NULL,
  email VARCHAR(100) NULL,
  no_account VARCHAR(50) NOT NULL,
  account_type VARCHAR(45) NOT NULL,
  type_currency VARCHAR(20) NOT NULL,
  phone_number VARCHAR(25) NOT NULL,
  phone_number_second VARCHAR(25) NOT NULL DEFAULT NULL,
  position_id INT NOT NULL,
  base_salary DECIMAL(9,2) NOT NULL,
  working_day_id INT NOT NULL,
  created_at DATETIME NOT NULL,
  created_by INT NOT NULL,
  PRIMARY KEY (id),
  INDEX fk_Employee_Position1_idx (position_id ASC),
  INDEX fk_Employee_working_day1_idx (working_day_id ASC),
  CONSTRAINT fk_Employee_Position1
    FOREIGN KEY (position_id)
    REFERENCES nomina.Position (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Employee_working_day1
    FOREIGN KEY (working_day_id)
    REFERENCES nomina.Working_Day (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table nomina.User
-- -----------------------------------------------------
DROP TABLE IF EXISTS nomina.User ;

CREATE TABLE IF NOT EXISTS nomina.User (
  id INT NOT NULL AUTO_INCREMENT,
  user_name VARCHAR(50) NOT NULL,
  emp_code INT NOT NULL,
  rol_id INT NOT NULL,
  password VARCHAR(150) NOT NULL,
  employee_id INT NOT NULL,
  change_password_date DATETIME NOT NULL,
  PRIMARY KEY (id),
  INDEX fk_User_Rol_idx (rol_id ASC),
  INDEX fk_User_Employee1_idx (employee_id ASC),
  CONSTRAINT fk_User_Rol
    FOREIGN KEY (rol_id)
    REFERENCES nomina.Rol (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_User_Employee1
    FOREIGN KEY (employee_id)
    REFERENCES nomina.Employee (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table nomina.Mark_type
-- -----------------------------------------------------
DROP TABLE IF EXISTS nomina.Mark_type ;

CREATE TABLE IF NOT EXISTS nomina.Mark_type (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  PRIMARY KEY (id))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table nomina.mark
-- -----------------------------------------------------
DROP TABLE IF EXISTS nomina.mark ;

CREATE TABLE IF NOT EXISTS nomina.mark (
  id INT NOT NULL AUTO_INCREMENT,
  employee_id INT NOT NULL,
  mark_type_id INT NOT NULL,
  checkin DATETIME NOT NULL,
  checkout DATETIME NULL,
  PRIMARY KEY (id),
  INDEX fk_mark_Mark_type1_idx (mark_type_id ASC),
  INDEX fk_mark_Employee1_idx (employee_id ASC),
  CONSTRAINT fk_mark_Mark_type1
    FOREIGN KEY (mark_type_id)
    REFERENCES nomina.Mark_type (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_mark_Employee1
    FOREIGN KEY (employee_id)
    REFERENCES nomina.Employee (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table nomina.Discount_Type
-- -----------------------------------------------------
DROP TABLE IF EXISTS nomina.Discount_Type ;

CREATE TABLE IF NOT EXISTS nomina.Discount_Type (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  max_pay_qty INT NOT NULL,
  min_pay_qty INT NOT NULL,
  interest_percentage DECIMAL(5,2) NOT NULL,
  interest_late_pay DECIMAL(5,2) NOT NULL,
  PRIMARY KEY (id))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table nomina.Discount
-- -----------------------------------------------------
DROP TABLE IF EXISTS nomina.Discount ;

CREATE TABLE IF NOT EXISTS nomina.Discount (
  id INT NOT NULL AUTO_INCREMENT,
  discount_type_id INT NOT NULL,
  discount_date DATETIME NOT NULL,
  employee_id INT NOT NULL,
  to_pay DECIMAL(12,2) NOT NULL,
  paid DECIMAL(12,2) NULL,
  status ENUM('pendiente', 'pagado', 'cancelado') NULL,
  INDEX fk_Discount_Discount_Type1_idx (discount_type_id ASC),
  PRIMARY KEY (id),
  INDEX fk_Discount_Employee1_idx (employee_id ASC),
  CONSTRAINT fk_Discount_Discount_Type1
    FOREIGN KEY (discount_type_id)
    REFERENCES nomina.Discount_Type (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Discount_Employee1
    FOREIGN KEY (employee_id)
    REFERENCES nomina.Employee (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table nomina.Company
-- -----------------------------------------------------
DROP TABLE IF EXISTS nomina.Company ;

CREATE TABLE IF NOT EXISTS nomina.Company (
  id INT NOT NULL,
  name VARCHAR(100) NOT NULL,
  nit VARCHAR(20) NOT NULL,
  manager_dpi VARCHAR(20) NOT NULL,
  address VARCHAR(200) NOT NULL,
  phone_number INT NOT NULL,
  PRIMARY KEY (id))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table nomina.Company_Account
-- -----------------------------------------------------
DROP TABLE IF EXISTS nomina.Company_Account ;

CREATE TABLE IF NOT EXISTS nomina.Company_Account (
  id INT NOT NULL,
  company_id INT NOT NULL,
  bank_name VARCHAR(45) NOT NULL,
  account_type VARCHAR(45) NOT NULL,
  type_currency VARCHAR(45) NOT NULL,
  PRIMARY KEY (id),
  INDEX fk_Company_Account_Company1_idx (company_id ASC),
  CONSTRAINT fk_Company_Account_Company1
    FOREIGN KEY (company_id)
    REFERENCES nomina.Company (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table nomina.Permission_Type
-- -----------------------------------------------------
DROP TABLE IF EXISTS nomina.Permission_Type ;

CREATE TABLE IF NOT EXISTS nomina.Permission_Type (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(45) NOT NULL,
  salary_payment INT NOT NULL DEFAULT 1,
  PRIMARY KEY (id))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table nomina.Permission
-- -----------------------------------------------------
DROP TABLE IF EXISTS nomina.Permission ;

CREATE TABLE IF NOT EXISTS nomina.Permission (
  id INT NOT NULL AUTO_INCREMENT,
  employee_id INT NOT NULL,
  permission_type_id INT NOT NULL,
  init_date DATETIME NOT NULL,
  end_date DATETIME NOT NULL,
  approved INT NOT NULL DEFAULT 0,
  complete_day INT NOT NULL,
  PRIMARY KEY (id),
  INDEX fk_Permission_Permission_Type1_idx (permission_type_id ASC),
  INDEX fk_Permission_Employee1_idx (employee_id ASC),
  CONSTRAINT fk_Permission_Permission_Type1
    FOREIGN KEY (permission_type_id)
    REFERENCES nomina.Permission_Type (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Permission_Employee1
    FOREIGN KEY (employee_id)
    REFERENCES nomina.Employee (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table nomina.Working_Day_Detail
-- -----------------------------------------------------
DROP TABLE IF EXISTS nomina.Working_Day_Detail ;

CREATE TABLE IF NOT EXISTS nomina.Working_Day_Detail (
  id INT NOT NULL AUTO_INCREMENT,
  working_day_id INT NOT NULL,
  day_of_week VARCHAR(45) NOT NULL,
  init_hour TIME NOT NULL,
  end_hour TIME NOT NULL,
  daily_hour INT NOT NULL,
  lunch_hour DECIMAL(5,2) NOT NULL,
  PRIMARY KEY (id),
  INDEX fk_table1_working_day1_idx (working_day_id ASC),
  CONSTRAINT fk_table1_working_day1
    FOREIGN KEY (working_day_id)
    REFERENCES nomina.Working_Day (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- LLENADO DE TABLAS
INSERT INTO nomina.departament (name, description, max_employees, active) VALUES ('IT', 'Analisis y desarrollo de software', '10', '1');
INSERT INTO nomina.departament (name, description, max_employees, active) VALUES ('Generencia General', 'Adminsitracion y direccion de negocio', '2', '1');
INSERT INTO nomina.working_day (name, lunch_time) VALUES ('Matituna estandar', TIME('13:00:00'));
INSERT INTO nomina.working_day_detail (working_day_id, day_of_week, init_hour, end_hour, daily_hour, lunch_hour) VALUES ('1', 'Monday', '06:00:00', '16:00:00', '9', '1');
INSERT INTO nomina.working_day_detail (working_day_id, day_of_week, init_hour, end_hour, daily_hour, lunch_hour) VALUES ('1', 'Tuesday', '06:00:00', '16:00:00', '9', '1.00');
INSERT INTO nomina.working_day_detail (working_day_id, day_of_week, init_hour, end_hour, daily_hour, lunch_hour) VALUES ('1', 'Wednesday', '06:00:00', '16:00:00', '9', '1.00');
INSERT INTO nomina.working_day_detail (working_day_id, day_of_week, init_hour, end_hour, daily_hour, lunch_hour) VALUES ('1', 'Thursday', '06:00:00', '16:00:00', '9', '1.00');
INSERT INTO nomina.working_day_detail (working_day_id, day_of_week, init_hour, end_hour, daily_hour, lunch_hour) VALUES ('1', 'Friday', '06:00:00', '15:00:00', '8', '1.00');
INSERT INTO nomina.working_day_detail (working_day_id, day_of_week, init_hour, end_hour, daily_hour, lunch_hour) VALUES ('1', 'Saturday', '06:00:00', '06:00:00', '0', '0');
INSERT INTO nomina.working_day_detail (working_day_id, day_of_week, init_hour, end_hour, daily_hour, lunch_hour) VALUES ('1', 'Sunday', '06:00:00', '06:00:00', '0', '0.00');
INSERT INTO nomina.rol (name) VALUES ('Root');
INSERT INTO nomina.rol (name) VALUES ('Administrador');
INSERT INTO nomina.rol (name) VALUES ('Recursos Humanos');
INSERT INTO nomina.position (name, departament_id, description) VALUES ('Genrente General', '2', 'Direccion y administracion de la empresa');
INSERT INTO nomina.position (name, report_to, departament_id, description) VALUES ('Gerente IT', '1', '1', 'Coordinar el recurso de sistemas y proveer de soluciones optimas');
INSERT INTO nomina.position (name, report_to, departament_id, description) VALUES ('Analista Programador', '2', '1', 'Desarrollo e implementacion de soluciones informaticas');
INSERT INTO nomina.employee (dpi, first_name, second_name, first_last_name, second_last_name, birthday, active, email, no_account, account_type, type_currency, phone_number, position_id, base_salary, working_day_id, created_at, created_by) VALUES ('2010-17512-0101', 'Jose', 'David', 'Gonzales', 'Monry', '2020-04-12 00:00:00', '1', 'jgonzales@nomina.com', '12345-76861', 'Monetarios', 'Q', '51204322', '3', '5500', '1', '2022-05-12 13:02:36', '1');
INSERT INTO `nomina`.`company` (`name`, `nit`, `manager_dpi`, `address`, `phone_number`) VALUES ('Nominas S.A', '12345678-9', '3011-19234-010', 'Ciudad', '54324567');
INSERT INTO `nomina`.`company_account` (`company_id`, `bank_name`, `account_type`, `type_currency`) VALUES ('1', 'Banco Industrial', 'Monetarios', 'Q');
INSERT INTO `nomina`.`employee` (`dpi`, `first_name`, `second_name`, `first_last_name`, `second_last_name`, `birthday`, `active`, `email`, `no_account`, `account_type`, `type_currency`, `phone_number`, `position_id`, `base_salary`, `working_day_id`, `created_at`, `created_by`) VALUES ('2413-12345-0101', 'Luis', 'Mario', 'Perez', 'Azurdia', '1995-05-17 19:49:37', '1', 'lperez@nomina.com', '1234345-3423', 'Monetarios', 'Q', '32451928', '3', '6000', '1', '2022-05-17 19:50:38', '1');
INSERT INTO `nomina`.`mark_type` (`name`) VALUES ('Entrada/Salida');
INSERT INTO `nomina`.`mark_type` (`name`) VALUES ('Almuerzo');
INSERT INTO `nomina`.`mark_type` (`name`) VALUES ('Sanitario');