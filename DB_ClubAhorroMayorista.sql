CREATE TABLE TipoMembresia(

    idTipoMembresia NUMBER PRIMARY KEY,
    
    nombre VARCHAR2(50),
    duracionMeses NUMBER,
    precio NUMBER(10,2)
);

CREATE TABLE Socio(
    idSocio NUMBER PRIMARY KEY,
    
    identificacion VARCHAR2(20),
    nombre VARCHAR2(50),
    apellido VARCHAR2(80),
    telefono VARCHAR2(20),
    correo VARCHAR2(100),
    fechaRegistro DATE,
    estado VARCHAR2(15)
);

CREATE TABLE Membresia(
    idMembresia NUMBER PRIMARY KEY,
    
    FOREIGN KEY (idSocio) REFERENCES Socio(idSocio),
    FOREIGN KEY(idTipoMembresia) REFERENCES TipoMembresia(idTipoMembresia),
    
    idSocio NUMBER,
    idTipoMembresia NUMBER,
    fechaInicio DATE,
    fechaVencimiento DATE,
    estado VARCHAR2(15)
);

CREATE TABLE Categoria(
    idCategoria NUMBER PRIMARY KEY,
    
    nombre VARCHAR2(60),
    descripcion VARCHAR2(200)
);

CREATE TABLE Proveedor(
    idProveedor NUMBER PRIMARY KEY,
    
    nombre VARCHAR2(100),
    telefono VARCHAR2(20),
    correo VARCHAR2(100),
    contacto VARCHAR2(100),
    estado VARCHAR2(15)
);

CREATE TABLE Producto(
    idProducto NUMBER PRIMARY KEY,
    
    FOREIGN KEY (idCategoria) REFERENCES Categoria(idCategoria),
    
    idCategoria NUMBER,
    codigoProducto VARCHAR2(30),
    nombre VARCHAR2(100),
    descripcion VARCHAR2(250),
    precioVenta NUMBER(10,2),
    estado VARCHAR2(15)
);

CREATE TABLE ProveedorProducto(

    PRIMARY KEY (idProveedor, idProducto),

    FOREIGN KEY (idProveedor) REFERENCES Proveedor(idProveedor),
    FOREIGN KEY (idProducto) REFERENCES Producto(idProducto),
    
    idProveedor NUMBER,
    idProducto NUMBER,
    precioCompra NUMBER(10,2),
    fechaUltimaCompra DATE
);

CREATE TABLE Inventario(

    idInventario NUMBER PRIMARY KEY,
    FOREIGN KEY (idProducto) REFERENCES Producto(idProducto),

    idProducto NUMBER,
    cantidadDisponible NUMBER,
    cantidadMinima NUMBER,
    fechaActualizacion DATE
);

CREATE TABLE Empleado(
    idEmpleado NUMBER PRIMARY KEY,
    
    identificacion VARCHAR2(20),
    nombre VARCHAR2(50),
    apellido VARCHAR2(80),
    cargo VARCHAR2(50),
    telefono VARCHAR2(20),
    correo VARCHAR2(100),
    estado VARCHAR2(15)
);

CREATE TABLE MovimientoInventario (
    idMovimiento NUMBER PRIMARY KEY,
    
    FOREIGN KEY (idProducto) REFERENCES Producto(idProducto),
    FOREIGN KEY (idEmpleado) REFERENCES Empleado(idEmpleado),
    
    idProducto NUMBER,
    idEmpleado NUMBER,
    tipoMovimiento VARCHAR2(10),
    cantidad NUMBER,
    fechaMovimiento DATE,
    observacion VARCHAR2(250)
);

CREATE TABLE TipoPago(
    idTipoPago NUMBER PRIMARY KEY,
    
    nombre VARCHAR2(30),
    estado VARCHAR2(15)
);

CREATE TABLE Venta(

    idVenta NUMBER PRIMARY KEY,
    
    FOREIGN KEY (idSocio) REFERENCES Socio(idSocio),
    FOREIGN KEY (idEmpleado) REFERENCES Empleado(idEmpleado),
    FOREIGN KEY (idTipoPago) REFERENCES TipoPago(idTipoPago),
    
    idSocio NUMBER,
    idEmpleado NUMBER,
    idTipoPago NUMBER,
    fechaVenta DATE,
    total NUMBER(10,2),
    estado VARCHAR2(15)
);

CREATE TABLE DetalleVenta (
    idDetalle NUMBER PRIMARY KEY,
    
    FOREIGN KEY (idVenta)REFERENCES Venta(idVenta),
    FOREIGN KEY (idProducto) REFERENCES Producto(idProducto),
    
    idVenta NUMBER,
    idProducto NUMBER,
    cantidad NUMBER,
    precioUnitario NUMBER(10,2),
    subtotal NUMBER(10,2)
);

CREATE TABLE UsuarioSistema(

    idUsuario NUMBER PRIMARY KEY,
    
    FOREIGN KEY (idEmpleado)REFERENCES Empleado(idEmpleado),
    
    idEmpleado NUMBER,
    nombreUsuario VARCHAR2(50),
    clave VARCHAR2(100),
    rol VARCHAR2(30),
    estado VARCHAR2(15)
);