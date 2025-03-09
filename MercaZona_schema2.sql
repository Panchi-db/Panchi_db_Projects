 
DROP DATABASE IF EXISTS MercaZona;

CREATE DATABASE IF NOT EXISTS MercaZona;

USE MercaZona;


#tiendas

CREATE TABLE IF NOT EXISTS tiendas (
    id_tienda INT NOT NULL AUTO_INCREMENT,
    nombre_tienda VARCHAR(75) NOT NULL,
    direccion VARCHAR(150) NULL,
    ciudad VARCHAR(100) NULL,
    PRIMARY KEY (id_tienda));



#categorias

CREATE TABLE IF NOT EXISTS categorias (
    id_categoria INT NOT NULL AUTO_INCREMENT,
    nombre_categoria VARCHAR(100) NOT NULL,
    PRIMARY KEY (id_categoria));



#empleados

CREATE TABLE IF NOT EXISTS empleados (
    id_empleado INT NOT NULL AUTO_INCREMENT,
    nombre_empleado VARCHAR(200) NOT NULL,
    puesto VARCHAR(75) NULL,
    id_tienda INT NOT NULL,
    PRIMARY KEY (id_empleado),
    INDEX id_tienda_idx (id_tienda ASC) VISIBLE,
    CONSTRAINT id_tienda
        FOREIGN KEY (id_tienda)
        REFERENCES MercaZona.tiendas (id_tienda)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION);


#productos

CREATE TABLE IF NOT EXISTS productos (
    id_producto INT NOT NULL AUTO_INCREMENT,
    nombre_producto VARCHAR(75) NOT NULL,
    precio DECIMAL(3,2) NOT NULL,
    stock INT NULL,
    id_categoria INT NOT NULL,
    PRIMARY KEY (id_producto),
    INDEX id_categoria_idx (id_categoria ASC) VISIBLE,
    CONSTRAINT id_categoria
        FOREIGN KEY (id_categoria)
        REFERENCES categorias (id_categoria)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION);


#clientes

CREATE TABLE IF NOT EXISTS clientes (
    id_cliente INT NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(75) NOT NULL,
    last_name VARCHAR(100) NULL,
    email VARCHAR(150) NOT NULL,
    telefono INT NULL,
    codigo_postal INT NOT NULL,
    id_tienda INT NOT NULL,
    PRIMARY KEY (id_cliente),
    UNIQUE INDEX email_UNIQUE (email ASC) VISIBLE);


#ordenes

CREATE TABLE IF NOT EXISTS ordenes (
    id_orden INT NOT NULL AUTO_INCREMENT,
    id_cliente INT NOT NULL,
    id_empleado INT NOT NULL,
    id_tienda INT NOT NULL,
    fecha_orden DATE NULL,
    hora_orden TIME NULL,
    metodo_de_pago ENUM('tarjeta', 'efectivo', 'vale') NOT NULL,
    PRIMARY KEY (id_orden),
    INDEX id_cliente_idx (id_cliente ASC) VISIBLE,
    INDEX id_empleado_idx (id_empleado ASC) VISIBLE);
    ;

#detalle_orden

CREATE TABLE IF NOT EXISTS detalle_orden (
    id_detalle INT NOT NULL AUTO_INCREMENT,
    id_orden INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NULL,
    precio_unitario DECIMAL(3,2) NOT NULL,
    descuento DECIMAL(3,2) NULL,
    PRIMARY KEY (id_detalle),
    INDEX id_orden_idx (id_orden ASC) VISIBLE,
    INDEX id_producto_idx (id_producto ASC) VISIBLE); 