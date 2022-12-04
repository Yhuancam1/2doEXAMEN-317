CREATE DATABASE EVENTOS_GENESIS
USE EVENTOS_GENESIS

create table Departamento(
	Cod_Departamento char(5) not null primary key,
	Nom_Deparatamento varchar(50) not null
)

create table Provincia(
	Cod_Provincia char(5) not null primary key,
	Nom_Provincia varchar(50) not null,
	Cod_Departamento char(5) foreign key references Departamento(Cod_Departamento) not null
)

create table Distrito(
	Cod_Distrito char(5) not null primary key,
	Nom_Distrito varchar(50) not null,
	Cod_Provincia char(5) foreign key references Provincia(Cod_Provincia) not null
)

create table Encargado(
	Cod_Encargado char(5) not null primary key,
	Nom_Encargado varchar(50) not null,
	Horario varchar(50) not null,
	Cod_Departamento char(5) foreign key references Departamento(Cod_Departamento) not null,
	Cod_Provincia char(5) foreign key references Provincia(Cod_Provincia) not null,
	Cod_Distrito char(5) foreign key references Distrito(Cod_Distrito) not null
)

create table Cliente(
	Cod_Cliente char(5) not null primary key,
	Nom_Cliente varchar(50) not null,
	CI char(9) not null,
	Telefono varchar(20) not null,
	Direccion varchar(50) not null,
	Correo varchar(30) not null,
	Cod_Departamento char(5) foreign key references Departamento(Cod_Departamento) not null,
	Cod_Provincia char(5) foreign key references Provincia(Cod_Provincia) not null,
	Cod_Distrito char(5) foreign key references Distrito(Cod_Distrito) not null
)

create table Tipos_Evento(
	Cod_TipoEvento char(5) not null primary key,
	Nom_TipoEvento varchar(50) not null
)

create table Tematicas(
	Cod_Tematicas char(5) not null primary key,
	Nom_Tematica varchar(50) not null
)

create table evento(
	Cod_Evento char(5) not null primary key,
	Fecha_evento date not null,
	ubicacion_evento varchar(40) not null,
	costo_evento money not null,
	tipo_local varchar(40) not null,
	Cod_Cliente char(5) foreign key references Cliente(Cod_Cliente) not null,
	Cod_TipoEvento char(5) foreign key references Tipos_Evento(Cod_TipoEvento) not null,
	Cod_Tematicas char(5) foreign key references Tematicas(Cod_Tematicas) not null
)

create table Citas(
	Cod_Citas char(5) not null primary key,
	Fecha_cita date not null,
	Nom_Encargado varchar(50) not null,
	Lugar_atencion varchar(50) not null,
	Nom_Cliente varchar(50) not null,
	Cod_Cliente char(5) foreign key references Cliente(Cod_Cliente) not null,
	Cod_Evento char(5) foreign key references Evento(Cod_Evento) not null,
	Cod_Distrito char(5) foreign key references Distrito(Cod_Distrito) not null,
	Cod_Encargado char(5) foreign key references Encargado(Cod_Encargado) not null,
	Cod_TipoEvento char(5) foreign key references Tipos_Evento(Cod_TipoEvento) not null,
	Cod_Tematicas char(5) foreign key references Tematicas(Cod_Tematicas) not null
)

create table Detalle_Cita(
	Cod_Citas char(5) foreign key references Citas(Cod_Citas) not null,
	Cod_Evento char(5) foreign key references Evento(Cod_Evento) not null,
	costo_evento money not null,
	cantidad int not null
)

insert into Departamento values('D01','La Paz')
insert into Departamento values('D02','Oruro')
insert into Departamento values('D03','Santa Cruz')
insert into Departamento values('D04','Potosi')
insert into Departamento values('D05','Cochabamba')
insert into Departamento values('D06','Tarija')
insert into Departamento values('D07','Beni')
insert into Departamento values('D08','Pando')
insert into Departamento values('D09','Sucre')
insert into Departamento values('D10','Chuquisaca')

