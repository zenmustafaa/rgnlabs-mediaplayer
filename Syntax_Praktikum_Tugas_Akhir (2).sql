====================MODUL_1====================

#Langkah_Pertama

create tablespace septiadipraktikum07028
datafile 'D:\Zen\ITATS\PRAKTIKUMB BASIS DATA\praktikummodul1.dbf'
size 30m;

Create user zen_07017_praktikummodul1
IDENTIFIED BY system
DEFAULT TABLESPACE PraktikumModul1
QUOTA 30M ON PraktikumModul1;\

GRANT ALL PRIVILEGES TO zen_07017_praktikummodul1;

conn zen_07017_praktikummodul1;

#langkah kedua

create table login_07017
(
Username  VARCHAR2 (15),
Password VARCHAR2 (15),
constraint PK_Username primary key (Username)
);

create table pegawai_07017
  (
  Id_pegawai INTEGER not null,
  Nama_pegawai VARCHAR2(100),
  Alamat VARCHAR(100),
  Nomor_telepon NUMBER(12),
  Username VARCHAR(15),
  Password VARCHAR(15),
  constraint PK_Pegawai primary key (Id_pegawai)
  );
create table Owner_07017
  (
  Id_owner INTEGER not null,
  Nama_owner VARCHAR2 (30),
  Nomor_telepon NUMBER (12),
  Username VARCHAR(15),
  Password VARCHAR(15),
  constraint PK_owner primary key (Id_owner)
  );
create table transaksi_07017
  (
  Id_transaksi INTEGER,
  Tanggal_transaksi DATE,
  Total_harga FLOAT,
  Pembayaran FLOAT,
  Kembalian FLOAT,
  constraint PK_transaksi primary key (Id_transaksi)
  );

create table Barang_07017
  (
  Nama_barang VARCHAR2 (100),
  Harga INTEGER,
  Jumlah INTEGER,
  constraint PK_Namabarang primary key (Nama_barang)
  );

create table Jenis_barang_07017
  (
  Id_barang INTEGER,
  Nama_jenisbarang VARCHAR(25),
  constraint PK_jenisbarang primary key (Id_barang)
  );

#Langkah Ketiga

alter table pegawai_07017
  add constraint FK_Username FOREIGN KEY (Username)
  references login_07017 (Username);

alter table Owner_07017
  add constraint FK_Username2 FOREIGN KEY (Username)
  references login_07017 (Username);

#Langkah Keempat

create sequence Id_transaksi
  minvalue 1
  maxvalue 9999
  start with 1
  increment by 1
  cache 20;

#Langkah Kelima

Alter table transaksi_07017
  add constraint transaksi_07017_unique UNIQUE (Tanggal_transaksi);

#Langkah Keenam

alter table transaksi_07017 modify(Total VARCHAR(20));

#Langkah Ketujuh

alter table transaksi_07017 rename column Total_harga to Total;

====================MODUL_2====================

conn zen_07017_praktikummodul1
insert into jenis_barang_07017 (Id_barang,Nama_jenisbarang) values (1, 'Daging Ayam');

insert into jenis_barang_07017 (Id_barang,Nama_jenisbarang) values (2, 'Daging Sapi');

insert all
  into jenis_barang_07017 (Id_barang,Nama_jenisbarang) values (3, 'Daging Pilihan')
  into jenis_barang_07017 (Id_barang,Nama_jenisbarang) values (4, 'Daging Segar')
  into jenis_barang_07017 (Id_barang,Nama_jenisbarang) values (5, 'Daging Berkualitas')
  select 1 from dual;

insert into login_07017 (Username,Password) Values ('Zenmustafaa', 'zenmustafa16');

insert into login_07017 (Username,Password) Values ('Authorize', 'zeroone');

insert all
  into login_07017 (Username,Password) Values ('Nixia','nix1a')
  into login_07017 (Username,Password) Values ('ideapad','lenovo')
  into login_07017 (Username,Password) Values ('printer','hpdeskjet')
  select 1 from dual;

