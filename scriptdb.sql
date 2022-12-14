USE [master]
GO
/****** Object:  Database [inventarios]    Script Date: 18/08/2020 08:46:24 a. m. ******/
CREATE DATABASE [inventarios]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'inventarios', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.DEVCOFEMER\MSSQL\DATA\inventarios.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'inventarios_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.DEVCOFEMER\MSSQL\DATA\inventarios_log.ldf' , SIZE = 3136KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [inventarios] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [inventarios].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [inventarios] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [inventarios] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [inventarios] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [inventarios] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [inventarios] SET ARITHABORT OFF 
GO
ALTER DATABASE [inventarios] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [inventarios] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [inventarios] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [inventarios] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [inventarios] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [inventarios] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [inventarios] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [inventarios] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [inventarios] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [inventarios] SET  DISABLE_BROKER 
GO
ALTER DATABASE [inventarios] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [inventarios] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [inventarios] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [inventarios] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [inventarios] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [inventarios] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [inventarios] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [inventarios] SET RECOVERY FULL 
GO
ALTER DATABASE [inventarios] SET  MULTI_USER 
GO
ALTER DATABASE [inventarios] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [inventarios] SET DB_CHAINING OFF 
GO
ALTER DATABASE [inventarios] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [inventarios] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [inventarios] SET DELAYED_DURABILITY = DISABLED 
GO
USE [inventarios]
GO
/****** Object:  Table [dbo].[Anexos]    Script Date: 18/08/2020 08:46:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Anexos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Archivo] [varchar](150) NOT NULL,
	[Producto_Id] [int] NULL,
	[Estatus] [bit] NOT NULL,
 CONSTRAINT [PK_Anexos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Catalogos]    Script Date: 18/08/2020 08:46:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Catalogos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Catalogo] [varchar](50) NOT NULL,
	[Valor] [varchar](250) NOT NULL,
	[Activo] [bit] NOT NULL,
 CONSTRAINT [PK_Catalogos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Compras]    Script Date: 18/08/2020 08:46:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Compras](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Compra] [varchar](250) NULL,
	[Empresa_Id] [int] NOT NULL,
	[CostoNeto] [numeric](18, 2) NULL,
	[Impuesto] [numeric](18, 2) NULL,
	[CostoTotal] [numeric](18, 2) NULL,
	[Fecha] [datetime] NOT NULL,
	[Activo] [bit] NOT NULL,
	[Usuario_Id] [int] NULL,
 CONSTRAINT [PK_Compras] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ComprasProductos]    Script Date: 18/08/2020 08:46:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ComprasProductos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Producto_Id] [int] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[PrecioUnitario] [numeric](18, 2) NOT NULL,
	[PrecioNeto] [numeric](18, 2) NOT NULL,
	[Compra_Id] [int] NOT NULL,
	[PrecioTotal] [numeric](18, 2) NOT NULL,
	[Activo] [bit] NOT NULL,
 CONSTRAINT [PK_ComprasProductos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Empresas]    Script Date: 18/08/2020 08:46:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Empresas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NombreEmpresa] [varchar](250) NOT NULL,
	[CorreoElectronico] [varchar](150) NOT NULL,
	[Telefono] [varchar](50) NOT NULL,
	[Moneda] [varchar](5) NULL,
	[ZonaHoraria_Id] [int] NULL,
	[Logo] [varchar](50) NULL,
	[Direccion] [varchar](250) NULL,
	[Tipo_Id] [int] NOT NULL,
	[Estatus] [bit] NULL CONSTRAINT [DF_Empresas_Estatus]  DEFAULT ((1)),
 CONSTRAINT [PK_Configuracion] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Impuestos]    Script Date: 18/08/2020 08:46:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Impuestos](
	[Id] [int] NOT NULL,
	[Impuesto] [varchar](50) NOT NULL,
	[Porcentaje] [numeric](18, 2) NOT NULL,
	[Monto] [numeric](18, 2) NOT NULL,
	[Venta_Id] [int] NULL,
	[Compra_Id] [int] NULL,
	[Estatus] [bit] NOT NULL,
 CONSTRAINT [PK_Impuestos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Permisos]    Script Date: 18/08/2020 08:46:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Permisos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Grupo_Id] [int] NOT NULL,
	[Modificar] [varchar](50) NOT NULL,
	[Editar] [varchar](50) NOT NULL,
	[Eliminar] [varchar](50) NOT NULL,
	[Activo] [bit] NOT NULL,
 CONSTRAINT [PK_Permisos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 18/08/2020 08:46:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Productos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Codigo] [varchar](50) NOT NULL,
	[Nombre] [varchar](150) NULL,
	[Descripcion] [varchar](450) NULL,
	[Marca] [varchar](150) NULL,
	[Modelo] [varchar](150) NULL,
	[UnidadMedida] [varchar](150) NULL,
	[Estatus] [bit] NULL,
	[Costo] [numeric](18, 2) NULL,
	[Utilidad] [int] NULL,
	[PrecioVenta] [numeric](18, 2) NULL,
	[Stock] [int] NULL,
	[FechaRegistro] [date] NULL,
	[FechaActivo] [datetime] NULL,
 CONSTRAINT [PK_Productos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Productos_Empresas]    Script Date: 18/08/2020 08:46:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos_Empresas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Producto_Id] [int] NOT NULL,
	[Empresa_Id] [int] NOT NULL,
	[Estatus] [bit] NOT NULL,
 CONSTRAINT [PK_Productos_Empresas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 18/08/2020 08:46:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usuarios](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CorreoElectronico] [varchar](150) NOT NULL,
	[Password] [varchar](500) NOT NULL,
	[EmpresaId] [int] NOT NULL,
	[Telefono] [varchar](50) NOT NULL,
	[Nombres] [varchar](250) NOT NULL,
	[Fecha] [date] NOT NULL,
	[Activo] [bit] NOT NULL,
	[Rol_Id] [int] NOT NULL,
	[Token] [varchar](500) NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ventas]    Script Date: 18/08/2020 08:46:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ventas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Venta] [varchar](50) NOT NULL,
	[Cliente_Id] [int] NOT NULL,
	[Producto_Id] [int] NOT NULL,
	[CostoUnitario] [numeric](18, 2) NULL,
	[CostoTotal] [numeric](18, 2) NULL,
	[CostoNeto] [numeric](18, 2) NULL,
	[GranTotal] [numeric](18, 2) NULL,
	[Fecha] [datetime] NOT NULL,
	[Cantidad] [numeric](18, 3) NOT NULL,
 CONSTRAINT [PK_Ventas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[vCompras]    Script Date: 18/08/2020 08:46:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vCompras]
AS
SELECT        dbo.Compras.Id, dbo.Compras.Compra, dbo.Compras.Empresa_Id, dbo.Empresas.NombreEmpresa, dbo.Empresas.CorreoElectronico, dbo.Empresas.Telefono, dbo.Compras.Fecha, dbo.Usuarios.Nombres, 
                         dbo.Compras.CostoNeto, dbo.Compras.CostoTotal, dbo.Compras.Impuesto, dbo.Compras.Activo
FROM            dbo.Compras INNER JOIN
                         dbo.Empresas ON dbo.Compras.Empresa_Id = dbo.Empresas.Id INNER JOIN
                         dbo.Usuarios ON dbo.Compras.Usuario_Id = dbo.Usuarios.Id

GO
SET IDENTITY_INSERT [dbo].[Anexos] ON 

INSERT [dbo].[Anexos] ([Id], [Archivo], [Producto_Id], [Estatus]) VALUES (1, N'Prod_201812178460780.png', 4, 0)
INSERT [dbo].[Anexos] ([Id], [Archivo], [Producto_Id], [Estatus]) VALUES (2, N'Prod_201812178461891.jpg', 4, 0)
INSERT [dbo].[Anexos] ([Id], [Archivo], [Producto_Id], [Estatus]) VALUES (3, N'Prod_201812178463242.jpg', 4, 0)
INSERT [dbo].[Anexos] ([Id], [Archivo], [Producto_Id], [Estatus]) VALUES (4, N'Prod_201812189714928.jpg', 6, 1)
INSERT [dbo].[Anexos] ([Id], [Archivo], [Producto_Id], [Estatus]) VALUES (5, N'Prod_2018121891034120.jpg', 7, 1)
INSERT [dbo].[Anexos] ([Id], [Archivo], [Producto_Id], [Estatus]) VALUES (6, N'Prod_2018121891856977.jpg', 8, 1)
INSERT [dbo].[Anexos] ([Id], [Archivo], [Producto_Id], [Estatus]) VALUES (7, N'Prod_2018121892315884.jpg', 9, 1)
INSERT [dbo].[Anexos] ([Id], [Archivo], [Producto_Id], [Estatus]) VALUES (8, N'Prod_2018121892536591.jpg', 10, 1)
INSERT [dbo].[Anexos] ([Id], [Archivo], [Producto_Id], [Estatus]) VALUES (9, N'Prod_2018121893126295.jpg', 11, 1)
INSERT [dbo].[Anexos] ([Id], [Archivo], [Producto_Id], [Estatus]) VALUES (10, N'Prod_201812178460780.png', 4, 0)
INSERT [dbo].[Anexos] ([Id], [Archivo], [Producto_Id], [Estatus]) VALUES (11, N'Prod_201812178463242.jpg', 4, 0)
INSERT [dbo].[Anexos] ([Id], [Archivo], [Producto_Id], [Estatus]) VALUES (12, N'Prod_201812178460780.png', 4, 0)
INSERT [dbo].[Anexos] ([Id], [Archivo], [Producto_Id], [Estatus]) VALUES (13, N'Prod_201812178463242.jpg', 4, 0)
INSERT [dbo].[Anexos] ([Id], [Archivo], [Producto_Id], [Estatus]) VALUES (14, N'Prod_201812178460780.png', 4, 0)
INSERT [dbo].[Anexos] ([Id], [Archivo], [Producto_Id], [Estatus]) VALUES (15, N'Prod_201812178463242.jpg', 4, 0)
INSERT [dbo].[Anexos] ([Id], [Archivo], [Producto_Id], [Estatus]) VALUES (16, N'Prod_201812178460780.png', 4, 0)
INSERT [dbo].[Anexos] ([Id], [Archivo], [Producto_Id], [Estatus]) VALUES (17, N'Prod_201812178463242.jpg', 4, 0)
INSERT [dbo].[Anexos] ([Id], [Archivo], [Producto_Id], [Estatus]) VALUES (18, N'Prod_201812178460780.png', 4, 0)
INSERT [dbo].[Anexos] ([Id], [Archivo], [Producto_Id], [Estatus]) VALUES (19, N'Prod_201812178463242.jpg', 4, 0)
INSERT [dbo].[Anexos] ([Id], [Archivo], [Producto_Id], [Estatus]) VALUES (20, N'Prod_201812178460780.png', 4, 0)
INSERT [dbo].[Anexos] ([Id], [Archivo], [Producto_Id], [Estatus]) VALUES (21, N'Prod_201812178463242.jpg', 4, 0)
INSERT [dbo].[Anexos] ([Id], [Archivo], [Producto_Id], [Estatus]) VALUES (22, N'Prod_201812178460780.png', 4, 0)
INSERT [dbo].[Anexos] ([Id], [Archivo], [Producto_Id], [Estatus]) VALUES (23, N'Prod_201812178463242.jpg', 4, 0)
INSERT [dbo].[Anexos] ([Id], [Archivo], [Producto_Id], [Estatus]) VALUES (24, N'Prod_201812178460780.png', 4, 1)
INSERT [dbo].[Anexos] ([Id], [Archivo], [Producto_Id], [Estatus]) VALUES (25, N'Prod_201812178463242.jpg', 4, 1)
SET IDENTITY_INSERT [dbo].[Anexos] OFF
SET IDENTITY_INSERT [dbo].[Catalogos] ON 

INSERT [dbo].[Catalogos] ([Id], [Catalogo], [Valor], [Activo]) VALUES (1, N'Roles', N'Administrador', 1)
INSERT [dbo].[Catalogos] ([Id], [Catalogo], [Valor], [Activo]) VALUES (2, N'Tipo Empresa', N'Proveedor', 1)
INSERT [dbo].[Catalogos] ([Id], [Catalogo], [Valor], [Activo]) VALUES (3, N'Tipo Empresa', N'Cliente', 1)
INSERT [dbo].[Catalogos] ([Id], [Catalogo], [Valor], [Activo]) VALUES (4, N'Roles', N'Clientes', 1)
INSERT [dbo].[Catalogos] ([Id], [Catalogo], [Valor], [Activo]) VALUES (5, N'Roles', N'Contacto Proveedor', 1)
INSERT [dbo].[Catalogos] ([Id], [Catalogo], [Valor], [Activo]) VALUES (6, N'Zona Horaria', N'UTC-10 (HST - Hawaiian Standard Time)', 1)
INSERT [dbo].[Catalogos] ([Id], [Catalogo], [Valor], [Activo]) VALUES (7, N'Zona Horaria', N'UTC-9 (AKST - Alaska Standard Time)', 1)
INSERT [dbo].[Catalogos] ([Id], [Catalogo], [Valor], [Activo]) VALUES (8, N'Zona Horaria', N'UTC-8 (PST - Pacific Standard Time)', 1)
INSERT [dbo].[Catalogos] ([Id], [Catalogo], [Valor], [Activo]) VALUES (9, N'Zona Horaria', N'UTC-7 (MST - Mountain Standard Time)', 1)
INSERT [dbo].[Catalogos] ([Id], [Catalogo], [Valor], [Activo]) VALUES (10, N'Zona Horaria', N'UTC-6 (CST - Central Standard Time, tiempo central americano)', 1)
INSERT [dbo].[Catalogos] ([Id], [Catalogo], [Valor], [Activo]) VALUES (11, N'Zona Horaria', N'UTC-5 (EST - Eastern Standard Time, tiempo estándar del este)', 1)
INSERT [dbo].[Catalogos] ([Id], [Catalogo], [Valor], [Activo]) VALUES (12, N'Zona Horaria', N'UTC-4 (AST - Atlantic Standard Time, tiempo estándar de la costa atlántica)', 1)
INSERT [dbo].[Catalogos] ([Id], [Catalogo], [Valor], [Activo]) VALUES (13, N'Zona Horaria', N'UTC (WET - Western European Time, tiempo de Europa occidental, también llamado GMT)', 1)
INSERT [dbo].[Catalogos] ([Id], [Catalogo], [Valor], [Activo]) VALUES (14, N'Moneda', N'Peso Mexicano', 1)
INSERT [dbo].[Catalogos] ([Id], [Catalogo], [Valor], [Activo]) VALUES (15, N'Moneda', N'Dolar Americano', 1)
SET IDENTITY_INSERT [dbo].[Catalogos] OFF
SET IDENTITY_INSERT [dbo].[Empresas] ON 

INSERT [dbo].[Empresas] ([Id], [NombreEmpresa], [CorreoElectronico], [Telefono], [Moneda], [ZonaHoraria_Id], [Logo], [Direccion], [Tipo_Id], [Estatus]) VALUES (1, N'Prueba', N'jiestrada@live.com.mx', N'5454', N'Peso', 6, N'', N'', 2, 0)
INSERT [dbo].[Empresas] ([Id], [NombreEmpresa], [CorreoElectronico], [Telefono], [Moneda], [ZonaHoraria_Id], [Logo], [Direccion], [Tipo_Id], [Estatus]) VALUES (2, N'Empresa Patito', N'jiestrada@live.com.mx', N'', N'MX', NULL, N'', N'', 2, 0)
INSERT [dbo].[Empresas] ([Id], [NombreEmpresa], [CorreoElectronico], [Telefono], [Moneda], [ZonaHoraria_Id], [Logo], [Direccion], [Tipo_Id], [Estatus]) VALUES (3, N'Abarrotes Patito', N'jiestrada@live.com.mx', N'', N'MX', NULL, N'', N'', 2, 0)
INSERT [dbo].[Empresas] ([Id], [NombreEmpresa], [CorreoElectronico], [Telefono], [Moneda], [ZonaHoraria_Id], [Logo], [Direccion], [Tipo_Id], [Estatus]) VALUES (4, N'Abarrotes Patito', N'jiestrada@live.com.mx', N'', N'MX', NULL, N'', N'', 2, 0)
INSERT [dbo].[Empresas] ([Id], [NombreEmpresa], [CorreoElectronico], [Telefono], [Moneda], [ZonaHoraria_Id], [Logo], [Direccion], [Tipo_Id], [Estatus]) VALUES (5, N'Abarrotes Patito 2', N'jiestrada@live.com.mx', N'1111', N'14', 10, N'Proveed_202018191950847.png', N'CDMX', 2, 1)
INSERT [dbo].[Empresas] ([Id], [NombreEmpresa], [CorreoElectronico], [Telefono], [Moneda], [ZonaHoraria_Id], [Logo], [Direccion], [Tipo_Id], [Estatus]) VALUES (12, N'Estrada Web Group', N'jose.estrada.hdz@outlook.com', N'', N'MX', NULL, N'', N'', 2, 0)
INSERT [dbo].[Empresas] ([Id], [NombreEmpresa], [CorreoElectronico], [Telefono], [Moneda], [ZonaHoraria_Id], [Logo], [Direccion], [Tipo_Id], [Estatus]) VALUES (13, N'Estrada Web Group', N'jose.estrada.hdz@outlook.com', N'5528544', N'14', NULL, N'Proveed_202018193352592.png', N'Ciudad de Mexico', 2, 1)
INSERT [dbo].[Empresas] ([Id], [NombreEmpresa], [CorreoElectronico], [Telefono], [Moneda], [ZonaHoraria_Id], [Logo], [Direccion], [Tipo_Id], [Estatus]) VALUES (14, N'Estrada Web Group', N'jose.estrada.hdz@outlook.com', N'', N'MX', NULL, N'', N'', 2, 0)
INSERT [dbo].[Empresas] ([Id], [NombreEmpresa], [CorreoElectronico], [Telefono], [Moneda], [ZonaHoraria_Id], [Logo], [Direccion], [Tipo_Id], [Estatus]) VALUES (15, N'Estrada Web Group', N'jose.estrada.hdz@outlook.com', N'', N'MX', NULL, N'', N'', 2, 1)
INSERT [dbo].[Empresas] ([Id], [NombreEmpresa], [CorreoElectronico], [Telefono], [Moneda], [ZonaHoraria_Id], [Logo], [Direccion], [Tipo_Id], [Estatus]) VALUES (16, N'Prueba Nueva 2020', N'jose.estrada.hdz@outlook.com', N'1111111111110', N'14', 10, N'Proveed_202018193640723.png', N'Ciudad de México, Mexico', 2, 1)
INSERT [dbo].[Empresas] ([Id], [NombreEmpresa], [CorreoElectronico], [Telefono], [Moneda], [ZonaHoraria_Id], [Logo], [Direccion], [Tipo_Id], [Estatus]) VALUES (17, N'Prueba 2 2020', N'jiestrada@live.com.mx', N'54545484787', N'14', 10, N'Proveed_20201819439484.png', N'Dirección 2020', 2, 1)
INSERT [dbo].[Empresas] ([Id], [NombreEmpresa], [CorreoElectronico], [Telefono], [Moneda], [ZonaHoraria_Id], [Logo], [Direccion], [Tipo_Id], [Estatus]) VALUES (18, N'Coca Cola Company', N'cocacola@gmailc.om', N'544554', N'15', 12, N'Cliente_202073016551946.png', N'Calle Sin Número 1500', 3, 1)
INSERT [dbo].[Empresas] ([Id], [NombreEmpresa], [CorreoElectronico], [Telefono], [Moneda], [ZonaHoraria_Id], [Logo], [Direccion], [Tipo_Id], [Estatus]) VALUES (19, N'Pepsico', N'pepsi@gmail.com', N'asdasd', N'15', 10, N'Cliente_2020730165742226.png', N'Mexico', 3, 1)
SET IDENTITY_INSERT [dbo].[Empresas] OFF
SET IDENTITY_INSERT [dbo].[Productos] ON 

INSERT [dbo].[Productos] ([Id], [Codigo], [Nombre], [Descripcion], [Marca], [Modelo], [UnidadMedida], [Estatus], [Costo], [Utilidad], [PrecioVenta], [Stock], [FechaRegistro], [FechaActivo]) VALUES (1, N'c571f27e-bbbd-4696-971c-71b86db62b50', N'Producto Test', N'asdkajlsd lkashdn lkahd nasd', N'Ford', N'F150', N'Pieza', 1, CAST(150.00 AS Numeric(18, 2)), -200, CAST(350.00 AS Numeric(18, 2)), 5, CAST(N'2018-09-18' AS Date), CAST(N'2018-09-18 08:48:37.863' AS DateTime))
INSERT [dbo].[Productos] ([Id], [Codigo], [Nombre], [Descripcion], [Marca], [Modelo], [UnidadMedida], [Estatus], [Costo], [Utilidad], [PrecioVenta], [Stock], [FechaRegistro], [FechaActivo]) VALUES (2, N'9dbcb2ac-17a0-4745-a62e-1e9188ec6364', N'Comida Chatarra', N'Danone y Papas', N'Sabritas', N'NA', N'Combo', 1, CAST(15.00 AS Numeric(18, 2)), 15, CAST(30.00 AS Numeric(18, 2)), 15, CAST(N'2018-12-17' AS Date), CAST(N'2018-12-17 08:33:44.660' AS DateTime))
INSERT [dbo].[Productos] ([Id], [Codigo], [Nombre], [Descripcion], [Marca], [Modelo], [UnidadMedida], [Estatus], [Costo], [Utilidad], [PrecioVenta], [Stock], [FechaRegistro], [FechaActivo]) VALUES (3, N'9b216926-7365-4317-b5ed-8d0f7401f539', N'Otro Producto', N'Prueba', N'a', N'na', N'pieza', 1, CAST(150.00 AS Numeric(18, 2)), 200, CAST(350.00 AS Numeric(18, 2)), 5, CAST(N'2018-12-17' AS Date), CAST(N'2018-12-17 08:42:13.583' AS DateTime))
INSERT [dbo].[Productos] ([Id], [Codigo], [Nombre], [Descripcion], [Marca], [Modelo], [UnidadMedida], [Estatus], [Costo], [Utilidad], [PrecioVenta], [Stock], [FechaRegistro], [FechaActivo]) VALUES (4, N'fb921cef-d0c6-4dbb-885f-577e19bc6866', N'Combo Comida y Papas xy', N'Agua, papas y danone', N'Sabritas', N'NA', N'Combo', 1, CAST(30.00 AS Numeric(18, 2)), 30, CAST(60.00 AS Numeric(18, 2)), 20, NULL, NULL)
INSERT [dbo].[Productos] ([Id], [Codigo], [Nombre], [Descripcion], [Marca], [Modelo], [UnidadMedida], [Estatus], [Costo], [Utilidad], [PrecioVenta], [Stock], [FechaRegistro], [FechaActivo]) VALUES (5, N'96e0e49b-c4f1-4b31-ae5d-6aedb2e08b35', N'Papas', N'Agua, papas y danone', N'Sabritas', N'NA', N'bolsa', 1, CAST(10.00 AS Numeric(18, 2)), 5, CAST(15.00 AS Numeric(18, 2)), 5, CAST(N'2018-12-18' AS Date), CAST(N'2018-12-18 08:42:23.410' AS DateTime))
INSERT [dbo].[Productos] ([Id], [Codigo], [Nombre], [Descripcion], [Marca], [Modelo], [UnidadMedida], [Estatus], [Costo], [Utilidad], [PrecioVenta], [Stock], [FechaRegistro], [FechaActivo]) VALUES (6, N'209f5462-5389-47c4-8860-7685fd25bf8a', N'Papas', N'Agua, papas y danone', N'Sabritas', N'NA', N'Bolsa', 1, CAST(10.00 AS Numeric(18, 2)), 10, CAST(20.00 AS Numeric(18, 2)), 3, CAST(N'2018-12-18' AS Date), CAST(N'2018-12-18 09:07:55.727' AS DateTime))
INSERT [dbo].[Productos] ([Id], [Codigo], [Nombre], [Descripcion], [Marca], [Modelo], [UnidadMedida], [Estatus], [Costo], [Utilidad], [PrecioVenta], [Stock], [FechaRegistro], [FechaActivo]) VALUES (7, N'6ccbb42e-28df-4764-ac63-b2e0db25f7c0', N'Papas 1', N'Agua, papas y danone', N'Sabritas', N'NA', N'Bolsa', 1, CAST(10.00 AS Numeric(18, 2)), 5, CAST(15.00 AS Numeric(18, 2)), 3, CAST(N'2018-12-18' AS Date), CAST(N'2018-12-18 09:11:00.630' AS DateTime))
INSERT [dbo].[Productos] ([Id], [Codigo], [Nombre], [Descripcion], [Marca], [Modelo], [UnidadMedida], [Estatus], [Costo], [Utilidad], [PrecioVenta], [Stock], [FechaRegistro], [FechaActivo]) VALUES (8, N'9134ecf7-8e11-4c0a-acf4-1bb6e6d6eaf2', N'Papas 2', N'Agua, papas y danone', N'Sabritas', N'NA', N'Bolsa', 1, CAST(3.00 AS Numeric(18, 2)), 5, CAST(8.00 AS Numeric(18, 2)), 3, CAST(N'2018-12-18' AS Date), CAST(N'2018-12-18 09:19:24.317' AS DateTime))
INSERT [dbo].[Productos] ([Id], [Codigo], [Nombre], [Descripcion], [Marca], [Modelo], [UnidadMedida], [Estatus], [Costo], [Utilidad], [PrecioVenta], [Stock], [FechaRegistro], [FechaActivo]) VALUES (9, N'7e6dd45c-5a10-4e1a-8741-0443e1adfd1c', N'Papas 3', N'Agua, papas y danone', N'Sabritas', N'NA', N'Bolsa', 1, CAST(5.00 AS Numeric(18, 2)), 8, CAST(13.00 AS Numeric(18, 2)), 4, CAST(N'2018-12-18' AS Date), CAST(N'2018-12-18 09:23:33.013' AS DateTime))
INSERT [dbo].[Productos] ([Id], [Codigo], [Nombre], [Descripcion], [Marca], [Modelo], [UnidadMedida], [Estatus], [Costo], [Utilidad], [PrecioVenta], [Stock], [FechaRegistro], [FechaActivo]) VALUES (10, N'a2b0ac37-d24c-43e4-b004-80e85a700d0b', N'Papas 4', N'Agua, papas y danone', N'Sabritas', N'NA', N'Bolsa', 1, CAST(11.00 AS Numeric(18, 2)), 8, CAST(19.00 AS Numeric(18, 2)), 4, CAST(N'2018-12-18' AS Date), CAST(N'2018-12-18 09:25:59.220' AS DateTime))
INSERT [dbo].[Productos] ([Id], [Codigo], [Nombre], [Descripcion], [Marca], [Modelo], [UnidadMedida], [Estatus], [Costo], [Utilidad], [PrecioVenta], [Stock], [FechaRegistro], [FechaActivo]) VALUES (11, N'738146f3-2bac-4929-a91f-84d0f2669a65', N'Papas 5', N'Agua, papas y danone', N'Sabritas', N'NA', N'Bolsa', 1, CAST(8.00 AS Numeric(18, 2)), 8, CAST(16.00 AS Numeric(18, 2)), 5, CAST(N'2018-12-18' AS Date), CAST(N'2018-12-18 09:31:46.797' AS DateTime))
SET IDENTITY_INSERT [dbo].[Productos] OFF
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([Id], [CorreoElectronico], [Password], [EmpresaId], [Telefono], [Nombres], [Fecha], [Activo], [Rol_Id], [Token]) VALUES (1, N'info@estradawebgroup.com', N'asdasdasd', 1, N'', N'José', CAST(N'2018-07-03' AS Date), 1, 1, NULL)
INSERT [dbo].[Usuarios] ([Id], [CorreoElectronico], [Password], [EmpresaId], [Telefono], [Nombres], [Fecha], [Activo], [Rol_Id], [Token]) VALUES (2, N'info@estradawebgroup.com', N'asdasdasd', 1, N'', N'José', CAST(N'2018-07-03' AS Date), 1, 1, NULL)
INSERT [dbo].[Usuarios] ([Id], [CorreoElectronico], [Password], [EmpresaId], [Telefono], [Nombres], [Fecha], [Activo], [Rol_Id], [Token]) VALUES (3, N'info@estradawebgroup.com', N'asdasdasd', 1, N'', N'José', CAST(N'2018-07-03' AS Date), 1, 1, NULL)
INSERT [dbo].[Usuarios] ([Id], [CorreoElectronico], [Password], [EmpresaId], [Telefono], [Nombres], [Fecha], [Activo], [Rol_Id], [Token]) VALUES (4, N'jiestrada@live.com.mx', N'VRG/Vbqc/SDgn2v1fd2eY66+lctHyDkgyPeJKmPBsWFjVs6pEqj7WKge9k+AUM/3XDkDxZ7pSu1ONi5KaffFvuR4QjEChVsf8/UtlA==', 5, N'', N'', CAST(N'2018-08-30' AS Date), 1, 1, N'')
INSERT [dbo].[Usuarios] ([Id], [CorreoElectronico], [Password], [EmpresaId], [Telefono], [Nombres], [Fecha], [Activo], [Rol_Id], [Token]) VALUES (9, N'jose.estrada.hdz@outlook.com', N'MsTKqvt4wqUMnfwBW4u8F3L0J6Gy7Lt9MEupWqoK7DPJDIl8nYhk5o7MR5ZKArzfZJZMxpxbQ2oDWg8gtjxD2b003O6Pn9Y=', 15, N'', N'', CAST(N'2019-12-05' AS Date), 1, 1, N'')
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
ALTER TABLE [dbo].[Anexos]  WITH CHECK ADD  CONSTRAINT [FK_Anexos_Productos] FOREIGN KEY([Producto_Id])
REFERENCES [dbo].[Productos] ([Id])
GO
ALTER TABLE [dbo].[Anexos] CHECK CONSTRAINT [FK_Anexos_Productos]
GO
ALTER TABLE [dbo].[Compras]  WITH CHECK ADD  CONSTRAINT [FK_Compras_Empresas] FOREIGN KEY([Empresa_Id])
REFERENCES [dbo].[Empresas] ([Id])
GO
ALTER TABLE [dbo].[Compras] CHECK CONSTRAINT [FK_Compras_Empresas]
GO
ALTER TABLE [dbo].[Compras]  WITH CHECK ADD  CONSTRAINT [FK_Compras_Usuarios] FOREIGN KEY([Usuario_Id])
REFERENCES [dbo].[Usuarios] ([Id])
GO
ALTER TABLE [dbo].[Compras] CHECK CONSTRAINT [FK_Compras_Usuarios]
GO
ALTER TABLE [dbo].[ComprasProductos]  WITH CHECK ADD  CONSTRAINT [FK_ComprasProductos_Compras] FOREIGN KEY([Compra_Id])
REFERENCES [dbo].[Compras] ([Id])
GO
ALTER TABLE [dbo].[ComprasProductos] CHECK CONSTRAINT [FK_ComprasProductos_Compras]
GO
ALTER TABLE [dbo].[ComprasProductos]  WITH CHECK ADD  CONSTRAINT [FK_ComprasProductos_Productos] FOREIGN KEY([Producto_Id])
REFERENCES [dbo].[Productos] ([Id])
GO
ALTER TABLE [dbo].[ComprasProductos] CHECK CONSTRAINT [FK_ComprasProductos_Productos]
GO
ALTER TABLE [dbo].[Empresas]  WITH CHECK ADD  CONSTRAINT [FK_Empresas_Catalogos] FOREIGN KEY([ZonaHoraria_Id])
REFERENCES [dbo].[Catalogos] ([Id])
GO
ALTER TABLE [dbo].[Empresas] CHECK CONSTRAINT [FK_Empresas_Catalogos]
GO
ALTER TABLE [dbo].[Empresas]  WITH CHECK ADD  CONSTRAINT [FK_Empresas_Catalogos1] FOREIGN KEY([Tipo_Id])
REFERENCES [dbo].[Catalogos] ([Id])
GO
ALTER TABLE [dbo].[Empresas] CHECK CONSTRAINT [FK_Empresas_Catalogos1]
GO
ALTER TABLE [dbo].[Impuestos]  WITH CHECK ADD  CONSTRAINT [FK_Impuestos_Compras] FOREIGN KEY([Compra_Id])
REFERENCES [dbo].[Compras] ([Id])
GO
ALTER TABLE [dbo].[Impuestos] CHECK CONSTRAINT [FK_Impuestos_Compras]
GO
ALTER TABLE [dbo].[Impuestos]  WITH CHECK ADD  CONSTRAINT [FK_Impuestos_Ventas] FOREIGN KEY([Venta_Id])
REFERENCES [dbo].[Ventas] ([Id])
GO
ALTER TABLE [dbo].[Impuestos] CHECK CONSTRAINT [FK_Impuestos_Ventas]
GO
ALTER TABLE [dbo].[Permisos]  WITH CHECK ADD  CONSTRAINT [FK_Permisos_Catalogos] FOREIGN KEY([Grupo_Id])
REFERENCES [dbo].[Catalogos] ([Id])
GO
ALTER TABLE [dbo].[Permisos] CHECK CONSTRAINT [FK_Permisos_Catalogos]
GO
ALTER TABLE [dbo].[Productos_Empresas]  WITH CHECK ADD  CONSTRAINT [FK_Productos_Empresas_Empresas] FOREIGN KEY([Empresa_Id])
REFERENCES [dbo].[Empresas] ([Id])
GO
ALTER TABLE [dbo].[Productos_Empresas] CHECK CONSTRAINT [FK_Productos_Empresas_Empresas]
GO
ALTER TABLE [dbo].[Productos_Empresas]  WITH CHECK ADD  CONSTRAINT [FK_Productos_Empresas_Productos] FOREIGN KEY([Producto_Id])
REFERENCES [dbo].[Productos] ([Id])
GO
ALTER TABLE [dbo].[Productos_Empresas] CHECK CONSTRAINT [FK_Productos_Empresas_Productos]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_Usuarios_Catalogos] FOREIGN KEY([Rol_Id])
REFERENCES [dbo].[Catalogos] ([Id])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK_Usuarios_Catalogos]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_Usuarios_Empresas] FOREIGN KEY([EmpresaId])
REFERENCES [dbo].[Empresas] ([Id])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK_Usuarios_Empresas]
GO
ALTER TABLE [dbo].[Ventas]  WITH CHECK ADD  CONSTRAINT [FK_Ventas_Productos] FOREIGN KEY([Producto_Id])
REFERENCES [dbo].[Productos] ([Id])
GO
ALTER TABLE [dbo].[Ventas] CHECK CONSTRAINT [FK_Ventas_Productos]
GO
ALTER TABLE [dbo].[Ventas]  WITH CHECK ADD  CONSTRAINT [FK_Ventas_Usuarios] FOREIGN KEY([Cliente_Id])
REFERENCES [dbo].[Usuarios] ([Id])
GO
ALTER TABLE [dbo].[Ventas] CHECK CONSTRAINT [FK_Ventas_Usuarios]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Empresas"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 430
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Usuarios"
            Begin Extent = 
               Top = 153
               Left = 380
               Bottom = 283
               Right = 564
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "Compras"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 260
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vCompras'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vCompras'
GO
USE [master]
GO
ALTER DATABASE [inventarios] SET  READ_WRITE 
GO