insert into Tipos_Evento values('TE01','Aniversario')
insert into Tipos_Evento values('TE02','Bautizo')
insert into Tipos_Evento values('TE03','Boda')
insert into Tipos_Evento values('TE04','Graduacion')
insert into Tipos_Evento values('TE05','Quinceaños')
insert into Tipos_Evento values('TE06','Fin de Año')
insert into Tipos_Evento values('TE07','Despedida de Soltero')
insert into Tipos_Evento values('TE08','Reencuentro')
insert into Tipos_Evento values('TE09','Privada')
insert into Tipos_Evento values('TE10','Infantiles')

insert into Tematicas values('T01','Egipcio')
insert into Tematicas values('T02','Arabe')
insert into Tematicas values('T03','Canadiense')
insert into Tematicas values('T04','Coreano')
insert into Tematicas values('T05','Tropical')
insert into Tematicas values('T06','Hawaiana')
insert into Tematicas values('T07','Neon')
insert into Tematicas values('T08','Ibicenca')
insert into Tematicas values('T09','De los años 20')
insert into Tematicas values('T10','Turcas')

insert into Provincia values('PR01','Larecaja','D01')
insert into Provincia values('PR02','Cercado','D02')
insert into Provincia values('PR03','Vallegrande','D03')
insert into Provincia values('PR04','Antonio Quijarro','D04')
insert into Provincia values('PR05','Capinota','D05')
insert into Provincia values('PR06','Gran Chaco','D06')
insert into Provincia values('PR07','Yacuma','D07')
insert into Provincia values('PR08','Manuripi','D08')
insert into Provincia values('PR09','Belisario Boeto','D09')
insert into Provincia values('PR10','Zudañes','D10')

insert into Distrito values('DI01','Los Limos','PR01')
insert into Distrito values('DI02','Barrientos','PR02')
insert into Distrito values('DI03','Cañada','PR03')
insert into Distrito values('DI04','Tumavi','PR04')
insert into Distrito values('DI05','El Carmen','PR05')
insert into Distrito values('DI06','Taruma','PR06')
insert into Distrito values('DI07','Villa Florida','PR07')
insert into Distrito values('DI08','Angostura','PR08')
insert into Distrito values('DI09','San Pedro','PR09')
insert into Distrito values('DI10','El Cafetal','PR10')

insert into Cliente values('CL01','Ronaldo Tito Nogales','9912301','76541221','Calle lincon #123','Usuario1@gmail.com','D01','PR01','DI01')
insert into Cliente values('CL02','Griselda Valdez Choque','9912302','76541222','Av. La Paz #234','Usuario2@gmail.com','D01','PR01','DI01')
insert into Cliente values('CL03','Jaquelin Velazquez Aroni','9912303','76541223','Calle Central Paris #122','Usuario3@gmail.com','D02','PR02','DI02')
insert into Cliente values('CL04','Evelyn Veliz Cardozo','9912304','76541224','Calle Mario Davalo #332','Usuario4@gmail.com','D02','PR02','DI02')
insert into Cliente values('CL05','Isabel Apaza Vicente','9912305','76541225','Calle Jorge linares #120','Usuario5@gmail.com','D03','PR03','DI03')
insert into Cliente values('CL06','Deymar Copa Medrano','9912306','76541226','Av Sucre Central #111','Usuario6@gmail.com','D03','PR03','DI03')
insert into Cliente values('CL07','Elena Antezana Cardenal','9912307','76541227','Calle Carlo Palacios #330','Usuario7@gmail.com','D04','PR04','DI04')
insert into Cliente values('CL08','Maria Antonio Mamani','9912308','76541228','Calle Sesamo Davals #887','Usuario8@gmail.com','D04','PR04','DI04')
insert into Cliente values('CL09','Aria Velazques Salas','9912309','76541229','Calle Palacios Monte #876','Usuario9@gmail.com','D05','PR05','DI05')
insert into Cliente values('CL10','Mario Luna Carrillo','9912310','76541230','Av linares #170','Usuario10@gmail.com','D05','PR05','DI05')
insert into Cliente values('CL11','Luis Vazques Carrasco','9912311','76541231','Av Carrillo Lopez #171','Usuario11@gmail.com','D06','PR06','DI06')
insert into Cliente values('CL12','Marcos Salsedo Carrion','9912312','76541232','Av Bolivia #172','Usuario12@gmail.com','D06','PR06','DI06')
insert into Cliente values('CL13','Angela Salsero Mamani','9912313','76541233','Av Sucre #173','Usuario13@gmail.com','D07','PR07','DI07')
insert into Cliente values('CL14','Patricia Montoya Lucuy','9912314','76541234','Av Aspiazu #174','Usuario14@gmail.com','D07','PR07','DI07')
insert into Cliente values('CL15','Carlos Moto Luna','9912315','76541235','Av Barrio Nuevo #175','Usuario15@gmail.com','D08','PR08','DI08')
insert into Cliente values('CL16','Tania Caquegua Huarachi','9912316','76541236','Av Barrio Sur #117','Usuario16@gmail.com','D08','PR08','DI08')
insert into Cliente values('CL17','Andrea Chavarria Olivares','9912317','76541237','Av Barrio Norte #118','Usuario17@gmail.com','D09','PR09','DI09')
insert into Cliente values('CL18','Yanina Choque Condori','9912318','76541238','Av Barrio Este #119','Usuario18@gmail.com','D09','PR09','DI09')
insert into Cliente values('CL19','Deysi Choque Quispe','9912319','76541239','Av Barrio Oeste #121','Usuario19@gmail.com','D10','PR10','DI10')
insert into Cliente values('CL20','Carmen Coca Luna','9912320','76541240','Av Sargento #122','Usuario20@gmail.com','D10','PR10','DI10')

