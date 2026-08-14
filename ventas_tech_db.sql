-- Ventas_Tech_DB - Script de Ventas
-- Autor: Fernanda Adamo
-- Fecha: 14/08/2026


-- SECCION DDL

-- Creación de base de datos
CREATE DATABASE Ventas_Tech_DB;

-- Migración a base de datos Ventas_Tech_DB
USE Ventas_Tech_DB;

-- Dropeo de la tabla de hechos
DROP TABLE IF EXISTS ventas;

-- Dropeo de las tablas de dimensión
DROP TABLE IF EXISTS productos;
DROP TABLE IF EXISTS categorias;
DROP TABLE IF EXISTS clientes;


-- Tablas de dimensión

-- Creación tabla categorias
CREATE TABLE categorias(
id_categoria INT IDENTITY(1,1) PRIMARY KEY,
nombre_categoria VARCHAR(50) NOT NULL,
descripcion VARCHAR(50)
);

-- Creación tabla productos
CREATE TABLE productos(
id_producto INT IDENTITY(1,1) PRIMARY KEY,
nombre_producto VARCHAR(50) NOT NULL,
id_categoria INT FOREIGN KEY(id_categoria) REFERENCES categorias(id_categoria),
precio DECIMAL(10,2) NOT NULL,
stock INT DEFAULT 0,
activo TINYINT DEFAULT 1
);

-- Creación tabla clientes
CREATE TABLE clientes(
id_cliente INT IDENTITY(1,1) PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
email VARCHAR(50) UNIQUE,
ciudad VARCHAR(50),
fecha_registro DATE NOT NULL
)


-- Tabla de hechos

-- Creación tabla ventas
CREATE TABLE ventas(
id_venta INT IDENTITY(1,1) PRIMARY KEY,
id_cliente INT FOREIGN KEY(id_cliente) REFERENCES clientes(id_cliente),
id_producto INT FOREIGN KEY(id_producto) REFERENCES productos(id_producto),
cantidad INT NOT NULL,
precio_unitario DECIMAL(10,2) NOT NULL,
fecha_venta DATE NOT NULL
);


-- SECCION DML

-- Inserción de datos categorias
INSERT INTO categorias
VALUES
('Computación', 'Laptops, PCs y monitores'),
('Accesorios', 'Periféricos y complementos'),
('Audio', 'Auriculares y parlantes'),
('Almacenamiento', 'Discos y memorias');

-- Chequeo de datos categorias
SELECT * FROM categorias;

-- Inserción de datos productos
INSERT INTO productos
VALUES
('Laptop Pro 15', 1, 1200.00, 15, 1),
('Mouse Inalámbrico', 2, 28.00, 80, 1),
('Monitor 4K 27"', 1, 450.00, 12, 1),
('Auriculares BT Pro', 3, 120.00, 35, 1),
('SSD Externo 1TB', 4, 130.00, 18, 1),
('Teclado Mecánico', 2, 95.00, 40, 1);

-- Chequeo de datos productos
SELECT * FROM productos;

-- Inserción de datos clientes
INSERT INTO clientes
VALUES
('María López', 'maria@mail.com', 'Buenos Aires', '2024-01-05'),
('Carlos Ruiz', 'carlos@mail.com', 'Córdoba', '2024-01-10'),
('Ana Gómez', 'ana@mail.com', 'Rosario', '2024-02-01'),
('Pedro Sanz', 'pedro@mail.com', 'Mendoza', '2024-02-15'),
('Laura Torres', 'laura@mail.com', 'Tucumán', '2024-03-01');

-- Chequeo de datos clientes
SELECT * FROM clientes;

-- Inserción de datos ventas
INSERT INTO ventas
VALUES
(1, 1, 2, 1200.00, '2024-03-05'),
(2, 2, 5, 28.00, '2024-03-06'),
(3, 3, 1, 450.00, '2024-03-07'),
(1, 4, 2, 120.00, '2024-03-08'),
(4, 5, 3, 130.00, '2024-03-10'),
(2, 6, 4, 95.00, '2024-03-11'),
(5, 1, 1, 1200.00, '2024-03-12'),
(3, 2, 8, 28.00, '2024-03-13'),
(4, 4, 1, 120.00, '2024-03-14'),
(5, 3, 2, 450.00, '2024-03-15');

-- Chequeo de datos ventas
SELECT * FROM ventas;