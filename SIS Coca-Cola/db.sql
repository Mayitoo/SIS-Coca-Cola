-- 1. CREACIÓN DE LA BASE DE DATOS
-- ------------------------------------------------------------------------------------------------------
CREATE DATABASE IF NOT EXISTS SIS_COCACOLA;
USE SIS_COCACOLA;


-- 2. TABLA: RECURSOS HUMANOS 
-- ------------------------------------------------------------------------------------------------------
CREATE TABLE TBL_EMPLEADOS (
    ID_Empleado INT PRIMARY KEY AUTO_INCREMENT,
    Nombre_Completo VARCHAR(200) NOT NULL,
    Departamento VARCHAR(50) NOT NULL,
    Puesto VARCHAR(50) NOT NULL,
    Salario_Base DECIMAL(8, 2) NOT NULL,
    Fecha_Contratacion DATE NOT NULL,
    Correo_Corporativo VARCHAR(100) UNIQUE
);


-- 3. TABLA: ALMACÉN
-- ------------------------------------------------------------------------------------------------------
CREATE TABLE TBL_INVENTARIO (
    ID_Inventario INT PRIMARY KEY AUTO_INCREMENT,
    Producto VARCHAR(100) NOT NULL,
    Codigo_SKU VARCHAR(50) UNIQUE NOT NULL,
    Cantidad_Cajas INT NOT NULL,
    Ubicacion_Pasillo VARCHAR(10),
    Fecha_Entrada DATE NOT NULL,
    Fecha_Caducidad DATE
);


-- 4. TABLA: VENTAS
-- (Referencia a Empleados para saber qué vendedor hizo la venta)
-- ------------------------------------------------------------------------------------------------------
CREATE TABLE TBL_PEDIDOS (
    ID_Pedido INT PRIMARY KEY AUTO_INCREMENT,
    Fecha_Pedido DATETIME NOT NULL,
    Nombre_Cliente VARCHAR(150) NOT NULL,
    Total_Monto DECIMAL(10, 2) NOT NULL,
    Estado_Pedido VARCHAR(20) DEFAULT 'Procesando',
    ID_Vendedor INT,
    FOREIGN KEY (ID_Vendedor) REFERENCES TBL_EMPLEADOS(ID_Empleado)
);


-- 5. TABLA: MARKETING
-- ------------------------------------------------------------------------------------------------------
CREATE TABLE TBL_CAMPAÑAS (
    ID_Campaña INT PRIMARY KEY AUTO_INCREMENT,
    Nombre_Campaña VARCHAR(200) NOT NULL,
    Presupuesto DECIMAL(12, 2) NOT NULL,
    Fecha_Inicio DATE,
    Fecha_Fin DATE,
    Canal VARCHAR(50),
    Resultados_Leads INT DEFAULT 0
);


-- 6. TABLA: CONTABILIDAD
-- ------------------------------------------------------------------------------------------------------
CREATE TABLE TBL_TRANSACCIONES_FIN (
    ID_Transaccion INT PRIMARY KEY AUTO_INCREMENT,
    Fecha_Registro DATETIME NOT NULL,
    Tipo_Movimiento VARCHAR(10) CHECK (Tipo_Movimiento IN ('Ingreso', 'Egreso', 'Gasto')) NOT NULL,
    Monto DECIMAL(12, 2) NOT NULL,
    Concepto VARCHAR(200) NOT NULL,
    Departamento_Origen VARCHAR(50)
);