--
-- ER/Studio 8.0 SQL Code Generation
-- Company :      Developers
-- Project :      Modelo-Inventario.DM1
-- Author :       Adrian Cox
--
-- Date Created : Sunday, November 26, 2017 21:14:32
-- Target DBMS : MySQL 5.x
--

-- 
-- TABLE: Almacenes 
--

CREATE TABLE Almacenes(
    IDAlmacen    INT             AUTO_INCREMENT,
    Nombre       VARCHAR(150)    NOT NULL,
    Direccion    VARCHAR(350)    NOT NULL,
    PRIMARY KEY (IDAlmacen)
)
;



-- 
-- TABLE: BitácoraERP 
--

CREATE TABLE BitácoraERP(
    IdBitácoraERP    INT            AUTO_INCREMENT,
    IdErroresERP     INT            NOT NULL,
    IdPerfiles       INT            NOT NULL,
    IdUsuarios       INT            NOT NULL,
    Clave            VARCHAR(10)    NOT NULL,
    Timestamp        DATETIME,
    Acción           VARCHAR(20)    NOT NULL,
    PRIMARY KEY (IdBitácoraERP, IdErroresERP, IdPerfiles, IdUsuarios, Clave)
)
;



-- 
-- TABLE: BitacoraProductos 
--

CREATE TABLE BitacoraProductos(
    ClaveBitacora    INT                      AUTO_INCREMENT,
    Usuario          INT                      NOT NULL,
    Observaciones    NATIONAL VARCHAR(700),
    Tabla            VARCHAR(75)              NOT NULL,
    Accion           VARCHAR(150)             NOT NULL,
    Fecha            DATETIME                 NOT NULL,
    PRIMARY KEY (ClaveBitacora)
)
;



-- 
-- TABLE: Catálogos 
--

CREATE TABLE Catálogos(
    IdCatálogos       INT            AUTO_INCREMENT,
    NombreCatálogo    VARCHAR(50)    NOT NULL,
    PRIMARY KEY (IdCatálogos)
)
;



-- 
-- TABLE: Categorias 
--

CREATE TABLE Categorias(
    IDCategoria    INT             AUTO_INCREMENT,
    Nombre         VARCHAR(100)    NOT NULL,
    PRIMARY KEY (IDCategoria)
)
;



-- 
-- TABLE: Clientes 
--

CREATE TABLE Clientes(
    IDCliente          INT             AUTO_INCREMENT,
    Nombre             VARCHAR(250)    NOT NULL,
    ApellidoPaterno    VARCHAR(250)    NOT NULL,
    ApellidoMaterno    VARCHAR(250)    NOT NULL,
    Telefono           VARCHAR(25)     NOT NULL,
    Direccion          VARCHAR(250),
    Estado             VARCHAR(50)     NOT NULL,
    Fecha              DATETIME        NOT NULL,
    PRIMARY KEY (IDCliente)
)
;



-- 
-- TABLE: DetalleVenta 
--

CREATE TABLE DetalleVenta(
    IDDetalle    INT            AUTO_INCREMENT,
    Cantidad     FLOAT(8, 0)    NOT NULL,
    Precio       FLOAT(8, 0)    NOT NULL,
    Total        FLOAT(8, 0)    NOT NULL,
    IDVenta      INT            NOT NULL,
    ID           INT            NOT NULL,
    PRIMARY KEY (IDDetalle)
)
;



-- 
-- TABLE: Documentos 
--

CREATE TABLE Documentos(
    IDDocumento    INT            AUTO_INCREMENT,
    Tipo           VARCHAR(25)    NOT NULL,
    Estado         BIT(1)         NOT NULL,
    Fecha          DATETIME       NOT NULL,
    IDProveedor    INT            NOT NULL,
    IDPago         INT            NOT NULL,
    PRIMARY KEY (IDDocumento)
)
;



-- 
-- TABLE: ErroresERP 
--

CREATE TABLE ErroresERP(
    IdErroresERP    INT             AUTO_INCREMENT,
    Timestamp       DATETIME        NOT NULL,
    Descripción     VARCHAR(500)    NOT NULL,
    PRIMARY KEY (IdErroresERP)
)
;



-- 
-- TABLE: Incidencia 
--