insert into pegawai_07017 (Id_pegawai,Nama_pegawai,alamat,nomor_telepon,username,password) values (1, 'Zeki', 'Bumi', 123456789, 'Nixia', 'nix1a');

insert into pegawai_07017 (Id_pegawai,Nama_pegawai,alamat,nomor_telepon,username,password) values (2, 'Zeko', 'Bumi', 123456789, 'ideapad', 'lenovo');

insert all
  into pegawai_07017 (Id_pegawai,Nama_pegawai,alamat,nomor_telepon,username,password) values (3, 'Zen', 'Bumi', 123456789, 'printer', 'hpdeskjet')
  into pegawai_07017 (Id_pegawai,Nama_pegawai,alamat,nomor_telepon,username,password) values (4, 'Zeky', 'Bumi', 123456789, 'Authorize', 'zeroone')
  into pegawai_07017 (Id_pegawai,Nama_pegawai,alamat,nomor_telepon,username,password) values (5, 'Zeke', 'Bumi', 123456789, 'Zenmustafaa', 'zenmustafa16')
  select 1 from dual;

insert into owner_07017 (Id_owner,nama_owner,nomor_telepon,username,password) values (1, 'Ahmad Zen', 081351634626, 'Cotton', 'Buds');

insert into owner_07017 (Id_owner,nama_owner,nomor_telepon,username,password) values (2, 'Zen Mustafa', 081351634626, 'Jam', 'Tangan');

insert all
  into owner_07017 (Id_owner,nama_owner,nomor_telepon,username,password) values (3, 'Mustafa', 081351634626, 'Keyboard', 'Mouse')
  into owner_07017 (Id_owner,nama_owner,nomor_telepon,username,password) values (4, 'Ahmad', 081351634626, 'Obeng', 'Baut')
  into owner_07017 (Id_owner,nama_owner,nomor_telepon,username,password) values (5, 'Zen', 081351634626, 'Kabel', 'Charger')

insert into transaksi_07017 (id_transaksi,tanggal_transaksi,total,pembayaran,kembalian) values (1, to_date('1/5/2020','dd/mm/yyyy'), '1', '20000', '5000');

insert into transaksi_07017 (id_transaksi,tanggal_transaksi,total,pembayaran,kembalian) values (2, to_date('2/5/2020','dd/mm/yyyy'), '1', '20000', '5000');

insert all
  into transaksi_07017 (id_transaksi,tanggal_transaksi,total,pembayaran,kembalian) values (3, to_date('3/5/2020','dd/mm/yyyy'), '1', '20000', '5000')
  into transaksi_07017 (id_transaksi,tanggal_transaksi,total,pembayaran,kembalian) values (4, to_date('4/5/2020','dd/mm/yyyy'), '1', '20000', '5000')
  into transaksi_07017 (id_transaksi,tanggal_transaksi,total,pembayaran,kembalian) values (5, to_date('5/5/2020','dd/mm/yyyy'), '1', '20000', '5000')
  select 1 from dual;

insert into barang_07017 (Nama_barang,Harga,Jumlah) values ('Giling Bakso' ,10000, 1);

insert into barang_07017 (Nama_barang,Harga,Jumlah) values ('Giling Sempolan' ,10000, 1);

insert all
  into barang_07017 (Nama_barang,Harga,Jumlah) values ('Giling Santuy' ,10000, 1)
  into barang_07017 (Nama_barang,Harga,Jumlah) values ('Giling Sans' ,10000, 1)
  into barang_07017 (Nama_barang,Harga,Jumlah) values ('Giling Skrrtt' ,10000, 1)
  select 1 from dual;

#Langkah Kedua

UPDATE pegawai_07017 SET NOMOR_TELEPON = 000009898 ;

Update transaksi_07017 SET PEMBAYARAN = 25000 WHERE id_transaksi = 1;

Update transaksi_07017 SET PEMBAYARAN = 30000 WHERE id_transaksi = 2;