insert into Encargado values('EC01','Carla Llanos Paredes','09:30 a 11:45','D01','PR01','DI01')
insert into Encargado values('EC02','Elizabet Bustillo Torres','15:30 a 18:00','D02','PR02','DI02')
insert into Encargado values('EC03','Camila Ramirez Perez','15:30 a 18:00','D03','PR03','DI03')
insert into Encargado values('EC04','Estefania Manrique Quevedo','09:30 a 11:45','D04','PR04','DI04')
insert into Encargado values('EC05','Sali Mendrano Llanos','15:30 a 18:00','D05','PR05','DI05')
insert into Encargado values('EC06','Estefania Aguirre Manrique','09:30 a 11:45','D06','PR06','DI06')
insert into Encargado values('EC07','Sonia Casa Lobos','15:30 a 18:00','D07','PR07','DI07')
insert into Encargado values('EC08','Pamela Hacienda Flores','15:30 a 18:00','D08','PR08','DI08')
insert into Encargado values('EC09','Lucia Manrique Llanos','09:30 a 11:45','D09','PR09','DI09')
insert into Encargado values('EC10','Angela Mamani Ramos','15:30 a 18:00','D10','PR10','DI10')

insert into evento values('EV01','02/02/2020','Av Sucre #173','700','Jardin','CL01','TE01','T01')
insert into evento values('EV02','03/03/2020','Av Sucre #173','600','Jardin Amplio','CL01','TE01','T01')
insert into evento values('EV03','04/04/2020','Av Sucre #173','550','Jardin','CL03','TE02','T02')
insert into evento values('EV04','05/05/2021','Av Sucre #173','600','Jardin','CL04','TE02','T03')
insert into evento values('EV05','06/06/2021','Av Sucre #173','700','Jardin Valle','CL03','TE01','T04')
insert into evento values('EV06','07/07/2021','Av Sucre #173','800','Jardin','CL06','TE04','T05')
insert into evento values('EV07','08/08/2022','Av Sucre #173','650','Jardin Amplio','CL03','TE01','T06')
insert into evento values('EV08','09/09/2022','Av Sucre #173','600','Jardin','CL08','TE03','T07')
insert into evento values('EV09','10/09/2022','Av Sucre #173','800','Jardin','CL09','TE05','T08')
insert into evento values('EV10','11/08/2022','Av Sucre #173','1000','Jardin Valle','CL10','TE06','T09')