CREATE TABLE Incidencia(
    IncidenciaID        INT            AUTO_INCREMENT,
    TipoIncidenciaID    INT            NOT NULL,
    Clave               VARCHAR(10)    NOT NULL,
    Fecha               DATETIME,
    PRIMARY KEY (IncidenciaID, TipoIncidenciaID, Clave)
)
;



-- 
-- TABLE: Nomina 
--

CREATE TABLE Nomina(
    NominaID            INT            AUTO_INCREMENT,
    FechaEmision        DATETIME,
    PeriodoID           INT            NOT NULL,
    Empresa             VARCHAR(50)    NOT NULL,
    Movimiento          VARCHAR(50)    NOT NULL,
    UltimoCambio        DATETIME       NOT NULL,
    Moneda              VARCHAR(20)    NOT NULL,
    TipoCambio          FLOAT(8, 0),
    Usuario             VARCHAR(10)    NOT NULL,
    Estatus             VARCHAR(15)    NOT NULL,
    FechaCancelacion    DATETIME,
    FechaAlta           DATETIME       NOT NULL,
    PRIMARY KEY (NominaID)
)
;



-- 
-- TABLE: NominaDetalle 
--

CREATE TABLE NominaDetalle(
    Renglon              INT             NOT NULL,
    NominaID             INT             NOT NULL,
    SucursalID           INT             NOT NULL,
    Importe              FLOAT(8, 0),
    Horas                FLOAT(8, 0),
    Referencia           VARCHAR(100)    NOT NULL,
    FormaPago            VARCHAR(50)     NOT NULL,
    FechaDeposito        DATETIME,
    IncidenciaID         INT,
    Saldo                FLOAT(8, 0),
    CantidadPendiente    FLOAT(8, 0),
    TipoIncidenciaID     INT,
    Clave                VARCHAR(10),
    PRIMARY KEY (Renglon, NominaID, SucursalID)
)
;



-- 
-- TABLE: Notificaciones 
--

CREATE TABLE Notificaciones(
    IdNotificación    CHAR(10)        NOT NULL,
    IdUsuarios        INT             NOT NULL,
    IdPerfiles        INT             NOT NULL,
    Clave             VARCHAR(10)     NOT NULL,
    Contenido         VARCHAR(500)    NOT NULL,
    Leido             TINYINT         NOT NULL,
    PRIMARY KEY (IdNotificación, IdUsuarios, IdPerfiles, Clave)
)
;



-- 
-- TABLE: Pagos 
--

CREATE TABLE Pagos(
    IDPago    INT             AUTO_INCREMENT,
    Monto     FLOAT(8, 0)     NOT NULL,
    Fecha     DATETIME        NOT NULL,
    Autor     VARCHAR(150)    NOT NULL,
    PRIMARY KEY (IDPago)
)
;



-- 
-- TABLE: Perfiles 
--

CREATE TABLE Perfiles(
    IdPerfiles      INT            AUTO_INCREMENT,
    NombrePerfil    VARCHAR(50)    NOT NULL,
    PRIMARY KEY (IdPerfiles)
)
;



-- 
-- TABLE: PerfilesPermisos 
--

CREATE TABLE PerfilesPermisos(
    IdPerfilPermiso    CHAR(10)    NOT NULL,
    IdPerfiles         INT         NOT NULL,
    IdPermisos         INT         NOT NULL,
    PRIMARY KEY (IdPerfilPermiso, IdPerfiles, IdPermisos)
)
;



-- 
-- TABLE: Periodo 
--

CREATE TABLE Periodo(
    PeriodoID        INT            AUTO_INCREMENT,
    TipoPeriodoID    INT            NOT NULL,
    Anio             INT            NOT NULL,
    Mes              INT            NOT NULL,
    FechaInicio      DATETIME       NOT NULL,
    FechaFin         DATETIME       NOT NULL,
    Estatus          VARCHAR(15)    NOT NULL,
    PRIMARY KEY (PeriodoID, TipoPeriodoID)
)
;



-- 
-- TABLE: Permisos 
--

CREATE TABLE Permisos(
    IdPermisos        INT            AUTO_INCREMENT,
    NombrePermiso     VARCHAR(50)    NOT NULL,
    NombreCatálogo    VARCHAR(50)    NOT NULL,
    PRIMARY KEY (IdPermisos)
)
;