Update transaksi_07017 SET PEMBAYARAN = 35000 WHERE id_transaksi = 3;

Update transaksi_07017 SET PEMBAYARAN = 40000 WHERE id_transaksi = 4;

Update transaksi_07017 SET PEMBAYARAN = 45000 WHERE id_transaksi = 5;


UPDATE owner_07017 SET Nama_owner = 'Zen' WHERE Nama_owner LIKE 'A%n';

UPDATE owner_07017 SET Nama_owner = 'Zex' WHERE Nama_owner LIKE 'Z%a';

UPDATE owner_07017 SET Nama_owner = 'Zes' WHERE Nama_owner LIKE 'Z%n';

UPDATE owner_07017 SET Nama_owner = 'Zer' WHERE Nama_owner LIKE 'A%d';

UPDATE owner_07017 SET Nama_owner = 'Zey' WHERE Nama_owner LIKE 'M%a';

UPDATE owner_07017 SET Nama_owner = 'Zes' WHERE Nama_owner LIKE 'Z%n';


Update transaksi_07017 SET TOTAL = 1 WHERE (id_transaksi = 1 OR PEMBAYARAN = 25000) AND KEMBALIAN = 5000;

Update transaksi_07017 SET TOTAL = 1 WHERE (id_transaksi = 2 OR PEMBAYARAN = 30000) AND KEMBALIAN = 5000;

Update transaksi_07017 SET TOTAL = 1 WHERE (id_transaksi = 3 OR PEMBAYARAN = 35000) AND KEMBALIAN = 5000;

Update transaksi_07017 SET TOTAL = 1 WHERE (id_transaksi = 4 OR PEMBAYARAN = 40000) AND KEMBALIAN = 5000;

Update transaksi_07017 SET TOTAL = 1 WHERE (id_transaksi = 5 OR PEMBAYARAN = 45000) AND KEMBALIAN = 5000;

#Langkah Ketiga

DELETE FROM transaksi_07017 WHERE PEMBAYARAN < 30000 AND id_transaksi BETWEEN 1 AND 3;

DELETE FROM transaksi_07017 WHERE id_transaksi = 1 OR PEMBAYARAN = 30000;

DELETE FROM transaksi_07017 WHERE id_transaksi < 5 AND tanggal_transaksi LIKE '%4%';

#Langkah Keempat

SAVEPOINT savepoint_1;

#Langkah Kelima

UPDATE Transaksi_07017 SET Total = 2 WHERE id_transaksi = 1;

#Langkah keenam

COMMIT;

#Langkah Ketujuh

ROLLBACK;

#Langkah Kedelapan

SELECT * FROM OWNER_07017
ORDER BY Nama_owner DESC;

#Langkah Kesembilan

Select USERNAME
FROM Owner_07017
GROUP BY Username;

====================MODUL_3====================

insert into jenis_barang_07017 (Id_barang,Nama_jenisbarang) values (1, 'Daging Ayam');

insert into jenis_barang_07017 (Id_barang,Nama_jenisbarang) values (2, 'Daging Sapi');

insert all
  into jenis_barang_07017 (Id_barang,Nama_jenisbarang) values (3, 'Daging Pilihan')
  into jenis_barang_07017 (Id_barang,Nama_jenisbarang) values (4, 'Daging Segar') 
  into jenis_barang_07017 (Id_barang,Nama_jenisbarang) values (5, 'Daging Berkualitas')
  select 1 from dual;

insert into login_07017 (Username,Password) Values ('Zenmustafaa', 'zenmustafa16');

insert into login_07017 (Username,Password) Values ('Authorize', 'zeroone');

insert all
  into login_07017 (Username,Password) Values ('Nixia','nix1a')
  into login_07017 (Username,Password) Values ('ideapad','lenovo')
  into login_07017 (Username,Password) Values ('printer','hpdeskjet')
  select 1 from dual;

