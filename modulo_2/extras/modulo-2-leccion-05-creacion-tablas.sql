-- PAIR modulo-2-leccion-05-creacion-tablas

CREATE SCHEMA IF NOT EXISTS `tienda_zapatillas` DEFAULT CHARACTER SET utf8 ;
USE `tienda_zapatillas`;

-- Tabla  Zapatillas
CREATE TABLE IF NOT EXISTS `tienda_zapatillas`.`Zapatillas` (
  `id_Zapatillas` INT NOT NULL AUTO_INCREMENT,
  `Modelo` VARCHAR(45) NOT NULL,
  `Color` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idZapatillas`));

-- Tabla Empleados
CREATE TABLE IF NOT EXISTS `tienda_zapatillas`.`Empleados` (
  `id_Empleado` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `Tienda` VARCHAR(45) NOT NULL,
  `Salario` int, 
  `Fecha_incorporacion` date NOT NULL,  
  PRIMARY KEY (`idEmpleado`));


-- Tabla Clientes

CREATE TABLE IF NOT EXISTS `tienda_zapatillas`.`Clientes` (
  `id_Cliente` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `Numero_Telf` int(9) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `Direccion` VARCHAR(45) NOT NULL,
  `Ciudad` VARCHAR(45) NOT NULL,
  `Provincia` VARCHAR(45) NOT NULL,
  `Pais` VARCHAR(45) NOT NULL,
  `codigo_postal` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCliente`));


-- Tabla Facturas

CREATE TABLE IF NOT EXISTS `tienda_zapatillas`.`Facturas` (
  `id_Factura` INT NOT NULL AUTO_INCREMENT,
  `Numero_Factura` VARCHAR(45) NOT NULL,
  `Fecha` date NOT NULL,
  `idZapatillas` INT NOT NULL,
  `id_Empleado` INT NOT NULL,
  `id_Cliente` INT NOT NULL,
  PRIMARY KEY (`id_Factura`, `id_sZapatillas`, `id_sEmpleado`, `id_Cliente`),
  INDEX `fk_Factura_Clientes1_idx` (`id_Cliente` ASC) ,
  INDEX `fk_Factura_Zapatillas1_idx` (`id_Zapatillas` ASC) ,
  INDEX `fk_Factura_Empleados1_idx` (`id_Empleado` ASC) ,
  CONSTRAINT `fk_Factura_Clientes1`
    FOREIGN KEY (`id_Cliente`)
    REFERENCES `tienda_zapatillas`.`Clientes` (`id_Cliente`),
  CONSTRAINT `fk_Factura_Zapatillas1`
    FOREIGN KEY (`id_Zapatillas`)
    REFERENCES `tienda_zapatillas`.`Zapatillas` (`id_Zapatillas`),
  CONSTRAINT `fk_Factura_Empleados1`
    FOREIGN KEY (`id_Empleado`)
    REFERENCES `tienda_zapatillas`.`Empleados` (`id_Empleado`));
