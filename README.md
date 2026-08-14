# 🛒 Base de Datos: Ventas_Tech_DB

**Autor:** Fernanda Adamo  
**Fecha:** 14/08/2026  
**Tecnología:** SQL Server / T-SQL  
**Proyecto:** Implementación DDL/DML para TechStore — Coderhouse Data Analytics

---

## 📌 Descripción del Proyecto
Este proyecto consiste en la creación, diseño e implementación desde cero de la base de datos relacional **`Ventas_Tech_DB`**. La arquitectura sostiene las operaciones comerciales de la cadena de tecnología **TechStore**, sirviendo como la fuente de datos primaria que alimentará los posteriores modelos analíticos en Power BI y medidas DAX a lo largo del programa.

---

## 📐 Modelo Entidad-Relación (ERD)

El esquema consta de **3 tablas de dimensión** (`categorias`, `productos`, `clientes`) y **1 tabla de hechos** (`ventas`):

![Modelo Entidad-Relación - Ventas_Tech_DB](erd_ventas_tech_db.png)

---

## 🛠️ Estructura de la Base de Datos

### Tablas de Dimensión
* **`categorias`**: Catálogo de familias de productos (`id_categoria` PK).
* **`clientes`**: PII e historial de compradores registrando datos de contacto (`id_cliente` PK, `email` UNIQUE).
* **`productos`**: Inventario de artículos tecnológicos (`id_producto` PK, `id_categoria` FK, `precio`, `stock`, `activo`).

### Tabla de Hechos
* **`ventas`**: Registro transaccional de ventas (`id_venta` PK, `id_cliente` FK, `id_producto` FK, `cantidad`, `precio_unitario`, `fecha_venta`).

---

## 🚀 Instrucciones de Ejecución

1. Abrir **SQL Server Management Studio (SSMS)** o tu cliente SQL preferido.
2. Ejecutar la sección **DDL** del script `Ventas_Tech_DB.sql` para crear la base de datos, las estructuras de las tablas y las restricciones de integridad (`PRIMARY KEY`, `FOREIGN KEY`, `NOT NULL`, `UNIQUE`).
3. Ejecutar la sección **DML** para realizar la inserción inicial de datos maestros e historiales transaccionales.
4. Validar la carga mediante las consultas `SELECT *` incluidas al final del archivo.

---

## 📝 Validaciones e Integridad
* Se garantiza la **integridad referencial** mediante claves foráneas explícitas.
* Uso de tipos de datos de alta precisión financiera (`DECIMAL(10,2)`).
* Manejo de borrado seguro (*Cascade/Reverse DROP*) respetando las dependencias entre tablas.