-- 
-- TABLE: Personal 
--

CREATE TABLE Personal(
    Clave                     VARCHAR(10)     NOT NULL,
    Nombre                    VARCHAR(100)    NOT NULL,
    ApellidoPaterno           VARCHAR(100)    NOT NULL,
    ApellidoMaterno           VARCHAR(100),
    Sexo                      VARCHAR(10)     NOT NULL,
    FechaNacimiento           DATETIME        NOT NULL,
    NNS                       VARCHAR(50),
    RFC                       VARCHAR(15),
    EstadoCivil               VARCHAR(15)     NOT NULL,
    NumeroContrato            VARCHAR(10),
    FechaContrato             DATETIME        NOT NULL,
    Puesto                    VARCHAR(50)     NOT NULL,
    Departamento              VARCHAR(50)     NOT NULL,
    FechaSeguro               DATETIME,
    FechaAlta                 DATETIME        NOT NULL,
    FechaBaja                 DATETIME,
    Sueldo                    FLOAT(8, 0)     NOT NULL,
    SalarioDiarioIntegrado    FLOAT(8, 0)     NOT NULL,
    Jornada                   VARCHAR(20)     NOT NULL,
    TipoContrato              VARCHAR(50)     NOT NULL,
    NumeroCuenta              VARCHAR(20),
    Banco                     VARCHAR(50),
    Direccion                 VARCHAR(100)    NOT NULL,
    NumeroExterior            VARCHAR(10)     NOT NULL,
    NumeroInterior            VARCHAR(10),
    Delegacion                VARCHAR(100),
    Colonia                   VARCHAR(100),
    Poblacion                 VARCHAR(100),
    Estado                    VARCHAR(100),
    Pais                      VARCHAR(100)    NOT NULL,
    CodigoPostal              VARCHAR(15)     NOT NULL,
    Telefono                  VARCHAR(15),
    Correo                    VARCHAR(100),
    PRIMARY KEY (Clave)
)
;



-- 
-- TABLE: Productos 
--

CREATE TABLE Productos(
    ID                INT             AUTO_INCREMENT,
    Nombre            VARCHAR(250)    NOT NULL,
    Descripcion       VARCHAR(500),
    PrecioUnitario    FLOAT(8, 0)     NOT NULL,
    PrecioMayoreo     FLOAT(8, 0)     NOT NULL,
    Stock             FLOAT(8, 0)     NOT NULL,
    IDAlmacen         INT             NOT NULL,
    IDCategoria       INT             NOT NULL,
    PRIMARY KEY (ID)
)
;



-- 
-- TABLE: Productos_Proveedores 
--

CREATE TABLE Productos_Proveedores(
    Clave_P_P      INT    AUTO_INCREMENT,
    ID             INT    NOT NULL,
    IDProveedor    INT    NOT NULL,
    PRIMARY KEY (Clave_P_P)
)
;



-- 
-- TABLE: Proveedores 
--

CREATE TABLE Proveedores(
    IDProveedor        INT             AUTO_INCREMENT,
    Nombre             VARCHAR(150)    NOT NULL,
    ApellidoPaterno    VARCHAR(150)    NOT NULL,
    ApellidoMaterno    VARCHAR(150)    NOT NULL,
    RFC                CHAR(50)        NOT NULL,
    Direccion          VARCHAR(250)    NOT NULL,
    Telefono           VARCHAR(25),
    Celular            VARCHAR(25),
    Email              VARCHAR(150),
    PRIMARY KEY (IDProveedor)
)
;



-- 
-- TABLE: Sucursal 
--