insert all
  into login_07017 (Username,Password) Values ('Cotton','Buds')
  into login_07017 (Username,Password) Values ('Jam','Tangan')
  into login_07017 (Username,Password) Values ('Keyboard','Mouse')
  into login_07017 (Username,Password) Values ('Obeng','Baut')
  into login_07017 (Username,Password) Values ('Kabel','Charger')
  select 1 from dual;
 
insert all
  into pegawai_07017 (Id_pegawai,Nama_pegawai,alamat,nomor_telepon,username,password) values (1, 'Zeki', 'Bumi', 123456789, 'Nixia', 'nix1a')
  into pegawai_07017 (Id_pegawai,Nama_pegawai,alamat,nomor_telepon,username,password) values (2, 'Zeko', 'Bumi', 123456789, 'ideapad', 'lenovo')
  into pegawai_07017 (Id_pegawai,Nama_pegawai,alamat,nomor_telepon,username,password) values (3, 'Zen', 'Bumi', 123456789, 'printer', 'hpdeskjet')
  into pegawai_07017 (Id_pegawai,Nama_pegawai,alamat,nomor_telepon,username,password) values (4, 'Zeky', 'Bumi', 123456789, 'Authorize', 'zeroone')
  into pegawai_07017 (Id_pegawai,Nama_pegawai,alamat,nomor_telepon,username,password) values (5, 'Zeke', 'Bumi', 123456789, 'Zenmustafaa', 'zenmustafa16')
  select 1 from dual;

insert all
  into owner_07017 (Id_owner,nama_owner,nomor_telepon,username,password) values (1, 'Ahmad Zen', 081351634626, 'Cotton', 'Buds')
  into owner_07017 (Id_owner,nama_owner,nomor_telepon,username,password) values (2, 'Zen Mustafa', 081351634626, 'Jam', 'Tangan')
  into owner_07017 (Id_owner,nama_owner,nomor_telepon,username,password) values (3, 'Mustafa', 081351634626, 'Keyboard', 'Mouse')
  into owner_07017 (Id_owner,nama_owner,nomor_telepon,username,password) values (4, 'Ahmad', 081351634626, 'Obeng', 'Baut')
  into owner_07017 (Id_owner,nama_owner,nomor_telepon,username,password) values (5, 'Zen', 081351634626, 'Kabel', 'Charger')
  select 1 from dual;

insert all
  into transaksi_07017 (id_transaksi,tanggal_transaksi,total,pembayaran,kembalian) values (1, to_date('1/5/2020','dd/mm/yyyy'), '1', '20000', '5000')
  into transaksi_07017 (id_transaksi,tanggal_transaksi,total,pembayaran,kembalian) values (2, to_date('2/5/2020','dd/mm/yyyy'), '1', '20000', '5000')
  into transaksi_07017 (id_transaksi,tanggal_transaksi,total,pembayaran,kembalian) values (3, to_date('3/5/2020','dd/mm/yyyy'), '1', '20000', '5000')
  into transaksi_07017 (id_transaksi,tanggal_transaksi,total,pembayaran,kembalian) values (4, to_date('4/5/2020','dd/mm/yyyy'), '1', '20000', '5000')
  into transaksi_07017 (id_transaksi,tanggal_transaksi,total,pembayaran,kembalian) values (5, to_date('5/5/2020','dd/mm/yyyy'), '1', '20000', '5000')
  select 1 from dual;

insert all
  into barang_07017 (Nama_barang,Harga,Jumlah) values ('Giling Bakso' ,10000, 1)
  into barang_07017 (Nama_barang,Harga,Jumlah) values ('Giling Sempolan' ,10000, 1)
  into barang_07017 (Nama_barang,Harga,Jumlah) values ('Giling Santuy' ,10000, 1)
  into barang_07017 (Nama_barang,Harga,Jumlah) values ('Giling Sans' ,10000, 1)
  into barang_07017 (Nama_barang,Harga,Jumlah) values ('Giling Skrrtt' ,10000, 1)
  select 1 from dual;

