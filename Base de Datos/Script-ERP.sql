--
-- ER/Studio 8.0 SQL Code Generation
-- Company :      Developers
-- Project :      Modelo-Inventario.DM1
-- Author :       Adrian Cox
--
-- Date Created : Monday, November 27, 2017 19:29:48
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
-- TABLE: Banco 
--

CREATE TABLE Banco(
    BancoID    INT             AUTO_INCREMENT,
    Nombre     VARCHAR(100),
    RFC        VARCHAR(15),
    PRIMARY KEY (BancoID)
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
    Timestamp        DATETIME,
    Acción           VARCHAR(20)    NOT NULL,
    PRIMARY KEY (IdBitácoraERP, IdErroresERP, IdPerfiles, IdUsuarios)
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
-- TABLE: ConceptosNomina 
--

CREATE TABLE ConceptosNomina(
    ConceptoID    INT            NOT NULL,
    Concepto      VARCHAR(50),
    PRIMARY KEY (ConceptoID)
)
;



-- 
-- TABLE: Cuenta 
--

CREATE TABLE Cuenta(
    NumeroCuenta     INT            NOT NULL,
    CuentaClave      VARCHAR(50),
    Personal         VARCHAR(10),
    NumeroTarjeta    INT,
    Clave            VARCHAR(10)    NOT NULL,
    BancoID          INT,
    PRIMARY KEY (NumeroCuenta)
)
;



-- 
-- TABLE: CxC 
--

CREATE TABLE CxC(
    IDCobrar      INT             AUTO_INCREMENT,
    AtrasoPago    INT             NOT NULL,
    Abono         FLOAT(8, 0)     NOT NULL,
    Saldo         FLOAT(8, 0)     NOT NULL,
    FechaPago     DATETIME        NOT NULL,
    Plazo         VARCHAR(100)    NOT NULL,
    IDDetalle     INT             NOT NULL,
    PRIMARY KEY (IDCobrar)
)
;



-- 
-- TABLE: DetalleVenta 
--

CREATE TABLE DetalleVenta(
    IDDetalle    INT            AUTO_INCREMENT,
    Cantidad     FLOAT(8, 0)    NOT NULL,
    Precio       FLOAT(8, 0)    NOT NULL,
    Descuento    FLOAT(8, 0),
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
-- TABLE: Estatus 
--

CREATE TABLE Estatus(
    EstatusID      INT            AUTO_INCREMENT,
    Descripcion    VARCHAR(20),
    PRIMARY KEY (EstatusID)
)
;



-- 
-- TABLE: Incidencia 
--

CREATE TABLE Incidencia(
    IncidenciaID        INT         AUTO_INCREMENT,
    Fecha               DATETIME,
    TipoIncidenciaID    INT         NOT NULL,
    PRIMARY KEY (IncidenciaID)
)
;



-- 
-- TABLE: Jornada 
--

CREATE TABLE Jornada(
    JornadaID     INT            AUTO_INCREMENT,
    Turno         VARCHAR(50),
    HoraInicio    DATETIME,
    HoraFin       DATETIME,
    PRIMARY KEY (JornadaID)
)
;



-- 
-- TABLE: Movimientos 
--

CREATE TABLE Movimientos(
    ClaveBitacora    INT                      AUTO_INCREMENT,
    Usuario          INT                      NOT NULL,
    Observaciones    NATIONAL VARCHAR(700),
    Accion           VARCHAR(150)             NOT NULL,
    Fecha            DATETIME                 NOT NULL,
    Cantidad         INT                      NOT NULL,
    ID               INT                      NOT NULL,
    PRIMARY KEY (ClaveBitacora)
)
;



-- 
-- TABLE: Nomina 
--

CREATE TABLE Nomina(
    NominaID            INT            AUTO_INCREMENT,
    PeriodoID           INT            NOT NULL,
    FechaEmision        DATETIME,
    Empresa             VARCHAR(50)    NOT NULL,
    Movimiento          VARCHAR(50)    NOT NULL,
    UltimoCambio        DATETIME       NOT NULL,
    Moneda              VARCHAR(20)    NOT NULL,
    TipoCambio          FLOAT(8, 0),
    Usuario             VARCHAR(10)    NOT NULL,
    FechaCancelacion    DATETIME,
    FechaAlta           DATETIME       NOT NULL,
    EstatusID           INT            NOT NULL,
    PRIMARY KEY (NominaID)
)
;



-- 
-- TABLE: NominaDetalle 
--

CREATE TABLE NominaDetalle(
    Renglon              INT             NOT NULL,
    Importe              FLOAT(8, 0),
    Horas                FLOAT(8, 0),
    Referencia           VARCHAR(100)    NOT NULL,
    FormaPago            VARCHAR(50)     NOT NULL,
    FechaDeposito        DATETIME,
    IncidenciaID         INT,
    Saldo                FLOAT(8, 0),
    CantidadPendiente    FLOAT(8, 0),
    NominaID             INT             NOT NULL,
    SucursalID           INT             NOT NULL,
    ConceptoID           INT             NOT NULL,
    PRIMARY KEY (Renglon)
)
;



-- 
-- TABLE: Notificaciones 
--

CREATE TABLE Notificaciones(
    IdNotificación    CHAR(10)        NOT NULL,
    IdUsuarios        INT             NOT NULL,
    IdPerfiles        INT             NOT NULL,
    Contenido         VARCHAR(500)    NOT NULL,
    Leido             TINYINT         NOT NULL,
    PRIMARY KEY (IdNotificación, IdUsuarios, IdPerfiles)
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
    PeriodoID        INT         AUTO_INCREMENT,
    Anio             INT         NOT NULL,
    Mes              INT         NOT NULL,
    FechaInicio      DATETIME    NOT NULL,
    FechaFin         DATETIME    NOT NULL,
    TipoPeriodoID    INT         NOT NULL,
    EstatusID        INT         NOT NULL,
    PRIMARY KEY (PeriodoID)
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
    TipoContrato              VARCHAR(50)     NOT NULL,
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
    EstatusID                 INT             NOT NULL,
    JornadaID                 INT             NOT NULL,
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
    Cantidad          INT             NOT NULL,
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
    FecchaAlta          DATETIME        NOT NULL,
    UltimoCambio        DATETIME        NOT NULL,
    PrecioEspecial      VARCHAR(20),
    CentroCostos        VARCHAR(10),
    AlmacenPrincipal    VARCHAR(10),
    FechaBaja           DATETIME,
    EstatusID           INT             NOT NULL,
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
    NombreUsuario    VARCHAR(50)    NOT NULL,
    HashContra       VARCHAR(50)    NOT NULL,
    Clave            VARCHAR(10)    NOT NULL,
    PRIMARY KEY (IdUsuarios, IdPerfiles)
)
;



-- 
-- TABLE: Vacaciones 
--

CREATE TABLE Vacaciones(
    ID                      INT            AUTO_INCREMENT,
    FechaFin                DATETIME       NOT NULL,
    FechaInicio             DATETIME       NOT NULL,
    DiasTomados             INT            NOT NULL,
    DiasCorrespondientes    INT            NOT NULL,
    Clave                   VARCHAR(10)    NOT NULL,
    PRIMARY KEY (ID)
)
;



-- 
-- TABLE: Venta 
--

CREATE TABLE Venta(
    IDVenta         INT            AUTO_INCREMENT,
    FechaCompra     DATETIME       NOT NULL,
    FechaCobro      DATETIME       NOT NULL,
    LimitePago      INT            NOT NULL,
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
    FOREIGN KEY (IdPerfiles, IdUsuarios)
    REFERENCES Usuarios(IdUsuarios, IdPerfiles)
;

ALTER TABLE BitácoraERP ADD CONSTRAINT RefErroresERP64 
    FOREIGN KEY (IdErroresERP)
    REFERENCES ErroresERP(IdErroresERP)
;


-- 
-- TABLE: Cuenta 
--

ALTER TABLE Cuenta ADD CONSTRAINT RefPersonal76 
    FOREIGN KEY (Clave)
    REFERENCES Personal(Clave)
;

ALTER TABLE Cuenta ADD CONSTRAINT RefBanco77 
    FOREIGN KEY (BancoID)
    REFERENCES Banco(BancoID)
;


-- 
-- TABLE: CxC 
--

ALTER TABLE CxC ADD CONSTRAINT RefDetalleVenta92 
    FOREIGN KEY (IDDetalle)
    REFERENCES DetalleVenta(IDDetalle)
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

ALTER TABLE Incidencia ADD CONSTRAINT RefTipoIncidencia79 
    FOREIGN KEY (TipoIncidenciaID)
    REFERENCES TipoIncidencia(TipoIncidenciaID)
;


-- 
-- TABLE: Movimientos 
--

ALTER TABLE Movimientos ADD CONSTRAINT RefProductos94 
    FOREIGN KEY (ID)
    REFERENCES Productos(ID)
;


-- 
-- TABLE: Nomina 
--

ALTER TABLE Nomina ADD CONSTRAINT RefPeriodo80 
    FOREIGN KEY (PeriodoID)
    REFERENCES Periodo(PeriodoID)
;

ALTER TABLE Nomina ADD CONSTRAINT RefEstatus86 
    FOREIGN KEY (EstatusID)
    REFERENCES Estatus(EstatusID)
;


-- 
-- TABLE: NominaDetalle 
--

ALTER TABLE NominaDetalle ADD CONSTRAINT RefNomina81 
    FOREIGN KEY (NominaID)
    REFERENCES Nomina(NominaID)
;

ALTER TABLE NominaDetalle ADD CONSTRAINT RefSucursal82 
    FOREIGN KEY (SucursalID)
    REFERENCES Sucursal(SucursalID)
;

ALTER TABLE NominaDetalle ADD CONSTRAINT RefConceptosNomina83 
    FOREIGN KEY (ConceptoID)
    REFERENCES ConceptosNomina(ConceptoID)
;

ALTER TABLE NominaDetalle ADD CONSTRAINT RefIncidencia89 
    FOREIGN KEY (IncidenciaID)
    REFERENCES Incidencia(IncidenciaID)
;


-- 
-- TABLE: Notificaciones 
--

ALTER TABLE Notificaciones ADD CONSTRAINT RefUsuarios72 
    FOREIGN KEY (IdUsuarios, IdPerfiles)
    REFERENCES Usuarios(IdUsuarios, IdPerfiles)
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

ALTER TABLE Periodo ADD CONSTRAINT RefTipoPeriodo75 
    FOREIGN KEY (TipoPeriodoID)
    REFERENCES TipoPeriodo(TipoPeriodoID)
;

ALTER TABLE Periodo ADD CONSTRAINT RefEstatus85 
    FOREIGN KEY (EstatusID)
    REFERENCES Estatus(EstatusID)
;


-- 
-- TABLE: Personal 
--

ALTER TABLE Personal ADD CONSTRAINT RefEstatus84 
    FOREIGN KEY (EstatusID)
    REFERENCES Estatus(EstatusID)
;

ALTER TABLE Personal ADD CONSTRAINT RefJornada88 
    FOREIGN KEY (JornadaID)
    REFERENCES Jornada(JornadaID)
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
-- TABLE: Sucursal 
--

ALTER TABLE Sucursal ADD CONSTRAINT RefEstatus87 
    FOREIGN KEY (EstatusID)
    REFERENCES Estatus(EstatusID)
;


-- 
-- TABLE: Usuarios 
--

ALTER TABLE Usuarios ADD CONSTRAINT RefPersonal91 
    FOREIGN KEY (Clave)
    REFERENCES Personal(Clave)
;

ALTER TABLE Usuarios ADD CONSTRAINT RefPerfiles63 
    FOREIGN KEY (IdPerfiles)
    REFERENCES Perfiles(IdPerfiles)
;


-- 
-- TABLE: Vacaciones 
--

ALTER TABLE Vacaciones ADD CONSTRAINT RefPersonal78 
    FOREIGN KEY (Clave)
    REFERENCES Personal(Clave)
;


-- 
-- TABLE: Venta 
--

ALTER TABLE Venta ADD CONSTRAINT RefClientes38 
    FOREIGN KEY (IDCliente)
    REFERENCES Clientes(IDCliente)
;

ALTER TABLE Venta ADD CONSTRAINT RefPersonal90 
    FOREIGN KEY (Clave)
    REFERENCES Personal(Clave)
;