CREATE TABLE Sucursal(
    SucursalID          INT             AUTO_INCREMENT,
    Nombre              VARCHAR(100)    NOT NULL,
    Prefijo             VARCHAR(10),
    Direccion           VARCHAR(100)    NOT NULL,
    NumeroExterior      VARCHAR(10)     NOT NULL,
    NumeroInterior      VARCHAR(10),
    Delegacion          VARCHAR(100),
    Colonia             VARCHAR(100)    NOT NULL,
    Poblacion           VARCHAR(100),
    Estado              VARCHAR(100),
    Pais                VARCHAR(100),
    CodigoPostal        VARCHAR(15),
    Telefono            VARCHAR(15),
    Estatus             VARCHAR(15)     NOT NULL,
    FecchaAlta          DATETIME        NOT NULL,
    UltimoCambio        DATETIME        NOT NULL,
    PrecioEspecial      VARCHAR(20),
    CentroCostos        VARCHAR(10),
    AlmacenPrincipal    VARCHAR(10),
    FechaBaja           DATETIME,
    PRIMARY KEY (SucursalID)
)
;



-- 
-- TABLE: TipoIncidencia 
--

CREATE TABLE TipoIncidencia(
    TipoIncidenciaID    INT             AUTO_INCREMENT,
    Descripcion         VARCHAR(100)    NOT NULL,
    Concepto            VARCHAR(50)     NOT NULL,
    Movimiento          VARCHAR(50)     NOT NULL,
    PRIMARY KEY (TipoIncidenciaID)
)
;



-- 
-- TABLE: TipoPeriodo 
--

CREATE TABLE TipoPeriodo(
    TipoPeriodoID    INT             AUTO_INCREMENT,
    Descripcion      VARCHAR(100)    NOT NULL,
    Dias             INT             NOT NULL,
    PRIMARY KEY (TipoPeriodoID)
)
;



-- 
-- TABLE: Usuarios 
--

CREATE TABLE Usuarios(
    IdUsuarios       INT            AUTO_INCREMENT,
    IdPerfiles       INT            NOT NULL,
    Clave            VARCHAR(10)    NOT NULL,
    NombreUsuario    VARCHAR(50)    NOT NULL,
    HashContra       VARCHAR(50)    NOT NULL,
    PRIMARY KEY (IdUsuarios, IdPerfiles, Clave)
)
;



-- 
-- TABLE: Vacaciones 
--

CREATE TABLE Vacaciones(
    ID                      INT            AUTO_INCREMENT,
    Clave                   VARCHAR(10)    NOT NULL,
    FechaFin                DATETIME       NOT NULL,
    FechaInicio             DATETIME       NOT NULL,
    DiasTomados             INT            NOT NULL,
    DiasCorrespondientes    INT            NOT NULL,
    PRIMARY KEY (ID, Clave)
)
;



-- 
-- TABLE: Venta 
--

CREATE TABLE Venta(
    IDVenta         INT            AUTO_INCREMENT,
    Fehca           DATETIME       NOT NULL,
    Descuento       FLOAT(8, 0)    DEFAULT 0 NOT NULL,
    TotalGeneral    FLOAT(8, 0)    NOT NULL,
    TipoPago        VARCHAR(75)    NOT NULL,
    IDCliente       INT            NOT NULL,
    Clave           VARCHAR(10)    NOT NULL,
    PRIMARY KEY (IDVenta)
)
;



-- 
-- TABLE: BitácoraERP 
--

ALTER TABLE BitácoraERP ADD CONSTRAINT RefUsuarios62 
    FOREIGN KEY (IdPerfiles, IdUsuarios, Clave)
    REFERENCES Usuarios(IdUsuarios, IdPerfiles, Clave)
;

ALTER TABLE BitácoraERP ADD CONSTRAINT RefErroresERP64 
    FOREIGN KEY (IdErroresERP)
    REFERENCES ErroresERP(IdErroresERP)
;


-- 
-- TABLE: DetalleVenta 
--

ALTER TABLE DetalleVenta ADD CONSTRAINT RefVenta39 
    FOREIGN KEY (IDVenta)
    REFERENCES Venta(IDVenta)
;

ALTER TABLE DetalleVenta ADD CONSTRAINT RefProductos40 
    FOREIGN KEY (ID)
    REFERENCES Productos(ID)
;


-- 
-- TABLE: Documentos 
--

ALTER TABLE Documentos ADD CONSTRAINT RefPagos60 
    FOREIGN KEY (IDPago)
    REFERENCES Pagos(IDPago)
;

ALTER TABLE Documentos ADD CONSTRAINT RefProveedores22 
    FOREIGN KEY (IDProveedor)
    REFERENCES Proveedores(IDProveedor)
;


