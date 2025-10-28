/* Bases de Datos I

Descripción del problema.

Realiza una bases de datos para resolver el siguiente problema:

El instituto desea organizar la información de sus profesores, módulos, y alumnos en una base de datos relacional. */

-- BBDD INSTITUTO

CREATE SCHEMA IF NOT EXISTS Instituto;

USE Instituto;

-- Tabla Profesores 

CREATE TABLE IF NOT EXISTS Profesores (
DNI VARCHAR (9) PRIMARY KEY,
Nombre VARCHAR(15),
Direccion VARCHAR (50),
Telefono INT 
);

-- Tabla Modulos

CREATE TABLE IF NOT EXISTS Modulos (
Id_modulo INT AUTO_INCREMENT PRIMARY KEY,
Nombre VARCHAR (25),
DNI VARCHAR (9),
CONSTRAINT modulos_profesores
FOREIGN KEY (DNI)
REFERENCES Profesores (DNI)
ON UPDATE CASCADE ON DELETE CASCADE
)

-- Tabla Alumnos

CREATE TABLE IF NOT EXISTS Alumnos (
Num_expediente INT AUTO_INCREMENT PRIMARY KEY,
Nombre VARCHAR (25), 
Apellidos VARCHAR (50),
Fecha_nacimiento DATETIME
);

-- Tabla Matricula

CREATE TABLE IF NOT EXISTS Matricula (
Id_matricula INT AUTO_INCREMENT PRIMARY KEY,
Id_modulo VARCHAR (15),
Num_expediente INT,
CONSTRAINT matriculas_alumnos
FOREIGN KEY (Num_expediente)
REFERENCES Alumnos (Num_expediente)
ON UPDATE CASCADE ON DELETE CASCADE,
CONSTRAINT matriculas_modulos
FOREIGN KEY (Id_modulo)
REFERENCES Modulos (Id_modulo)
ON UPDATE CASCADE ON DELETE CASCADE
);


-- Insercion Datos

INSERT INTO Profesores (DNI, Nombre, Direccion, Telefono)
VALUES 
('12345678A', 'Juan Pérez', 'Calle Mayor, 10', '600123456'),
('87654321B', 'María López', 'Avenida Sol, 45', '600654321'),
('45678912C', 'Carlos Gómez', 'Plaza Luna, 7', '600789123');

INSERT INTO Modulos (Id_modulo, Nombre, DNI)
VALUES
('MOD101', 'Matemáticas', '12345678A'),
('MOD102', 'Física', '87654321B'),
('MOD103', 'Química', '45678912C'),
('MOD104', 'Biología', '12345678A'),
('MOD105', 'Historia', '87654321B');

INSERT INTO Alumnos (Num_expediente, Nombre, Apellidos, Fecha_nacimiento)
VALUES
(1001, 'Ana Martínez', 'Martínez', '2005-03-15'),
(1002, 'Luis Fernández', 'Fernández', '2004-11-22'),
(1003, 'Clara Ruiz', 'Ruiz', '2006-01-10'),
(1004, 'Pedro Sánchez', 'Sánchez', '2005-07-08'),
(1005, 'Lucía Torres', 'Torres', '2004-09-18');

INSERT INTO Matricula (Id_matricula, Num_expediente, Id_modulo)
VALUES
(1, 1001, 'MOD101'),
(2, 1001, 'MOD102'),
(3, 1002, 'MOD101'),
(4, 1002, 'MOD103'),
(5, 1003, 'MOD104'),
(6, 1004, 'MOD105'),
(7, 1005, 'MOD102'),
(8, 1005, 'MOD104');


-- Realiza las siguientes consultas:

-- 1. Listar todos los datos de los profesores:

SELECT * FROM profesores; 

-- 2. Mostrar los nombres y teléfonos de todos los profesores

SELECT Nombre, Telefono FROM profesores; 

-- 3. Listar todos los módulos impartidos en el instituto

SELECT Id_modulo, Nombre FROM modulos;

-- 4. Mostrar el nombre y apellidos de todos los alumnos

SELECT Nombre, Apellidos FROM alumnos;

-- 5. Listar todos los números de expediente de los alumnos matriculados

SELECT Num_expediente FROM alumnos;

-- 6. Buscar un profesor por su DNI (por ejemplo, 12345678A)

SELECT Nombre, Direccion, Telefono
FROM profesores 
WHERE DNI = '12345678A';

-- 7. Mostrar todos los módulos cuyo nombre contenga la palabra "Matemáticas"

SELECT * FROM modulos
WHERE Nombre LIKE '%Matematicas%';

-- 8. Listar los alumnos nacidos después del año 2005

SELECT * FROM alumnos
WHERE YEAR(Fecha_nacimiento) > 2005;

-- 9. Obtener todas las matrículas realizadas en un módulo específico (por ejemplo, módulo MOD101)

SELECT * FROM matricula
WHERE Id_modulo = 'MOD101';

-- 10. Listar todos los módulos impartidos por un profesor específico (por ejemplo, DNI 12345678A)
SELECT * FROM modulos
WHERE DNI = '45678912C';

-- 11. Listar a los alumnos ordenados por apellidos de forma ascendente

SELECT Nombre FROM alumnos
ORDER BY Nombre;