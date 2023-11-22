--membuat tabel data buku
create table data_buku  (
bid int PRIMARY KEY not null,
title varchar,
author varchar,	
category varchar,
status varchar,
publication_year int,
unit_price float,
stok int
)

-- merubah nama kolom bid menjadi id_book
alter table data_buku 
rename column bid to id_book

--membuat tabel anggota
create table anggota  (
ID_Anggota int PRIMARY KEY not null,
name_member varchar,
no_identity BIGINT, 	
education varchar, 	
gender varchar,	
address varchar,
job varchar,	
mobile_number BIGINT, 	
borrowed_amount int
)

-- membuat tabel pengurus 
create table pengurus(
	Librarian_ID int primary key not null,
	name_ varchar,	
	education varchar, 	
	gender varchar,	
	address varchar,
	username varchar,	
	Password_ varchar,
	mobile_number BIGINT
)

-- membuat table pinjam buku 
create table pinjam ( 
	Tanggal_pinjam date,
	ID_pinjam varchar primary key ,
	ID_pengurus int,
	ID_anggota int,	
	ID_buku int,
	jumlah_buku int
)

-- membuat tabel pegembalian
create table pengembalian( 
	Tanggal_pengembalian date,
	ID_pengurus	int,
	ID_pengembalian varchar primary key,
	ID_pinjam varchar,	
	dikembalikan date
)
alter table pengembalian 
rename column ID_peminjam to ID_pinjaman
-- memasukan data yang diperlukan
insert into anggota 
       (ID_Anggota, name_member, no_identity, education, gender, address, job, mobile_number,borrowed_amount ) 
values 
	   (158843, 'Mutia Astuti', 1584896194, 'Bachelor', 'Female', 'Jln. Mangga 52 Bekasi Timur', 'Mahasiswa', 628120121958, 4),
	   (155941, 'Bahrudin', 1584444194, 'Proffesor', 'Male', 'Jln. Pencenonan Raya Jakarta Pusat', 'Manager', 628123691958, 10),
	   (157846, 'Mahalini', 15848931194, 'High School', 'Female', 'Jln. Cendrawasih 12 mekarsari Depok', 'Wiraswasta', 628121478958, 2),
	   (152845, 'Dimas Anggara', 15849876194, 'Bachelor', 'Male', 'Apartmen Cibubur Jakarta Timur', 'Programer', 628797120021, 5),
	   (159841, 'Ferlix Aliadro', 15848919794, 'Master', 'Male', 'Perumahan Jasindo JL.Mekar Bunga Cilegon', 'CEO', 6208590121958, 17),
	   (184578, 'John Doe', 123456789, 'Bachelor', 'Male', '123 Main St, Cityville', 'Engineer', 1234567890, 0),
	   (298547, 'Jane Smith', 987654321, 'Master', 'Female', '456 Oak St, Townsville', 'Doctor', 9876543210, 3),
       (336140, 'Bob Johnson', 345678901, 'High School', 'Male', '789 Pine St, Villagetown', 'Teacher', 2345678901, 1),
       (434852, 'Alice Brown', 567890123, 'PhD', 'Female', '910 Elm St, Boroughville', 'Scientist', 3456789012, 2),
       (597002, 'Michael White', 789012345, 'Bachelor', 'Male', '111 Maple St, Hamletville', 'Programmer', 4567890123, 5),
       (609862, 'Emily Davis', 234567890, 'Master', 'Female', '222 Cedar St, Villageville', 'Artist', 5678901234, 8),
       (799801, 'David Green', 890123456, 'High School', 'Male', '333 Oak St, Hamletsville', 'Manager', 6789012345, 10),
       (897541, 'Olivia Wilson', 456789012, 'PhD', 'Female', '444 Pine St, Boroughtown', 'Researcher', 7890123456, 12),
       (999785, 'Liam Anderson', 678901234, 'Bachelor', 'Male', '555 Elm St, Citytown', 'Engineer', 8901234567, 15),
       (105514, 'Sophia Martin', 890123456, 'Master', 'Female', '666 Birch St, Villagetown', 'Doctor', 9012345678, 7),
       (110214, 'Noah Taylor', 123450987, 'High School', 'Male', '777 Cedar St, Cityville', 'Teacher', 1234567890, 3),
       (128724, 'Emma Moore', 543210987, 'PhD', 'Female', '888 Oak St, Hamletville', 'Scientist', 2345678901, 6),
       (139641, 'William Parker', 987654321, 'Bachelor', 'Male', '999 Pine St, Townsville', 'Programmer', 3456789012, 9),
       (148874, 'Ava Carter', 321098765, 'Master', 'Female', '101 Maple St, Boroughtown', 'Artist', 4567890123, 11),
       (153645, 'James Smith', 135792468, 'High School', 'Male', '202 Elm St, Citytown', 'Manager', 5678901234, 4);



-- memasukan data yang diperlukan 
insert into pengurus
	(Librarian_ID,name_,education,gender,address,username,Password_,mobile_number)
values
	 (008654, 'David','S1', 'L', 'Jln. Mutiara laut timur 02 Cakung', 'dabvusne5750','Ascd11' , 628980121958),
	 (001478, 'Putri','S1', 'P', 'Jln. Pesanggarahan Jakarta Timur', 'pkatds157','Uyhts5' , 6281201200118),
	 (000364, 'Carolina','S1', 'P', 'Jln. Gatot Subroto Utomo Jakart Pusat', 'p54oenoud','VbTR887', 628771216958)

	 	
)
	 
insert into pinjam
	(tanggal_pinjam, id_pinjam, id_pengurus, id_anggota, id_buku,jumlah_buku)
values 
	('2023-11-07',46466 , 001478, 609862, 4, 5),
	('2023-11-09',64646 , 000364, 128724, 2, 2),
	('2023-11-11',62215 , 008654, 184578, 3, 2),
	('2023-11-13',48314 , 001478, 157846, 1, 5),
	('2023-11-15',36971 , 008654, 153645, 15, 3),
	('2023-11-17',12457 , 008654, 110214, 2, 1),
	('2023-11-19',98542 , 001478, 434852, 13, 4),
	('2023-11-21',39758 , 000364, 298547, 1, 4),
	('2023-11-23',31252 , 001478, 184578, 4, 5),
	('2023-11-25',85274 , 000364, 298547, 2, 3)

insert into pengembalian
	(tanggal_pengembalian, id_pengurus, id_pengembalian , id_pinjam , dikembalikan)
values 
	('2023-11-10', 001478, 1254 ,46466 , '2023-11-10'),
	('2023-11-12', 000364, 3250 ,64646 , '2023-11-13'),
	('2023-11-14', 008654, 9985 ,62215 , '2023-11-14'),
	('2023-11-16', 001478, 2165 ,48314 , '2023-11-18'),
	('2023-11-18', 008654, 8946 ,36971 , '2023-11-18'),
	('2023-11-20', 008654, 5215 ,12457 , '2023-11-20'),
	('2023-11-22', 001478, 9147 ,98542 , '2023-11-25'),
	('2023-11-24', 000364, 3254 ,39758 , '2023-11-24'),
	('2023-11-26', 001478, 2222 ,31252 , '2023-11-29'),
	('2023-11-28', 000364, 8800 ,85274 , '2023-11-28')	
	
select * from data_buku;
select * from anggota;
select * from pengurus ;
select * from pinjam ;
select * from pengembalian;