show databases;

use akademik_3;

show tables;

select * from nilai;
select * from mahasiswa;
select * from mata_kuliah;

desc mata_kuliah;

UPDATE mata_kuliah
SET sks = NULL;


insert into mata_kuliah
values
('BDD', 'Basis Data', 3),
('SPK', 'Sistem Pendukung Keputusan', 3);

delete from nilai;

INSERT INTO nilai (NIM, kode_mata_kuliah, nilai_huruf) VALUES
    (171401, 'KCB', 'B+'),
    (171402, 'ASD', 'A'),
    (171403, 'MMT', 'B'),
    (171404, 'PBO', 'A'),
    (171404, 'KCB', 'C');

drop table nilai;
drop table mata_kuliah;


CREATE TABLE mata_kuliah (
    kode VARCHAR (3),
    nama VARCHAR (255),
    sks INT (1),
    PRIMARY KEY (kode)
);

INSERT INTO mata_kuliah (kode, nama) VALUES
('BDD', 'Basis Data Dasar'),
('PBO', 'Pemrograman Berorientasi Objek'),
('MMT', 'Multimedia Terapan'),
('SPK', 'Sistem Pendukung Keputusan'),
('KCB', 'Kecerdasan Buatan'),
('ASD', 'Algortima dan Struktur Data');

INSERT INTO mata_kuliah (sks) 
VALUES 
(3),
(2),
(4),
(1),
(5),
(6);



CREATE TABLE nilai (
    id INT AUTO_INCREMENT,
    NIM INT (2),
    kode_mata_kuliah CHAR (3),
    nilai_huruf CHAR (2),
    PRIMARY KEY (id)
);

delete from mahasiswa;

INSERT INTO mahasiswa (NIM, nama, nomor_telepon) VALUES /* Menambahkan data pada semua kolom */
(171401, 'Ani Rahmawati', '0858776453'),
(171402, 'Budi Raharjo', '0858776453'),
(171403, 'Charlie Setiabudi', '0859767553'),
(171404, 'Diandra Paramita', '0858998745');

select nim, mata_kuliah, nilai
from 
where 

select distinct nilai_huruf
from nilai;

select *
from nilai
where nilai_huruf IN ('A','C');

select * 
from nilai
where nilai_huruf between 'B' and 'D';

select *
from mahasiswa
where nama like '%ra%';

select kode
from mata_kuliah
union
select kode_mata_kuliah
from nilai; /*or*/

select kode
from mata_kuliah
intersect
select kode_mata_kuliah
from nilai; /*and*/


select kode
from mata_kuliah
except
select kode_mata_kuliah
from nilai; /*yang tidak sama dari dua tabel tsb*/




select kode_mata_kuliah
from nilai;

select kode
from mata_kuliah;

select nim, kode_mata_kuliah, nilai_huruf
from nilai
where nilai_huruf
in (select min(nilai_huruf) from nilai);

select nim, kode_mata_kuliah, nilai_huruf
from nilai
where nilai_huruf in
(select nilai_huruf from nilai
where nilai_huruf > 'A');


select nim, (select nama from mahasiswa where nilai.nim = mahasiswa.nim) nama, (select nama from mata_kuliah mk where mk.kode = nilai.kode_mata_kuliah) mk, nilai_huruf from nilai where nim = 4;

select group_concat(nim) as nim,
nilai_huruf, count(*) jumlah  from nilai group by nilai_huruf order by nilai_huruf;

UPDATE mata_kuliah
SET sks = 
    CASE
        WHEN kode = 'ASD' THEN 5
        WHEN kode = 'BDD' THEN 2
        WHEN kode = 'KCB' THEN 1
        WHEN kode = 'MMT' THEN 4
        WHEN kode = 'PBO' THEN 6
        WHEN kode = 'SPK' THEN 3
        ELSE sks
    END
WHERE kode IN ('ASD', 'BDD', 'KCB', 'MMT', 'PBO', 'SPK');

select * from mata_kuliah;
select * from nilai;


SELECT DISTINCT kode_mata_kuliah
FROM nilai
WHERE kode_mata_kuliah IN (SELECT DISTINCT kode_mata_kuliah FROM nilai);

select * from nilai
where nilai_huruf not between 'C' AND 'E';

select * from mata_kuliah
where sks > (select sks from mata_kuliah where nama = 'Basis Data Dasar');