insert into Citas values('CT01','11/02/2021','Carla Llanos Paredes','Oficina','Ronaldo Tito Nogales','CL01','EV01','DI01','EC01','TE01','T05')
insert into Citas values('CT02','12/03/2021','Carla Llanos Paredes','Cafeteria','Griselda Valdez Choque','CL02','EV01','DI01','EC01','TE02','T04')
insert into Citas values('CT03','13/03/2021','Elizabet Bustillo Torres','Restaurante','Jaquelin Velazquez Aroni','CL03','EV02','DI02','EC02','TE03','T03')
insert into Citas values('CT04','14/04/2021','Elizabet Bustillo Torres','Oficina','Evelyn Veliz Cardozo','CL04','EV02','DI02','EC02','TE04','T02')
insert into Citas values('CT05','15/04/2021','Elizabet Bustillo Torres','Cafeteria','Isabel Apaza Vicente','CL05','EV03','DI03','EC02','TE05','T01')
insert into Citas values('CT06','16/05/2021','Camila Ramirez Perez','Oficina','Deymar Copa Medrano','CL06','EV03','DI03','EC03','TE01','T05')
insert into Citas values('CT07','17/05/2021','Camila Ramirez Perez','Cafeteria','Elena Antezana Cardenal','CL07','EV04','DI04','EC03','TE02','T04')
insert into Citas values('CT08','18/06/2021','Estefania Manrique Quevedo','Restaurante','Maria Antonio Mamani','CL08','EV04','DI04','EC04','TE03','T03')
insert into Citas values('CT09','19/06/2021','Estefania Manrique Quevedo','Oficina','Aria Velazques Salas','CL09','EV05','DI05','EC04','TE04','T02')
insert into Citas values('CT10','18/06/2022','Sali Mendrano Llanos','Cafeteria','Mario Luna Carrillo','CL10','EV05','DI05','EC05','TE05','T01')
insert into Citas values('CT11','17/07/2022','Sali Mendrano Llanos','Oficina','Luis Vazques Carrasco','CL11','EV06','DI06','EC05','TE06','T06')
insert into Citas values('CT12','16/07/2022','Sali Mendrano Llanos','Restaurante','Marcos Salsedo Carrion','CL12','EV06','DI06','EC05','TE07','T07')
insert into Citas values('CT13','15/07/2022','Estefania Aguirre Manrique','Restaurante','Angela Salsero Mamani','CL13','EV07','DI07','EC06','TE08','T08')
insert into Citas values('CT14','14/08/2022','Estefania Aguirre Manrique','Oficina','Patricia Montoya Lucuy','CL14','EV07','DI07','EC06','TE09','T09')
insert into Citas values('CT15','13/08/2022','Sonia Casa Lobos','Cafeteria','Carlos Moto Luna','CL15','EV08','DI08','EC08','TE10','T10')
insert into Citas values('CT16','12/08/2022','Sonia Casa Lobos','Restaurante','Tania Caquegua Huarachi','CL16','EV08','DI08','EC08','TE06','T06')
insert into Citas values('CT17','11/08/2022','Sonia Casa Lobos','Restaurante','Andrea Chavarria Olivares','CL17','EV09','DI09','EC08','TE07','T07')
insert into Citas values('CT18','10/09/2022','Pamela Hacienda Flores','Restaurante','Yanina Choque Condori','CL18','EV09','DI09','EC09','TE08','T08')
insert into Citas values('CT19','09/09/2022','Pamela Hacienda Flores','Restaurante','Deysi Choque Quispe','CL19','EV10','DI10','EC09','TE09','T09')
insert into Citas values('CT20','08/10/2022','Lucia Manrique Llanos','Restaurante','Carmen Coca Luna','CL20','EV10','DI10','EC10','TE10','T10')

insert into Detalle_Cita values('CT01','EV01','1200','50')
insert into Detalle_Cita values('CT02','EV01','1250','60')
insert into Detalle_Cita values('CT03','EV02','1240','70')
insert into Detalle_Cita values('CT04','EV02','1110','80')
insert into Detalle_Cita values('CT05','EV03','1500','50')
insert into Detalle_Cita values('CT06','EV03','1320','40')
insert into Detalle_Cita values('CT07','EV04','1450','50')
insert into Detalle_Cita values('CT08','EV04','1230','60')
insert into Detalle_Cita values('CT09','EV05','1430','70')
insert into Detalle_Cita values('CT10','EV05','1320','80')
