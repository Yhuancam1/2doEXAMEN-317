CREATE DATABASE EVENTOS_GENESIS_DW
USE EVENTOS_GENESIS_ETL

create table Dim_Ubicacion(
	Cod_Ubi int identity (100,1) not null primary key,
	Cod_Departamento char(5) not null,
	Nom_Depart varchar(50) not null,
	Cod_Provincia char(5) not null,
	Nom_Provinci varchar(50) not null,
	Cod_Distrito char(5) not null,
	Nom_Distrito varchar(50) not null
)

create table Dim_Cliente(
	Key_Cliente int identity(100,1) not null primary key,
	ID_Cliente char(5) not null,
	Nom_Cliente varchar(50) not null,
	CI char(9) not null,
	Cod_Distrito char(5) not null,
	Nom_Distrito varchar(50) not null
	
)

create table Dim_Evento(
	Key_Evento int identity(200,1) not null primary key,
	ID_Evento char(5) not null,
	Cod_Cliente char(5) not null,
	Nom_Cliente varchar(50) not null,
	Tipo_Evento varchar(50) not null,
	Tematica varchar(50) not null,
	Costo_Evento money not null
)

create table Dim_Encargado(
	Key_Encargado int identity(200,1) not null primary key,
	ID_Encargado char(5) not null,
	Nom_Encargado varchar(50) not null,
	Cod_Distrito char(5) not null,
	Nom_Distrito varchar(50) not null
)

create table Dim_Tiempo(
	Id_Fecha int primary key not null,
	Fecha date not null,
	Año smallint not null,
	Trimestre tinyint not null,
	NomMes varchar (15) not null,
	Dia tinyint not null,
	DiaSem tinyint not null,
	NomDiaSem varchar(15) not null
)


create table Hechos_Fact_Precio_Evento(
	Key_Cliente int not null,
	Key_Encargado int not null,
	Key_Evento int not null,
	Id_Fecha int not null,
	Cod_Ubi int not null,
	Total_Precio money not null
)

create function dbo.fn_mes(@m int)
returns varchar(15)
begin
	declare @mes table(codigo int, nombre varchar(15)) 
	insert @mes values(1,'Enero'),
	(2,'Febrero'),(3,'Marzo'),(4,'Abril'),
	(5,'Mayo'),(6,'Junio'),(7,'Julio'),
	(8,'Agosto'),(9,'Septiembre'),(10,'Octubre'),
	(11,'Noviembre'),(12,'Diciembre')
	return(select nombre from @mes where codigo=@m)
	end
	go

create function dbo.fn_diaSem(@d int)
returns varchar(15)
begin
	declare @semana table(codigo int, nombre varchar(15)) 
	insert @semana values(1,'Lunes'),(2,'Martes'),
	(3,'Miercoles'),(4,'Jueves'),(5,'Viernes'),
	(6,'Sabado'),(7,'Domingo')
	return(select nombre from @semana where codigo=@d)
end
go

create procedure UMSA_Carga_Fact_Precio
as
BEGIN
	insert into Hechos_Fact_Precio_Evento(
	Key_Cliente, Key_Encargado, Key_Evento, Id_Fecha, Cod_Ubi, Total_Precio
	)
	SELECT 
	distinct dc.key_cliente, den.key_encargado, de.key_evento, dti.Id_Fecha, du.Cod_Ubi, (doit.costo_evento*doit.cantidad) as Total_Precio
	from Citas cit
	JOIN Detalle_Cita doit ON cit.Cod_Citas = doit.Cod_Citas
	JOIN Dim_Cliente dc ON cit.Cod_Cliente = dc.ID_Cliente
	JOIN Dim_Encargado den ON cit.Cod_Encargado = den.ID_Encargado
	JOIN Dim_Evento de ON cit.Cod_Evento = de.ID_Evento
	JOIN Dim_Tiempo dti ON cit.Fecha_cita = dti.Fecha
	JOIN Dim_Ubicacion du ON cit.Cod_Distrito = du.Cod_Distrito
	where cit.Fecha_cita is not null
end