-- 
-- TABLE: Incidencia 
--

ALTER TABLE Incidencia ADD CONSTRAINT RefTipoIncidencia52 
    FOREIGN KEY (TipoIncidenciaID)
    REFERENCES TipoIncidencia(TipoIncidenciaID)
;

ALTER TABLE Incidencia ADD CONSTRAINT RefPersonal53 
    FOREIGN KEY (Clave)
    REFERENCES Personal(Clave)
;


-- 
-- TABLE: NominaDetalle 
--

ALTER TABLE NominaDetalle ADD CONSTRAINT RefSucursal55 
    FOREIGN KEY (SucursalID)
    REFERENCES Sucursal(SucursalID)
;

ALTER TABLE NominaDetalle ADD CONSTRAINT RefNomina56 
    FOREIGN KEY (NominaID)
    REFERENCES Nomina(NominaID)
;

ALTER TABLE NominaDetalle ADD CONSTRAINT RefIncidencia57 
    FOREIGN KEY (IncidenciaID, TipoIncidenciaID, Clave)
    REFERENCES Incidencia(IncidenciaID, TipoIncidenciaID, Clave)
;

ALTER TABLE NominaDetalle ADD CONSTRAINT RefPersonal58 
    FOREIGN KEY (Clave)
    REFERENCES Personal(Clave)
;


-- 
-- TABLE: Notificaciones 
--

ALTER TABLE Notificaciones ADD CONSTRAINT RefUsuarios72 
    FOREIGN KEY (IdUsuarios, IdPerfiles, Clave)
    REFERENCES Usuarios(IdUsuarios, IdPerfiles, Clave)
;


-- 
-- TABLE: PerfilesPermisos 
--

ALTER TABLE PerfilesPermisos ADD CONSTRAINT RefPerfiles68 
    FOREIGN KEY (IdPerfiles)
    REFERENCES Perfiles(IdPerfiles)
;

ALTER TABLE PerfilesPermisos ADD CONSTRAINT RefPermisos69 
    FOREIGN KEY (IdPermisos)
    REFERENCES Permisos(IdPermisos)
;


-- 
-- TABLE: Periodo 
--

ALTER TABLE Periodo ADD CONSTRAINT RefTipoPeriodo51 
    FOREIGN KEY (TipoPeriodoID)
    REFERENCES TipoPeriodo(TipoPeriodoID)
;


-- 
-- TABLE: Productos 
--

ALTER TABLE Productos ADD CONSTRAINT RefAlmacenes20 
    FOREIGN KEY (IDAlmacen)
    REFERENCES Almacenes(IDAlmacen)
;

ALTER TABLE Productos ADD CONSTRAINT RefCategorias74 
    FOREIGN KEY (IDCategoria)
    REFERENCES Categorias(IDCategoria)
;


-- 
-- TABLE: Productos_Proveedores 
--

ALTER TABLE Productos_Proveedores ADD CONSTRAINT RefProductos18 
    FOREIGN KEY (ID)
    REFERENCES Productos(ID)
;

ALTER TABLE Productos_Proveedores ADD CONSTRAINT RefProveedores19 
    FOREIGN KEY (IDProveedor)
    REFERENCES Proveedores(IDProveedor)
;


-- 
-- TABLE: Usuarios 
--

ALTER TABLE Usuarios ADD CONSTRAINT RefPerfiles63 
    FOREIGN KEY (IdPerfiles)
    REFERENCES Perfiles(IdPerfiles)
;

ALTER TABLE Usuarios ADD CONSTRAINT RefPersonal71 
    FOREIGN KEY (Clave)
    REFERENCES Personal(Clave)
;


-- 
-- TABLE: Vacaciones 
--

ALTER TABLE Vacaciones ADD CONSTRAINT RefPersonal54 
    FOREIGN KEY (Clave)
    REFERENCES Personal(Clave)
;


-- 
-- TABLE: Venta 
--

ALTER TABLE Venta ADD CONSTRAINT RefPersonal59 
    FOREIGN KEY (Clave)
    REFERENCES Personal(Clave)
;

ALTER TABLE Venta ADD CONSTRAINT RefClientes38 
    FOREIGN KEY (IDCliente)
    REFERENCES Clientes(IDCliente)
;