INSERT INTO nilai (NIM, kode_mata_kuliah, nilai_huruf)
SELECT NIM, 'ASD', 'B+'
FROM nilai
WHERE nilai_huruf = 'B+'
UNION ALL
SELECT NIM, 'BDD', 'B+'
FROM nilai
WHERE nilai_huruf = 'B+'
UNION ALL
SELECT NIM, 'MMT', 'B+'
FROM nilai
WHERE nilai_huruf = 'B+'
LIMIT 3;


/*PRAKTIKUM*/


/*PRAKTIKUM 1*/
use jadwal_perkuliahan;

show databases;

select * from jadwal;

select * from prodi;

select * from kelas;

select * from ruang;

select * from hari;

select * from dosen;

select * from mk;

select * from jp;

/*PRAKTIKUM 2*/

select deskripsi_ruang
from ruang
where nama_ruang = 'LKJ1';

select distinct kode_hari
from jadwal;

select *
from ruang
where nama_ruang in ('RT01','RT10');

select *
from ruang
where kode_ruang between '0501' AND '0508';

select *
from dosen
where nama_dosen like 'E%';

select kode_dosen, kode_mk, kode_ruang, kode_hari
from jadwal
group by kode_hari;

select kode_jp, jp_mulai
from jp;
order by jp_mulai;

select * 
from jadwal
where kode_hari = '001' AND jp_mulai = 1;

select kode_hari
from hari
union
select kode_hari
from jadwal;

select kode_hari
from hari
union all
select kode_hari
from jadwal;

/*PRAKTIKUM 3*/

select kode_dosen, kode_mk, kode_hari, jp_mulai,jp_selesai
from jadwal
where jp_selesai
in (select max (jp_selesai) from jadwal);

select kode_dosen, kode_mk, kode_hari, jp_mulai,jp_selesai
from jadwal
where jp_selesai < ALL
(select jp_selesai from jadwal where jp_selesai = 6);

/*PRAKTIKUM 4*/

select avg (jp_selesai - jp_mulai) from jadwal;

select max (jp_mulai) from jadwal;

select min (jp_selesai) from jadwal;

select sum (jp_selesai - jp_mulai) from jadwal
where kode_dosen = 'D001';

select * from jadwal
where kode_dosen = 'D001';

select count (kode_ruang) from ruang;



/* TUGAS */
SELECT *
FROM jadwal
WHERE kode_hari = (SELECT kode_hari FROM hari WHERE nama_hari = 'Kamis')
AND jp_mulai = (SELECT kode_jp FROM jp WHERE jp_mulai = '08:40:00');


select count (DISTINCT kode_dosen) as jumlah_dosen
from jadwal
where kode_hari = (select kode_hari from hari where nama_hari = 'selasa');

select DISTINCT kode_dosen, kode_hari
from jadwal
where kode_hari = (select kode_hari from hari where nama_hari = 'selasa');

SELECT COUNT(DISTINCT kode_dosen) AS jumlah_dosen, GROUP_CONCAT(DISTINCT kode_dosen) AS daftar_dosen
FROM jadwal
WHERE kode_hari = (select kode_hari from hari where nama_hari = 'selasa');



SELECT j.kode_dosen, h.nama_hari, d.nama_dosen
FROM jadwal j
JOIN hari h ON j.kode_hari = h.kode_hari
JOIN dosen d ON j.kode_dosen = d.kode_dosen
WHERE j.kode_hari = '004' -- Pilih kode hari yang sesuai (misalnya '004' untuk Kamis)

INTERSECT

SELECT d.kode_dosen, h.nama_hari, d.nama_dosen
FROM dosen d
JOIN hari h ON h.kode_hari = '004' -- Pilih kode hari yang sesuai (misalnya '004' untuk Kamis)
WHERE d.nama_dosen LIKE 'A%';

select distinct *
from jadwal
order by jp_mulai asc;


SELECT  hari.nama_hari, ruang.kode_ruang, ruang.nama_ruang, ruang.deskripsi_ruang, jp.jp_mulai
FROM ruang, jadwal j, hari, jp
WHERE j.kode_hari = hari.kode_hari
    AND hari.nama_hari = 'Kamis'
    AND j.kode_ruang = ruang.kode_ruang
    AND j.jp_mulai = jp.kode_jp
ORDER BY jp.jp_mulai ASC;





