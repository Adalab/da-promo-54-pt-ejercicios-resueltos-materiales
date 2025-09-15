creacion_esquema = "CREATE SCHEMA IF NOT EXISTS `tienda_italiana`;"

crear_tabla_productos = """CREATE TABLE IF NOT EXISTS `tienda_italiana`.`productos` (
  `id_producto` VARCHAR(200) NOT NULL,
  `nombre` VARCHAR(50) NULL,
  `categoria` VARCHAR(50) NULL,
  `precio` VARCHAR(50) NULL,
  `origen` VARCHAR(200) NULL,
  `descripcion` VARCHAR(500) NULL,
  PRIMARY KEY (`id_producto`));"""

crear_tabla_clientes = """CREATE TABLE IF NOT EXISTS `tienda_italiana`.`clientes` (
  `id_cliente` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `gender` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `country` VARCHAR(45) NULL,
  `address` VARCHAR(200) NULL,
  PRIMARY KEY (`id_cliente`));"""

crear_tabla_ventas = """CREATE TABLE IF NOT EXISTS `tienda_italiana`.`ventas` (
  `productos_id_producto` VARCHAR(25) NOT NULL,
  `clientes_id_cliente` INT NOT NULL,
  `fecha_venta` DATETIME NULL,
  `cantidad` INT NULL,
  `total` FLOAT NULL,
  PRIMARY KEY (`productos_id_producto`, `clientes_id_cliente`),
  INDEX `fk_productos_has_clientes_clientes1_idx` (`clientes_id_cliente` ASC) VISIBLE,
  INDEX `fk_productos_has_clientes_productos_idx` (`productos_id_producto` ASC) VISIBLE
);"""

insertar_productos = "INSERT INTO productos (id_producto, nombre, categoria, precio, origen, descripcion) VALUES (%s, %s, %s, %s, %s, %s)"

insertar_clientes = "INSERT INTO clientes (first_name, last_name, email, gender, city, country, address) VALUES (%s, %s, %s, %s, %s, %s, %s)"

insertar_ventas = "INSERT INTO ventas (productos_id_producto, clientes_id_cliente, fecha_venta, cantidad, total) VALUES (%s, %s, %s, %s, %s)"