select nama_barang, max(harga) AS harga_tertinggi,
  MIN(harga) AS harga_terendah
  FROM barang_07017
  GROUP BY nama_barang;

select nama_pegawai, count(nama_pegawai) AS Username
  From pegawai_07017 WHERE id_pegawai <= 3 AND Nomor_Telepon LIKE '%9898%'
  GROUP BY nama_pegawai;

select avg(harga) as rata2 from barang_07017 where jumlah = 1;

select nama_barang,(select max(harga) as terbanyak from barang_07017) as harga_tertinggi,
  (select min(harga) as terendah from barang_07017) as harga_terendah from barang_07017;

select nama_barang,(select count(harga) as daftar_harga
  from barang_07017 where nama_barang like '%G%' or jumlah <2)
  as daftar_harga from barang_07017;

select id_transaksi,(select sum(pembayaran) as Bayar from transaksi_07017)
  as bayar from transaksi_07017;

select id_transaksi,(select avg(total) as Rata2_total from transaksi_07017)
  as Rata2_total from transaksi_07017;

select id_transaksi,(select avg(total) as Rata2_total from transaksi_07017)
  as Rata2_total from transaksi_07017 group by id_transaksi;

select id_transaksi from transaksi_07017 where id_transaksi <
  (select sum(id_transaksi) as Banyak_transaksi from transaksi_07017);

select id_transaksi,(select avg(total) as rata2_total from transaksi_07017
  where total < (select sum(total)from transaksi_07017
  where id_transaksi<(select id_transaksi from transaksi_07017 where id_transaksi=5)))
  as rata2_total from transaksi_07017;


====================MODUL_4====================

insert into jenis_barang_07017 (Id_barang,Nama_jenisbarang) values (1, 'Daging Ayam');

insert into jenis_barang_07017 (Id_barang,Nama_jenisbarang) values (2, 'Daging Sapi');

insert all
  into jenis_barang_07017 (Id_barang,Nama_jenisbarang) values (3, 'Daging Pilihan')
  into jenis_barang_07017 (Id_barang,Nama_jenisbarang) values (4, 'Daging Segar') 
  into jenis_barang_07017 (Id_barang,Nama_jenisbarang) values (5, 'Daging Berkualitas')
  select 1 from dual;

insert into login_07017 (Username,Password) Values ('Zenmustafaa', 'zenmustafa16');

insert into login_07017 (Username,Password) Values ('Authorize', 'zeroone');

insert all
  into login_07017 (Username,Password) Values ('Nixia','nix1a')
  into login_07017 (Username,Password) Values ('ideapad','lenovo')
  into login_07017 (Username,Password) Values ('printer','hpdeskjet')
  select 1 from dual;

insert all
  into login_07017 (Username,Password) Values ('Cotton','Buds')
  into login_07017 (Username,Password) Values ('Jam','Tangan')
  into login_07017 (Username,Password) Values ('Keyboard','Mouse')
  into login_07017 (Username,Password) Values ('Obeng','Baut')
  into login_07017 (Username,Password) Values ('Kabel','Charger')
  select 1 from dual;
 
insert all
  into pegawai_07017 (Id_pegawai,Nama_pegawai,alamat,nomor_telepon,username,password) values (1, 'Zeki', 'Bumi', 123456789, 'Nixia', 'nix1a')
  into pegawai_07017 (Id_pegawai,Nama_pegawai,alamat,nomor_telepon,username,password) values (2, 'Zeko', 'Bumi', 123456789, 'ideapad', 'lenovo')
  into pegawai_07017 (Id_pegawai,Nama_pegawai,alamat,nomor_telepon,username,password) values (3, 'Zen', 'Bumi', 123456789, 'printer', 'hpdeskjet')
  into pegawai_07017 (Id_pegawai,Nama_pegawai,alamat,nomor_telepon,username,password) values (4, 'Zeky', 'Bumi', 123456789, 'Authorize', 'zeroone')
  into pegawai_07017 (Id_pegawai,Nama_pegawai,alamat,nomor_telepon,username,password) values (5, 'Zeke', 'Bumi', 123456789, 'Zenmustafaa', 'zenmustafa16')
  select 1 from dual;

