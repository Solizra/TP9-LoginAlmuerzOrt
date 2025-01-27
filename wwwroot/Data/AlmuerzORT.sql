USE [master]
GO
/****** Object:  Database [AlmuerzORT]    Script Date: 10/10/2024 17:27:33 ******/
CREATE DATABASE [AlmuerzORT]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AlmuerzORT', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\AlmuerzORT.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AlmuerzORT_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\AlmuerzORT_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [AlmuerzORT] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AlmuerzORT].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AlmuerzORT] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AlmuerzORT] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AlmuerzORT] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AlmuerzORT] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AlmuerzORT] SET ARITHABORT OFF 
GO
ALTER DATABASE [AlmuerzORT] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AlmuerzORT] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AlmuerzORT] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AlmuerzORT] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AlmuerzORT] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AlmuerzORT] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AlmuerzORT] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AlmuerzORT] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AlmuerzORT] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AlmuerzORT] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AlmuerzORT] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AlmuerzORT] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AlmuerzORT] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AlmuerzORT] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AlmuerzORT] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AlmuerzORT] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AlmuerzORT] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AlmuerzORT] SET RECOVERY FULL 
GO
ALTER DATABASE [AlmuerzORT] SET  MULTI_USER 
GO
ALTER DATABASE [AlmuerzORT] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AlmuerzORT] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AlmuerzORT] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AlmuerzORT] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AlmuerzORT] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'AlmuerzORT', N'ON'
GO
ALTER DATABASE [AlmuerzORT] SET QUERY_STORE = OFF
GO
USE [AlmuerzORT]
GO
/****** Object:  User [alumno]    Script Date: 10/10/2024 17:27:33 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[ComidaxMenu]    Script Date: 10/10/2024 17:27:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ComidaxMenu](
	[id_plato] [int] IDENTITY(1,1) NOT NULL,
	[nombre_plato] [varchar](50) NOT NULL,
	[descripcion] [varchar](200) NOT NULL,
	[precio] [float] NOT NULL,
	[id_restriccion] [int] NULL,
 CONSTRAINT [PK_ComidaxMenu] PRIMARY KEY CLUSTERED 
(
	[id_plato] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Establecimientos]    Script Date: 10/10/2024 17:27:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Establecimientos](
	[id_lugar] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[direccion] [varchar](50) NOT NULL,
	[telefono] [varchar](50) NOT NULL,
	[calificacion] [int] NOT NULL,
	[horarios] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Establecimientos] PRIMARY KEY CLUSTERED 
(
	[id_lugar] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Favoritos]    Script Date: 10/10/2024 17:27:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Favoritos](
	[id_lugar] [int] NOT NULL,
	[dni_usuario] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlatoxLugar]    Script Date: 10/10/2024 17:27:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlatoxLugar](
	[id_lugar] [int] NOT NULL,
	[id_plato] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reseñas]    Script Date: 10/10/2024 17:27:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reseñas](
	[Id_reseña] [int] IDENTITY(1,1) NOT NULL,
	[contenido] [varchar](200) NOT NULL,
	[id_lugar] [int] NOT NULL,
	[dni_usuario] [int] NOT NULL,
 CONSTRAINT [PK_Reseñas] PRIMARY KEY CLUSTERED 
(
	[Id_reseña] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Restricciones]    Script Date: 10/10/2024 17:27:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Restricciones](
	[id_restriccion] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Restricciones] PRIMARY KEY CLUSTERED 
(
	[id_restriccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 10/10/2024 17:27:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[dni] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[apellido] [varchar](50) NOT NULL,
	[contraseña] [varchar](50) NOT NULL,
	[mail] [varchar](50) NOT NULL,
	[descripcion] [varchar](500) NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[dni] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ComidaxMenu] ON 

INSERT [dbo].[ComidaxMenu] ([id_plato], [nombre_plato], [descripcion], [precio], [id_restriccion]) VALUES (1, N'Milanesa de Carne', N'Carne rebozada en pan rallado', 4000, 7)
INSERT [dbo].[ComidaxMenu] ([id_plato], [nombre_plato], [descripcion], [precio], [id_restriccion]) VALUES (3, N'Empanada', N' Fina masa de pan, masa quebrada u hojaldre rellena con una preparación salada o dulce y cocida al horno o frita.', 1000, 7)
INSERT [dbo].[ComidaxMenu] ([id_plato], [nombre_plato], [descripcion], [precio], [id_restriccion]) VALUES (4, N'Milanesa de Pollo', N'Pollo rebozado en pan rallado.', 4000, 7)
INSERT [dbo].[ComidaxMenu] ([id_plato], [nombre_plato], [descripcion], [precio], [id_restriccion]) VALUES (5, N'Ravioles de Ricota', N'Masa con forma de pequeño cuadrado relleno de ricota.', 4500, 7)
INSERT [dbo].[ComidaxMenu] ([id_plato], [nombre_plato], [descripcion], [precio], [id_restriccion]) VALUES (6, N'Ravioles de Verdura', N'Masa con forma de pequeño cuadrado relleno de verdura.', 4500, 7)
INSERT [dbo].[ComidaxMenu] ([id_plato], [nombre_plato], [descripcion], [precio], [id_restriccion]) VALUES (7, N'Pollo teriyaqui', N'Pollo adobado con salsa dulce.', 3500, 5)
INSERT [dbo].[ComidaxMenu] ([id_plato], [nombre_plato], [descripcion], [precio], [id_restriccion]) VALUES (8, N'Shawarma', N'Sándwich de carne en pan pita o árabe, que puede servirse relleno o en forma de roll.', 4800, 7)
INSERT [dbo].[ComidaxMenu] ([id_plato], [nombre_plato], [descripcion], [precio], [id_restriccion]) VALUES (9, N'Ñoquis', N'Pequeñas porciones de pasta hechas a base de patata, harina y huevo, que se caracterizan por su forma redondeada y su textura suave y tierna.', 3600, 4)
INSERT [dbo].[ComidaxMenu] ([id_plato], [nombre_plato], [descripcion], [precio], [id_restriccion]) VALUES (11, N'Empanadas celiacas', N'Fina masa de pan, masa quebrada u hojaldre rellena con una preparación salada o dulce y cocida al horno o frita, apta para celiacos.', 2000, 2)
INSERT [dbo].[ComidaxMenu] ([id_plato], [nombre_plato], [descripcion], [precio], [id_restriccion]) VALUES (12, N'Papas fritas', N'Papas que se preparan cortándose en rodajas o en forma de palitos y friéndose en aceite caliente hasta que queden doradas, retirándolas del aceite.', 1500, 3)
INSERT [dbo].[ComidaxMenu] ([id_plato], [nombre_plato], [descripcion], [precio], [id_restriccion]) VALUES (15, N'Fideos', N'Pasta alimenticia de harina en forma de cuerda delgada.', 3800, 4)
INSERT [dbo].[ComidaxMenu] ([id_plato], [nombre_plato], [descripcion], [precio], [id_restriccion]) VALUES (16, N'Manzana', N'Fruto de estructura firme, carnoso, derivado del receptáculo de la flor. ', 600, 6)
INSERT [dbo].[ComidaxMenu] ([id_plato], [nombre_plato], [descripcion], [precio], [id_restriccion]) VALUES (18, N'Pizza', N'Torta de harina amasada, encima de la cual se pone queso, tomate frito y otros ingredientes, y que se cuece en el horno.', 4000, 7)
INSERT [dbo].[ComidaxMenu] ([id_plato], [nombre_plato], [descripcion], [precio], [id_restriccion]) VALUES (19, N'Sandwich', N'Emparedado hecho con dos rebanadas de pan de molde entre las que se coloca jamón, queso, embutido, vegetales u otros alimentos.', 4100, 7)
SET IDENTITY_INSERT [dbo].[ComidaxMenu] OFF
GO
SET IDENTITY_INSERT [dbo].[Establecimientos] ON 

INSERT [dbo].[Establecimientos] ([id_lugar], [nombre], [direccion], [telefono], [calificacion], [horarios]) VALUES (1, N'Dalton', N'Yatay 260', N'011 4028-5500', 4, N'8am-7pm')
INSERT [dbo].[Establecimientos] ([id_lugar], [nombre], [direccion], [telefono], [calificacion], [horarios]) VALUES (3, N'Abuela Amasa', N'C. Dr. Juan Felipe Aranguren 19', N'011 5833-7469', 4, N'9am-6pm')
INSERT [dbo].[Establecimientos] ([id_lugar], [nombre], [direccion], [telefono], [calificacion], [horarios]) VALUES (5, N'La Matildita', N'Av. Díaz Vélez 4602', N'011 4982-1373', 4, N'8:30am-8:30pm')
INSERT [dbo].[Establecimientos] ([id_lugar], [nombre], [direccion], [telefono], [calificacion], [horarios]) VALUES (7, N'
La Nueva Fragola', N'Av. Díaz Vélez 4505', N'011 4981-0442', 5, N'7:30am-8pm')
INSERT [dbo].[Establecimientos] ([id_lugar], [nombre], [direccion], [telefono], [calificacion], [horarios]) VALUES (10, N'El Vasquito', N'Río de Janeiro 310', N'011 4982-2220', 4, N'11am-11pm')
INSERT [dbo].[Establecimientos] ([id_lugar], [nombre], [direccion], [telefono], [calificacion], [horarios]) VALUES (11, N'Via Veneto', N'Av. Díaz Vélez 4459', N'011 7365-0005', 4, N'9:30am-8:30pm')
INSERT [dbo].[Establecimientos] ([id_lugar], [nombre], [direccion], [telefono], [calificacion], [horarios]) VALUES (13, N'Green Deli', N'Av. Díaz Vélez 4501', N'-', 4, N'11am-9:30pm')
INSERT [dbo].[Establecimientos] ([id_lugar], [nombre], [direccion], [telefono], [calificacion], [horarios]) VALUES (14, N'Impanato', N'Av. Díaz Vélez 4509', N'-', 4, N'9am-11pm')
INSERT [dbo].[Establecimientos] ([id_lugar], [nombre], [direccion], [telefono], [calificacion], [horarios]) VALUES (15, N'Cumen-Cumen', N'Av. Díaz Vélez 4615', N'011 4982-5310', 3, N'11am-11pm')
INSERT [dbo].[Establecimientos] ([id_lugar], [nombre], [direccion], [telefono], [calificacion], [horarios]) VALUES (16, N'Gra-Hu', N'Río de Janeiro 320', N'011 4981-3487', 5, N'11:30am-10pm')
INSERT [dbo].[Establecimientos] ([id_lugar], [nombre], [direccion], [telefono], [calificacion], [horarios]) VALUES (17, N'Aieka', N'Bartolomé Mitre 4390', N'011 7508-3317', 5, N'9am-5pm')
INSERT [dbo].[Establecimientos] ([id_lugar], [nombre], [direccion], [telefono], [calificacion], [horarios]) VALUES (19, N'Big Pizza', N'Yatay 287', N'011 2601-4579', 3, N'11am-11pm')
INSERT [dbo].[Establecimientos] ([id_lugar], [nombre], [direccion], [telefono], [calificacion], [horarios]) VALUES (20, N'Panadería Roel', N'Av. Avellaneda 99', N'011 4982-0829', 4, N'8am-8pm')
INSERT [dbo].[Establecimientos] ([id_lugar], [nombre], [direccion], [telefono], [calificacion], [horarios]) VALUES (22, N'McDonald''s', N'Av. Rivadavia 5730', N'-', 4, N'Abierto las 24hs')
INSERT [dbo].[Establecimientos] ([id_lugar], [nombre], [direccion], [telefono], [calificacion], [horarios]) VALUES (24, N'
Burger King', N'Av. Rivadavia 4355', N'-', 4, N'7am-1am')
INSERT [dbo].[Establecimientos] ([id_lugar], [nombre], [direccion], [telefono], [calificacion], [horarios]) VALUES (25, N'
Il Nonno Pibe', N'Av. Avellaneda 96', N'011 4982-9333', 5, N'12am-11:30pm')
INSERT [dbo].[Establecimientos] ([id_lugar], [nombre], [direccion], [telefono], [calificacion], [horarios]) VALUES (26, N'Parrilla 83', N'Av. Díaz Vélez 4293', N'011 5370-5634', 4, N'8am-11pm')
INSERT [dbo].[Establecimientos] ([id_lugar], [nombre], [direccion], [telefono], [calificacion], [horarios]) VALUES (27, N'
Menora House', N'Yatay 226', N'011 4958-2258', 4, N'8am-5pm')
INSERT [dbo].[Establecimientos] ([id_lugar], [nombre], [direccion], [telefono], [calificacion], [horarios]) VALUES (28, N'
Lo del Negro Bar', N'Av. Díaz Vélez 4902', N'011 4982-5107', 4, N'6am-9pm')
INSERT [dbo].[Establecimientos] ([id_lugar], [nombre], [direccion], [telefono], [calificacion], [horarios]) VALUES (29, N'Mundo Argentino', N'Av. Díaz Vélez 4502', N'5253-2965', 4, N'6am-2am')
INSERT [dbo].[Establecimientos] ([id_lugar], [nombre], [direccion], [telefono], [calificacion], [horarios]) VALUES (30, N'Kwom Yuen Rotisería China', N'Yatay 213', N'011 4958-7733', 4, N'11:30am-11pm')
INSERT [dbo].[Establecimientos] ([id_lugar], [nombre], [direccion], [telefono], [calificacion], [horarios]) VALUES (32, N'
Restaurante Teamim', N'Av. Díaz Vélez 4431', N'011 5114-1555', 4, N'11am-10pm')
INSERT [dbo].[Establecimientos] ([id_lugar], [nombre], [direccion], [telefono], [calificacion], [horarios]) VALUES (33, N'Antigua Querencia', N'Yatay 602', N'011 4861-4502', 4, N'12am-12pm')
INSERT [dbo].[Establecimientos] ([id_lugar], [nombre], [direccion], [telefono], [calificacion], [horarios]) VALUES (34, N'Satoshi Sushi', N'Av. Díaz Vélez 4493', N'011 6929-8969', 4, N'11:30am-12pm')
INSERT [dbo].[Establecimientos] ([id_lugar], [nombre], [direccion], [telefono], [calificacion], [horarios]) VALUES (35, N'ZEROGLUTEN
', N'Río de Janeiro 346', N'011 15-2355-9838', 5, N'12am-11pm')
INSERT [dbo].[Establecimientos] ([id_lugar], [nombre], [direccion], [telefono], [calificacion], [horarios]) VALUES (36, N'Ugi''s', N'Querandíes 4395', N'-', 4, N'10am-11:30pm')
INSERT [dbo].[Establecimientos] ([id_lugar], [nombre], [direccion], [telefono], [calificacion], [horarios]) VALUES (38, N'Jalá', N'Río de Janeiro 692', N'011 15-7121-2074', 5, N'12am-11pm')
INSERT [dbo].[Establecimientos] ([id_lugar], [nombre], [direccion], [telefono], [calificacion], [horarios]) VALUES (39, N'Black Clover', N'Avellaneda 1', N'-', 3, N'7am-10pm')
INSERT [dbo].[Establecimientos] ([id_lugar], [nombre], [direccion], [telefono], [calificacion], [horarios]) VALUES (41, N'Disfruta', N'Yatay 290', N'011 7123-6730', 4, N'9am-9pm')
INSERT [dbo].[Establecimientos] ([id_lugar], [nombre], [direccion], [telefono], [calificacion], [horarios]) VALUES (42, N'Cri Cri', N'Av. Díaz Vélez 4401', N'-', 5, N'10am-11:30pm')
INSERT [dbo].[Establecimientos] ([id_lugar], [nombre], [direccion], [telefono], [calificacion], [horarios]) VALUES (43, N'Puerto López', N'Tte. Gral. Juan Domingo Perón 4486', N'011 7544-1699', 5, N'12am-8pm')
INSERT [dbo].[Establecimientos] ([id_lugar], [nombre], [direccion], [telefono], [calificacion], [horarios]) VALUES (44, N'Mostaza', N'Av. Díaz Vélez 5001', N'-', 4, N'7am-1am')
SET IDENTITY_INSERT [dbo].[Establecimientos] OFF
GO
INSERT [dbo].[Favoritos] ([id_lugar], [dni_usuario]) VALUES (1, 48313547)
INSERT [dbo].[Favoritos] ([id_lugar], [dni_usuario]) VALUES (3, 48240825)
INSERT [dbo].[Favoritos] ([id_lugar], [dni_usuario]) VALUES (42, 48796333)
INSERT [dbo].[Favoritos] ([id_lugar], [dni_usuario]) VALUES (13, 48043270)
GO
INSERT [dbo].[PlatoxLugar] ([id_lugar], [id_plato]) VALUES (3, 15)
INSERT [dbo].[PlatoxLugar] ([id_lugar], [id_plato]) VALUES (13, 12)
INSERT [dbo].[PlatoxLugar] ([id_lugar], [id_plato]) VALUES (5, 9)
INSERT [dbo].[PlatoxLugar] ([id_lugar], [id_plato]) VALUES (36, 18)
INSERT [dbo].[PlatoxLugar] ([id_lugar], [id_plato]) VALUES (10, 3)
INSERT [dbo].[PlatoxLugar] ([id_lugar], [id_plato]) VALUES (35, 11)
INSERT [dbo].[PlatoxLugar] ([id_lugar], [id_plato]) VALUES (7, 19)
INSERT [dbo].[PlatoxLugar] ([id_lugar], [id_plato]) VALUES (16, 1)
INSERT [dbo].[PlatoxLugar] ([id_lugar], [id_plato]) VALUES (16, 4)
INSERT [dbo].[PlatoxLugar] ([id_lugar], [id_plato]) VALUES (27, 7)
INSERT [dbo].[PlatoxLugar] ([id_lugar], [id_plato]) VALUES (32, 8)
INSERT [dbo].[PlatoxLugar] ([id_lugar], [id_plato]) VALUES (3, 5)
INSERT [dbo].[PlatoxLugar] ([id_lugar], [id_plato]) VALUES (3, 6)
INSERT [dbo].[PlatoxLugar] ([id_lugar], [id_plato]) VALUES (41, 16)
GO
SET IDENTITY_INSERT [dbo].[Reseñas] ON 

INSERT [dbo].[Reseñas] ([Id_reseña], [contenido], [id_lugar], [dni_usuario]) VALUES (2, N'Muy buenos precios y mejor la atención.', 1, 48043270)
INSERT [dbo].[Reseñas] ([Id_reseña], [contenido], [id_lugar], [dni_usuario]) VALUES (3, N'La comida muy sabrosa, los precios un poco elevados, pero en general, todo bien.', 3, 48240825)
INSERT [dbo].[Reseñas] ([Id_reseña], [contenido], [id_lugar], [dni_usuario]) VALUES (8, N'Pesimo lugar, muy sucio, poca higiene, pero la comida zafa.', 33, 48796333)
INSERT [dbo].[Reseñas] ([Id_reseña], [contenido], [id_lugar], [dni_usuario]) VALUES (10, N'Comida para celíacos, rica y sabrosa. Precios un tanto elevados.', 35, 48043270)
SET IDENTITY_INSERT [dbo].[Reseñas] OFF
GO
SET IDENTITY_INSERT [dbo].[Restricciones] ON 

INSERT [dbo].[Restricciones] ([id_restriccion], [nombre]) VALUES (1, N'intolerante a la lactosa')
INSERT [dbo].[Restricciones] ([id_restriccion], [nombre]) VALUES (2, N'celiaco')
INSERT [dbo].[Restricciones] ([id_restriccion], [nombre]) VALUES (3, N'vegano')
INSERT [dbo].[Restricciones] ([id_restriccion], [nombre]) VALUES (4, N'vegetariano')
INSERT [dbo].[Restricciones] ([id_restriccion], [nombre]) VALUES (5, N'kosher')
INSERT [dbo].[Restricciones] ([id_restriccion], [nombre]) VALUES (6, N'diabetico')
INSERT [dbo].[Restricciones] ([id_restriccion], [nombre]) VALUES (7, N'ninguna')
SET IDENTITY_INSERT [dbo].[Restricciones] OFF
GO
INSERT [dbo].[Usuario] ([dni], [nombre], [apellido], [contraseña], [mail], [descripcion]) VALUES (48043270, N'Indiana', N'Sasson', N'12345678Is', N'48043270@est.ort.edu.ar', N'Alumno')
INSERT [dbo].[Usuario] ([dni], [nombre], [apellido], [contraseña], [mail], [descripcion]) VALUES (48240825, N'Joaquin Ignacio', N'Ordoñez', N'12345678Jo', N'48240825@est.ort.edu.ar', N'Alumno')
INSERT [dbo].[Usuario] ([dni], [nombre], [apellido], [contraseña], [mail], [descripcion]) VALUES (48313547, N'Tomás Alan', N'Sassón', N'12345678Ts', N'48313547@est.ort.edu.ar', N'Alumno')
INSERT [dbo].[Usuario] ([dni], [nombre], [apellido], [contraseña], [mail], [descripcion]) VALUES (48796333, N'Sol Diana', N'Izraelewicz', N'12345678Si', N'48796333@est.ort.edu.ar', N'Alumno')
GO
ALTER TABLE [dbo].[ComidaxMenu]  WITH CHECK ADD  CONSTRAINT [FK_ComidaxMenu_Restricciones] FOREIGN KEY([id_restriccion])
REFERENCES [dbo].[Restricciones] ([id_restriccion])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ComidaxMenu] CHECK CONSTRAINT [FK_ComidaxMenu_Restricciones]
GO
ALTER TABLE [dbo].[Favoritos]  WITH CHECK ADD  CONSTRAINT [FK_Favoritos_Establecimientos] FOREIGN KEY([id_lugar])
REFERENCES [dbo].[Establecimientos] ([id_lugar])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Favoritos] CHECK CONSTRAINT [FK_Favoritos_Establecimientos]
GO
ALTER TABLE [dbo].[Favoritos]  WITH CHECK ADD  CONSTRAINT [FK_Favoritos_Usuario] FOREIGN KEY([dni_usuario])
REFERENCES [dbo].[Usuario] ([dni])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Favoritos] CHECK CONSTRAINT [FK_Favoritos_Usuario]
GO
ALTER TABLE [dbo].[PlatoxLugar]  WITH CHECK ADD  CONSTRAINT [FK_PlatoxLugar_ComidaxMenu] FOREIGN KEY([id_plato])
REFERENCES [dbo].[ComidaxMenu] ([id_plato])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PlatoxLugar] CHECK CONSTRAINT [FK_PlatoxLugar_ComidaxMenu]
GO
ALTER TABLE [dbo].[PlatoxLugar]  WITH CHECK ADD  CONSTRAINT [FK_PlatoxLugar_Establecimientos] FOREIGN KEY([id_lugar])
REFERENCES [dbo].[Establecimientos] ([id_lugar])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PlatoxLugar] CHECK CONSTRAINT [FK_PlatoxLugar_Establecimientos]
GO
ALTER TABLE [dbo].[Reseñas]  WITH CHECK ADD  CONSTRAINT [FK_Reseñas_Establecimientos] FOREIGN KEY([id_lugar])
REFERENCES [dbo].[Establecimientos] ([id_lugar])
GO
ALTER TABLE [dbo].[Reseñas] CHECK CONSTRAINT [FK_Reseñas_Establecimientos]
GO
ALTER TABLE [dbo].[Reseñas]  WITH CHECK ADD  CONSTRAINT [FK_Reseñas_Usuario] FOREIGN KEY([dni_usuario])
REFERENCES [dbo].[Usuario] ([dni])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Reseñas] CHECK CONSTRAINT [FK_Reseñas_Usuario]
GO
USE [master]
GO
ALTER DATABASE [AlmuerzORT] SET  READ_WRITE 
GO