insert all
  into owner_07017 (Id_owner,nama_owner,nomor_telepon,username,password) values (1, 'Ahmad Zen', 081351634626, 'Cotton', 'Buds')
  into owner_07017 (Id_owner,nama_owner,nomor_telepon,username,password) values (2, 'Zen Mustafa', 081351634626, 'Jam', 'Tangan')
  into owner_07017 (Id_owner,nama_owner,nomor_telepon,username,password) values (3, 'Mustafa', 081351634626, 'Keyboard', 'Mouse')
  into owner_07017 (Id_owner,nama_owner,nomor_telepon,username,password) values (4, 'Ahmad', 081351634626, 'Obeng', 'Baut')
  into owner_07017 (Id_owner,nama_owner,nomor_telepon,username,password) values (5, 'Zen', 081351634626, 'Kabel', 'Charger')
  select 1 from dual;

insert all
  into transaksi_07017 (id_transaksi,tanggal_transaksi,total,pembayaran,kembalian) values (1, to_date('1/5/2020','dd/mm/yyyy'), '1', '20000', '5000')
  into transaksi_07017 (id_transaksi,tanggal_transaksi,total,pembayaran,kembalian) values (2, to_date('2/5/2020','dd/mm/yyyy'), '1', '20000', '5000')
  into transaksi_07017 (id_transaksi,tanggal_transaksi,total,pembayaran,kembalian) values (3, to_date('3/5/2020','dd/mm/yyyy'), '1', '20000', '5000')
  into transaksi_07017 (id_transaksi,tanggal_transaksi,total,pembayaran,kembalian) values (4, to_date('4/5/2020','dd/mm/yyyy'), '1', '20000', '5000')
  into transaksi_07017 (id_transaksi,tanggal_transaksi,total,pembayaran,kembalian) values (5, to_date('5/5/2020','dd/mm/yyyy'), '1', '20000', '5000')
  select 1 from dual;

insert all
  into barang_07017 (Nama_barang,Harga,Jumlah) values ('Giling Bakso' ,10000, 1)
  into barang_07017 (Nama_barang,Harga,Jumlah) values ('Giling Sempolan' ,10000, 1)
  into barang_07017 (Nama_barang,Harga,Jumlah) values ('Giling Santuy' ,10000, 1)
  into barang_07017 (Nama_barang,Harga,Jumlah) values ('Giling Sans' ,10000, 1)
  into barang_07017 (Nama_barang,Harga,Jumlah) values ('Giling Skrrtt' ,10000, 1)
  select 1 from dual;

select a.username, b.nama_pegawai
  from login_07017 a join
  pegawai_07017 b
  on a.username = b.username
  where rownum <= 10;

select a.username, b.nama_owner
  from login_07017 a join
  owner_07017 b
  on a.username = b.username
  where rownum <=10;

select a.nama_pegawai AS nama_pegawai_ok, b.tanggal_transaksi, c.pembayaran
  from pegawai_07017 a
  left join transaksi_07017 b ON a.id_pegawai = b.id_transaksi
  left join transaksi_07017 c ON b.id_transaksi = c.id_transaksi
  where a.id_pegawai between (select min(id_pegawai)
  from pegawai_07017) and (select max(id_pegawai)
  from pegawai_07017);

select a.nama_pegawai as pegawai,
  count (b.id_transaksi) as jumlah_transaksi, c.nama_owner as pembeli
  from pegawai_07017 a
  right join transaksi_07017 b
  ON a.id_pegawai = b.id_transaksi
  right join owner_07017 c
  ON b.id_transaksi = c.id_owner
  where not c.nama_owner LIKE '%r%' and not c.nama_owner LIKE '%e%'
  Group by a.nama_pegawai, nama_owner;

create view list_pegawai
  as select id_pegawai, nama_pegawai, alamat, nomor_telepon, username, password
  from pegawai_07017;

INSERT INTO list_pegawai (id_pegawai, nama_pegawai, alamat, nomor_telepon, username, password)
  VALUES (12, 'kekeyi', 'odongodong', 2231456, 'ideapad', 'lenovo');

select * from list_pegawai;

create view list_transaksi07017 AS SELECT a.nama_pegawai AS pegawai, b.tanggal_transaksi, b.pembayaran FROM pegawai_07017 a JOIN transaksi_07017 b ON a.id_pegawai = b.id_transaksi WHERE rownum <=10;

create view list_pegawai07017 AS SELECT a.nama_pegawai AS nama_pegawai_ok, b.tanggal_transaksi, c.pembayaran FROM pegawai_07017 a LEFT JOIN transaksi_07017 b ON a.id_pegawai = b.id_transaksi LEFT JOIN transaksi_07017 c ON b.id_transaksi = c.id_transaksi WHERE a.id_pegawai BETWEEN (SELECT MIN(id_pegawai) FROM pegawai_07017) AND (SELECT MAX(id_pegawai) FROM pegawai_07017);

create view list_jumlahtransaksi07017 as SELECT a. nama_pegawai as pegawai,COUNT(b.id_transaksi) as jumlah_transaksi, c.nama_owner as pembeli from pegawai_07017 a RIGHT JOIN transaksi_07017 b ON a.id_pegawai = b.id_transaksi RIGHT JOIN owner_07017 c ON b.id_transaksi = c.id_owner WHERE NOT c.nama_owner LIKE '%r%' AND NOT c.nama_owner LIKE '%e%' GROUP BY a.nama_pegawai, nama_owner;

INSERT INTO list_transaksi07017 (pegawai, tanggal_transaksi, pembayaran) VALUES ('Agus', TO_DATE('05/05/2020','dd/mm/yyyy'),'50000');

select * from user_updatable_columns WHERE table_name LIKE 'LIST%';

====================MODUL_5======================

package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Koneksi_07017 {

    private Connection connect;
    private Statement db;
    private String username = "zen_07017_praktikummodul1";
    private String password = "system";

    public Koneksi_07017() {
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            System.out.println("Class Driver Ditemukan");
            try {
                connect = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", username,password);
                System.out.println("Koneksi Database Sukses");
            } catch (SQLException se) {
                System.out.println("Koneksi Database Gagal : " + se);
            }
        } catch (ClassNotFoundException err) {
            System.out.println("Class Driver Tidak Ditemukan, Terjadi Kesalahan Pada : " + err);
        }
    }

    public ResultSet GetData(String sql) {
        try {
            db = connect.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
            return db.executeQuery(sql);
        } catch (SQLException e) {
            return null;
        }
    }

    public int ManipulasiData(String sql) {
        try {
            db = connect.createStatement();
            return db.executeUpdate(sql);
        } catch (SQLException e) {
            return 0;
        }
    }

}
                System.out.println("Koneksi Database Gagal : " + se);
            }
        } catch (ClassNotFoundException err) {
            System.out.println("Class Driver Tidak Ditemukan, Terjadi Kesalahan Pada : " + err);
        }
    }

    public ResultSet GetData(String sql) {
        try {
            db = connect.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
            return db.executeQuery(sql);
        } catch (SQLException e) {
            return null;
        }
    }

    public int ManipulasiData(String sql) {
        try {
            db = connect.createStatement();
            return db.executeUpdate(sql);
        } catch (SQLException e) {
            return 0;
        }
    }

}
                System.out.println("Koneksi Database Gagal : " + se);
            }
        } catch (ClassNotFoundException err) {
            System.out.println("Class Driver Tidak Ditemukan, Terjadi Kesalahan Pada : " + err);
        }
    }

    public ResultSet GetData(String sql) {
        try {
            db = connect.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
            return db.executeQuery(sql);
        } catch (SQLException e) {
            return null;
        }
    }

    public int ManipulasiData(String sql) {
        try {
            db = connect.createStatement();
            return db.executeUpdate(sql);
        } catch (SQLException e) {
            return 0;
        }
    }

}
                System.out.println("Koneksi Database Gagal : " + se);
            }
        } catch (ClassNotFoundException err) {
            System.out.println("Class Driver Tidak Ditemukan, Terjadi Kesalahan Pada : " + err);
        }
    }

    public ResultSet GetData(String sql) {
        try {
            db = connect.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
            return db.executeQuery(sql);
        } catch (SQLException e) {
            return null;
        }
    }

    public int ManipulasiData(String sql) {
        try {
            db = connect.createStatement();
            return db.executeUpdate(sql);
        } catch (SQLException e) {
            return 0;
        }
    }

}
  public void insert(String namaPegawai, String alamat, String noTelepon, String username, String password) {
        String kodeSql = "INSERT INTO login_07017 (username, password) VALUES ('" + username 
                + "', '" + password + "')";
        this.koneksiDatabase.manipulasiData(kodeSql);
        
        String kodeSql2 = "INSERT INTO pegawai_07017 (id_pegawai, nama_pegawai, alamat, nomor_telepon, username, "
                + "password) VALUES (" + "id_pegawai.NEXTVAL, '" + namaPegawai + "', '" + alamat + 
                "', '" + noTelepon + "', '" +username +"', '" + password + "')";
        this.koneksiDatabase.manipulasiData(kodeSql2);
    }
String kodeSql = "SELECT * FROM list_pegawai";
        ResultSet hasilKodeSql = this.koneksiDatabase.getData(kodeSql);
        while (hasilKodeSql.next()) {
            int idPegawai = hasilKodeSql.getInt("id_pegawai");
            String namaPegawai = hasilKodeSql.getString("nama_pegawai");
            String alamat = hasilKodeSql.getString("alamat");
            String noTelepon = hasilKodeSql.getString("nomor_telepon");
            String username = hasilKodeSql.getString("username");
            String password = hasilKodeSql.getString("password");
            ModelPegawai modelPegawai = new ModelPegawai(idPegawai, namaPegawai, alamat, noTelepon, 
                    username, password);
            Object[] temp = new Object[6];
            temp[0] = modelPegawai.getIdPegawai();
            temp[1] = modelPegawai.getNama();
            temp[2] = modelPegawai.getAlamat();
            temp[3] = modelPegawai.getNoTelepon();
            temp[4] = modelPegawai.getUsername();
            temp[5] = modelPegawai.getPassword();
            tabelModelPegawai.addRow(temp);
        }
            temp[2] = modelPegawai.getAlamat();
            temp[3] = modelPegawai.getNoTelepon();
            temp[4] = modelPegawai.getUsername();
            temp[5] = modelPegawai.getPassword();
            tabelModelPegawai.addRow(temp);
        }
public void update(int idPegawai, String namaPegawai, String alamat, String noTelepon) {
        String kodeSql = "UPDATE pegawai_07017 SET nama_pegawai = '" + namaPegawai 
                + "', alamat = '" + alamat + "', nomor_telepon = '" + noTelepon 
                + "' WHERE id_pegawai = " + idPegawai;
        this.koneksiDatabase.manipulasiData(kodeSql);
    }
public void delete(int idPegawai) {
        String kodeSql = "DELETE FROM pegawai_07017 WHERE id_pegawai = " + idPegawai;
        this.koneksiDatabase.manipulasiData(kodeSql);
    }
String kodeSql = "SELECT a.id_transaksi, a.tanggal_transaksi, "
                + "a.total, a.pembayaran, a.kembalian, "
                + "b.id_pegawai, b.nama_pegawai "
                + "FROM transaksi_07017 a "
                + "JOIN pegawai_07017 b ON a.id_pegawai = b.id_pegawai";
String kodeSql = "SELECT * FROM list_pegawai";