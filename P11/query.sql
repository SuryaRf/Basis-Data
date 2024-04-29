use jadwal_perkuliahan;

show tables;

/* Praktikum 1 */

CREATE DATABASE jadwal_perkuliahan;

Use jadwal_perkuliahan;

CREATE TABLE dosen (
    kode_dosen VARCHAR(4) NOT NULL,
    nama_dosen VARCHAR(100) DEFAULT NULL
);

CREATE TABLE hari (
    kode_hari VARCHAR(3) NOT NULL,
    nama_hari VARCHAR(100) DEFAULT NULL
);

CREATE TABLE jadwal (
    kode_jadwal INT(10) NOT NULL,
    kode_kelas VARCHAR(10) DEFAULT NULL,
    kode_dosen VARCHAR(4) DEFAULT NULL,
    kode_mk VARCHAR(5) DEFAULT NULL,
    kode_ruang VARCHAR(5) DEFAULT NULL,
    kode_hari VARCHAR(3) DEFAULT NULL,
    jp_mulai INT(3) DEFAULT NULL,
    jp_selesai INT(3) DEFAULT NULL
);

CREATE TABLE jp (
    kode_jp INT(3) NOT NULL,
    jp_mulai TIME DEFAULT NULL,
    jp_selesai TIME DEFAULT NULL
);

CREATE Table kelas (
    kode_kelas VARCHAR(10) NOT NULL,
    kode_prodi VARCHAR(3) DEFAULT NULL,
    nama_kelas VARCHAR(5) DEFAULT NULL
);

CREATE TABLE mk (
    kode_mk VARCHAR(5) NOT NULL,
    nama_mk VARCHAR(100) NOT NULL
);

CREATE TABLE prodi (
    kode_prodi VARCHAR(3) NOT NULL,
    nama_prodi VARCHAR(100) DEFAULT NULL
);

CREATE TABLE ruang (
    kode_ruang VARCHAR(5) NOT NULL,
    nama_ruang VARCHAR(20) DEFAULT NULL,
    deskripsi_ruang VARCHAR(100) DEFAULT NULL
);


ALTER Table dosen
    ADD PRIMARY KEY (kode_dosen);
ALTER Table hari
    ADD PRIMARY KEY (kode_hari);
ALTER Table jadwal
    ADD PRIMARY KEY (kode_jadwal); 
ALTER Table jp
    ADD PRIMARY KEY (kode_jp);
ALTER Table kelas
    ADD PRIMARY KEY (kode_kelas);
ALTER Table mk
    ADD PRIMARY KEY (kode_mk);
ALTER Table prodi
    ADD PRIMARY KEY (kode_prodi);
ALTER Table ruang
    ADD PRIMARY KEY (kode_ruang);

ALTER TABLE jadwal
    MODIFY kode_jadwal INT(10) NOT NULL AUTO_INCREMENT;

ALTER TABLE jadwal
    ADD FOREIGN KEY (kode_dosen) REFERENCES dosen (kode_dosen),
    ADD FOREIGN KEY (kode_mk) REFERENCES mk (kode_mk),
    ADD FOREIGN KEY (kode_ruang) REFERENCES ruang (kode_ruang),
    ADD FOREIGN KEY (kode_hari) REFERENCES hari (kode_hari),
    ADD FOREIGN KEY (jp_mulai) REFERENCES jp (kode_jp),
    ADD FOREIGN KEY (jp_selesai) REFERENCES jp (kode_jp),
    ADD FOREIGN KEY (kode_kelas) REFERENCES kelas (kode_kelas);


ALTER TABLE kelas
    ADD FOREIGN KEY (kode_prodi) REFERENCES prodi (kode_prodi);

/* Praktikum 2 */

INSERT INTO mk (kode_mk, nama_mk) VALUES
    ('02010', 'Basis Data');

INSERT INTO mk (kode_mk, nama_mk) VALUES
    ('02041', 'Teknologi Data');

INSERT INTO mk VALUES
    ('02004', 'Aljabar Linier'),
    ('02005', 'Analisis Dan Desain Berorientasi Objek'),
    ('02006', 'Bahasa Indonesia');

INSERT INTO mk VALUES
    ('02001', 'Agama'),
    ('02002', 'Alajabar Linier'),
    ('02003', 'Algoritma dan Struktur Data');

INSERT INTO mk SET
    kode_mk = '02011',
    nama_mk = 'Desain Pemrograman Web';

CREATE TABLE mk_backup (
    kode_mk VARCHAR(5) NOT NULL,
    nama_mk VARCHAR(100) NOT NULL
);

INSERT INTO mk_backup
    SELECT * FROM mk;

/* Praktikum 3 */

--
-- Dumping data untuk tabel prodi
--

INSERT INTO prodi (kode_prodi, nama_prodi) VALUES
('001', 'D3 Manajemen Informatika'),
('002', 'D4 Teknik Informatika');

--
-- Dumping data untuk tabel dosen
--

INSERT INTO dosen (kode_dosen, nama_dosen) VALUES
('D001', 'Abdul Chalim, SAg., MPd.I'),
('D002', 'Ade Ismail'),
('D003', 'Agung Nugroho Pramudhita ST., MT.'),
('D004', 'Ahmadi Yuli Ananta ST., MM.'),
('D005', 'Ane Fany Novitasari, SH.MKn.'),
('D006', 'Annisa Puspa Kirana MKom.'),
('D007', 'Annisa Taufika Firdausi ST., MT.'),
('D008', 'Anugrah Nur Rahmanto SSn., MDs.'),
('D009', 'Ariadi Retno Ririd SKom., MKom.'),
('D010', 'Arie Rachmad Syulistyo SKom., MKom.'),
('D011', 'Arief Prasetyo SKom., MKom.'),
('D012', 'Arwin Sumari ST., MT., DR.'),
('D013', 'Atiqah Nurul Asri SPd., MPd.'),
('D014', 'Bagas Satya Dian Nugraha, ST., MT.'),
('D015', 'Banni Satria Andoko, S. Kom., M.MSI'),
('D016', 'Budi Harijanto ST., MMKom.'),
('D017', 'Cahya Rahmad ST., MKom. DR.Eng'),
('D018', 'Candra Bella Vista SKom., MT.'),
('D019', 'Candrasena Setiadi ST., MMT.'),
('D020', 'Deasy Sandhya Elya Ikawati SSi., MSi.'),
('D021', 'Deddy Kusbianto PA Ir. MMKom.'),
('D022', 'Dhebys Suryani SKom. MT.'),
('D023', 'Dian Hanifudin Subhi SKom., MT.'),
('D024', 'Dika Rizky Yunianto SKom., MKom.'),
('D025', 'Dimas Wahyu Wibowo ST., MT.'),
('D026', 'Dodit Supriyanto SKom., MT.'),
('D027', 'Dwi Puspitasari SKom., MKom.'),
('D028', 'Eka Larasati Amalia, SST., MT.'),
('D029', 'Ekojono, ST., M.Kom.'),
('D030', 'Elok Nur Hamdana, ST., MT'),
('D031', 'Erfan Rohadi, ST., MEng., PhD.'),
('D032', 'Faiz Ushbah Mubarok, SPd., MPd.'),
('D033', 'Farid Angga Pribadi, SKom.,MKom.'),
('D034', 'Farida Ulfa, SPd., MPd.'),
('D035', 'Gunawan Budi Prasetyo, ST., MMT., Ph.D.'),
('D036', 'Habibie Ed Dien, MT.'),
('D037', 'Hairus'),
('D038', 'Hendra Pradibta, SE., M.Sc.'),
('D039', 'Ika Kusumaning Putri, MT.'),
('D040', 'Imam Fahrur Rozi, ST., MT.'),
('D041', 'Indra Dharma Wijaya, ST., MMT.'),
('D042', 'Irsyad Arif Mashudi, M.Kom'),
('D043', 'Kadek Suarjuna Batubulan, SKom, MT.'),
('D044', 'Luqman Affandi, SKom., MMSI.'),
('D045', 'M. Hasyim Ratsanjani'),
('D046', 'Mamluatul Haniah'),
('D047', 'Meyti Eka Apriyani ST., MT.'),
('D048', 'Milyun Nima Shoumi'),
('D049', 'Moch. Zawaruddin Abdullah, S.ST., M.Kom'),
('D050', 'Moh. Amin'),
('D051', 'Muhammad Afif Hendrawan, S.Kom.'),
('D052', 'Muhammad Shulhan Khairy, SKom., MKom.'),
('D053', 'Muhammad Unggul Pamenang, SSt., MT.'),
('D054', 'Mungki Astiningrum, ST., MKom.'),
('D055', 'Mustika Mentari, SKom., MKom.'),
('D056', 'Noprianto'),
('D057', 'Odhitya Desta Triswidrananta, SPd., MPd.'),
('D058', 'Pramana Yoga Saputra, SKom., MMT.'),
('D059', 'Putra Prima A., ST., MKom.'),
('D060', 'Rakhmat Arianto SST., MKom.'),
('D061', 'Rawansyah., Drs., MPd.'),
('D062', 'Retno Damayanti, SPd.'),
('D063', 'Ridwan Rismanto, SST., MKom.'),
('D064', 'Rizki Putri Ramadhani, S.S., M.Pd.'),
('D065', 'Rizky Ardiansyah, SKom., MT.'),
('D066', 'Robby Anggriawan SE., ME.'),
('D067', 'Rokhimatul Wakhidah SPd. MT.'),
('D068', 'Rosa Andrie Asmara, ST., MT., Dr. Eng.'),
('D069', 'Rudy Ariyanto, ST., MCs.'),
('D070', 'Satrio Binusa S, SS, M.Pd'),
('D071', 'Septian Enggar Sukmana, SPd., MT.'),
('D072', 'Shohib Muslim'),
('D073', 'Siti Romlah, Dra., M.M.'),
('D074', 'Sofyan Noor Arief, S.ST., M.Kom.'),
('D075', 'Ulla Delfiana Rosiani, ST., MT.'),
('D076', 'Usman Nurhasan, S.Kom., MT.'),
('D077', 'Very Sugiarto, SPd., MKom.'),
('D078', 'Vipkas Al Hadid Firdaus, ST.,MT.'),
('D079', 'Vivi Nur Wijayaningrum, S.Kom, M.Kom'),
('D080', 'Vivin Ayu Lestari, SPd.'),
('D081', 'Widaningsih Condrowardhani, SH., MH.'),
('D082', 'Wilda Imama Sabilla, S.Kom., M.Kom.'),
('D083', 'Yoppy Yunhasnawa, SST., MSc.'),
('D084', 'Yuri Ariyanto, SKom., MKom.'),
('D085', 'Zulmy Faqihuddin Putera, S.Pd., M.Pd');

--
-- Dumping data untuk tabel hari
--

INSERT INTO hari (kode_hari, nama_hari) VALUES
('001', 'Senin'),
('002', 'Selasa'),
('003', 'Rabu'),
('004', 'Kamis'),
('005', 'Jumat'),
('006', 'Sabtu'),
('007', 'Minggu');

--
-- Dumping data untuk tabel jp
--

INSERT INTO jp (kode_jp, jp_mulai, jp_selesai) VALUES
(1, '07:00:00', '07:50:00'),
(2, '07:50:00', '08:40:00'),
(3, '08:40:00', '09:30:00'),
(4, '09:40:00', '10:30:00'),
(5, '10:30:00', '11:20:00'),
(6, '11:20:00', '12:10:00'),
(7, '12:50:00', '13:40:00'),
(8, '13:40:00', '14:30:00'),
(9, '14:30:00', '15:20:00'),
(10, '15:30:00', '15:30:00'),
(11, '16:20:00', '17:10:00'),
(12, '17:10:00', '18:00:00');

--
-- Dumping data untuk tabel kelas
--

INSERT INTO kelas (kode_kelas, kode_prodi, nama_kelas) VALUES
('2021010101', '001', 'MI-1A'),
('2021010102', '001', 'MI-1B'),
('2021010103', '001', 'MI-1C'),
('2021010104', '001', 'MI-1D'),
('2021010105', '001', 'MI-1E'),
('2021010106', '001', 'MI-1F'),
('2021010107', '001', 'MI-1H'),
('2021010201', '001', 'MI-2A'),
('2021010202', '001', 'MI-2B'),
('2021010203', '001', 'MI-2C'),
('2021010204', '001', 'MI-2D'),
('2021010205', '001', 'MI-2E'),
('2021010206', '001', 'MI-2F'),
('2021010301', '001', 'MI-3A'),
('2021010302', '001', 'MI-3B'),
('2021010303', '001', 'MI-3C'),
('2021010304', '001', 'MI-3D'),
('2021010305', '001', 'MI-3E'),
('2021010306', '001', 'MI-3F'),
('2021020101', '002', 'TI-1A'),
('2021020102', '002', 'TI-1B'),
('2021020103', '002', 'TI-1C'),
('2021020104', '002', 'TI-1D'),
('2021020105', '002', 'TI-1E'),
('2021020106', '002', 'TI-1F'),
('2021020107', '002', 'TI-1G'),
('2021020108', '002', 'TI-1H'),
('2021020109', '002', 'TI-1I'),
('2021020201', '002', 'TI-2A'),
('2021020202', '002', 'TI-2B'),
('2021020203', '002', 'TI-2C'),
('2021020204', '002', 'TI-2D'),
('2021020205', '002', 'TI-2E'),
('2021020206', '002', 'TI-2F'),
('2021020207', '002', 'TI-2G'),
('2021020208', '002', 'TI-2H'),
('2021020209', '002', 'TI-2I'),
('2021020301', '002', 'TI-3A'),
('2021020302', '002', 'TI-3B'),
('2021020303', '002', 'TI-3C'),
('2021020304', '002', 'TI-3D'),
('2021020305', '002', 'TI-3E'),
('2021020306', '002', 'TI-3F'),
('2021020307', '002', 'TI-3G'),
('2021020308', '002', 'TI-3H'),
('2021020401', '002', 'TI-4A'),
('2021020402', '002', 'TI-4B'),
('2021020403', '002', 'TI-4C'),
('2021020404', '002', 'TI-4D'),
('2021020405', '002', 'TI-4E'),
('2021020406', '002', 'TI-4F'),
('2021020407', '002', 'TI-4G');


INSERT INTO mk (kode_mk, nama_mk) VALUES
('02001', 'Agama'),
('02002', 'Alajabar Linier'),
('02003', 'Algoritma dan Struktur Data'),
('02004', 'Aljabar Linier'),
('02005', 'Analisis Dan Desan Berorientasi Objek'),
('02006', 'Bahasa Indonesia'),
('02007', 'Bahasa Inggris'),
('02008', 'Bahasa Inggris 2'),
('02009', 'Bahasa Inggris Persiapan Kerja'),
('02010', 'Basis Data'),
('02011', 'Desain Pemrograman Web'),
('02012', 'Digital Entrepreneurship'),
('02013', 'E-Business'),
('02014', 'Etika Profesi Bidang TI'),
('02015', 'Internet Of Things'),
('02016', 'Kewarganegaraan'),
('02017', 'Komputasi Multimedia'),
('02018', 'Machine Learning'),
('02019', 'Manajemen Jaringan Komputer'),
('02020', 'Manajemen Proyek'),
('02021', 'Manajemen Proyek '),
('02022', 'Pemrograman Berbasis Framework'),
('02023', 'Pemrograman Mobile'),
('02024', 'Pemrograman Multimedia'),
('02025', 'Pemrograman Web Lanjut'),
('02026', 'Pengembangan Perangkat Lunak Berbasis Object'),
('02027', 'Pengolahan Citra dan Visi Komputer'),
('02028', 'Penulisan Ilmiah'),
('02029', 'Praktikum Algoritma dan Struktur Data'),
('02030', 'Praktikum Basis Data'),
('02031', 'Praktikum Struktur Data'),
('02032', 'Proyek 1_P1'),
('02033', 'Proyek 1_P2'),
('02034', 'Proyek 2_P2'),
('02035', 'Rekayasa Perangkat Lunak'),
('02036', 'Sistem Informasi'),
('02037', 'Sistem Manajemen Basis Data'),
('02038', 'Sistem Operasi'),
('02039', 'Sistem Pendukung Keputusan'),
('02040', 'Struktur Data'),
('02041', 'Teknologi Data');

--
-- Dumping data untuk tabel ruang
--

INSERT INTO ruang (kode_ruang, nama_ruang, deskripsi_ruang) VALUES
('0501', 'RT01', 'Ruang Teori 1'),
('0502', 'RT02', 'Ruang Teori 2'),
('0503', 'RT03', 'Ruang Teori 3'),
('0504', 'RT04', 'Ruang Teori 4'),
('0505', 'RT05', 'Ruang Teori 5'),
('0506', 'RT06', 'Ruang Teori 6'),
('0507', 'RT07', 'Ruang Teori 7'),
('0508', 'LPY1', 'Laboratorium Proyek 1'),
('0615', 'LSI1', 'Laboratorium Sistem Informasi 1'),
('0617', 'LSI2', 'Laboratorium Sistem Informasi 2'),
('0618', 'LSI3', 'Laboratorium Sistem Informasi 3'),
('0619', 'LPY2', 'Laboratorium Proyek 2'),
('0620', 'LPY3', 'Laboratorium Proyek 3'),
('0701', 'LPR1', 'Laboratorium Pemrograman 1'),
('0702', 'LPR2', 'Laboratorium Pemrograman 2'),
('0703', 'LPR3', 'Laboratorium Pemrograman 3'),
('0704', 'LPR4', 'Laboratorium Pemrograman 4'),
('0705', 'LPR5', 'Laboratorium Pemrograman 5'),
('0706', 'LPR6', 'Laboratorium Pemrograman 6'),
('0707', 'LKJ1', 'Laboratorium Keamanan Jaringan 1'),
('0708', 'LPR7', 'Laboratorium Pemrograman 7'),
('0713', 'LKJ2', 'Laboratorium Keamanan Jaringan 2'),
('0714', 'LPR8', 'Laboratorium Pemrograman 8'),
('0715', 'LKJ3', 'Laboratorium Keamanan Jaringan 3'),
('0716', 'LIG1', 'Laboratorium Visi Komputer 1'),
('0717', 'RT08', 'Ruang Teori 8'),
('0718', 'LIG2', 'Laboratorium Visi Komputer 2'),
('0719', 'LPY4', 'Laboratorium Proyek 4'),
('0720', 'LAI1', 'Laboratorium Kecerdasan Buatan 1'),
('0801', 'L DTS', 'Laboratorium DTS'),
('0805', 'RT09', 'Ruang Teori 9'),
('0806', 'RT10', 'Ruang Teori 10'),
('1001', 'RT11', 'Ruang Teori 11'),
('1002', 'ROL1', 'Ruang Online 1'),
('1003', 'ROL2', 'Ruang Online 2'),
('1004', 'ROL3', 'Ruang Online 3');

--
-- Dumping data untuk tabel jadwal
--

INSERT INTO jadwal (kode_jadwal, kode_kelas, kode_dosen, kode_mk, kode_ruang, kode_hari, jp_mulai, jp_selesai) VALUES
(1, '2021020101', 'D001', '02001', '0504', '001', 7, 9),
(2, '2021010103', 'D001', '02001', '0506', '002', 9, 11),
(3, '2024010105', 'D001', '02001', '0806', '003', 10, 12),
(4, '2021010102', 'D001', '02001', '0506', '004', 1, 3),
(5, '2021010106', 'D001', '02001', '0806', '004', 4, 6),
(6, '2021010101', 'D001', '02001', '0506', '004', 7, 9),
(7, '2021010104', 'D001', '02001', '0506', '005', 10, 12),
(8, '2021010206', 'D002', '02037', '0702', '001', 7, 12),
(9, '2021020202', 'D002', '02036', '0708', '003', 2, 4),
(10, '2021010205', 'D002', '02037', '0713', '004', 1, 6),
(11, '2021020209', 'D002', '02025', '0719', '004', 7, 12),
(12, '2021020301', 'D003', '02012', '0508', '002', 1, 4),
(13, '2021020302', 'D003', '02012', '0508', '002', 1, 4),
(14, '2021010201', 'D003', '02017', '0719', '003', 2, 5),
(15, '2021010202', 'D003', '02017', '0719', '003', 2, 5),
(16, '2021010203', 'D003', '02017', '0507', '005', 2, 5),
(17, '2021010106', 'D004', '02028', '0704', '001', 1, 3),
(18, '2021020203', 'D004', '02032', '0507', '001', 10, 12),
(19, '2021010201', 'D004', '02034', '0617', '002', 7, 12),
(20, '2021020203', 'D004', '02032', '0708', '004', 1, 6),
(21, '2021020104', 'D005', '02016', '0717', '001', 1, 3),
(22, '2021020108', 'D005', '02016', '0504', '001', 4, 6),
(23, '2021020106', 'D005', '02016', '0805', '001', 10, 12),
(24, '2021020105', 'D005', '02016', '0502', '002', 1, 3),
(25, '2021020102', 'D005', '02016', '0806', '002', 4, 6),
(26, '2021020103', 'D005', '02016', '0502', '003', 4, 6),
(27, '2021020107', 'D005', '02016', '0806', '004', 1, 3),
(28, '2021020109', 'D005', '02016', '0502', '005', 1, 3),
(29, '2024010105', 'D006', '02010', '0701', '002', 1, 3),
(30, '2024010105', 'D006', '02030', '0618', '004', 1, 6),
(31, '2021010203', 'D006', '02037', '0705', '004', 7, 12),
(32, '2021010204', 'D006', '02037', '0619', '005', 7, 12),
(33, '2021010103', 'D007', '02011', '0705', '002', 2, 6),
(34, '2021020101', 'D007', '02038', '0503', '003', 3, 5),
(35, '2021020102', 'D007', '02038', '0503', '003', 3, 5),
(36, '2021010102', 'D007', '02011', '0615', '004', 8, 12),
(37, '2021010101', 'D007', '02011', '0703', '005', 2, 6),
(38, '2021010306', 'D008', '02012', '0619', '001', 2, 5),
(39, '2021020203', 'D008', '02036', '0716', '003', 2, 4),
(40, '2021020104', 'D008', '02038', '0505', '004', 4, 6),
(41, '2021020105', 'D008', '02038', '0505', '004', 4, 6),
(42, '2021010304', 'D008', '02012', '0507', '005', 9, 12),
(43, '2021010305', 'D008', '02012', '0507', '005', 9, 12),
(44, '2021020103', 'D009', '02035', '0505', '002', 7, 10),
(45, '2021020104', 'D009', '02035', '0505', '002', 7, 10),
(46, '2021020204', 'D009', '02005', '0704', '003', 7, 12),
(47, '2021020203', 'D009', '02005', '0705', '005', 1, 6),
(48, '2021010103', 'D010', '02026', '0806', '001', 3, 4),
(49, '2021010202', 'D010', '02023', '0704', '001', 8, 11),
(50, '2021010202', 'D010', '02023', '0713', '002', 7, 10),
(51, '2021010201', 'D010', '02023', '0705', '003', 7, 10),
(52, '2021010201', 'D010', '02023', '0716', '005', 8, 11),
(53, '2021010201', 'D011', '02019', '0718', '002', 1, 5),
(54, '2021010203', 'D011', '02019', '0706', '004', 1, 5),
(55, '2021010204', 'D011', '02019', '0716', '004', 8, 12),
(56, '2021010202', 'D011', '02019', '0706', '005', 1, 5),
(57, '2021020204', 'D012', '02018', '0702', '001', 1, 5),
(58, '2021020203', 'D012', '02018', '0619', '002', 1, 5),
(59, '2021010204', 'D012', '02020', '0704', '002', 9, 11),
(60, '2021010302', 'D013', '02008', '0805', '002', 4, 6),
(61, '2021020109', 'D013', '02007', '0805', '002', 7, 9),
(62, '2021010301', 'D013', '02009', '0717', '003', 4, 6),
(63, '2021020101', 'D013', '02008', '0717', '003', 7, 9),
(64, '2021020401', 'D013', '02009', '0717', '004', 4, 6),
(65, '2021020107', 'D013', '02008', '0717', '005', 2, 4),
(66, '2021020102', 'D013', '02008', '0506', '005', 7, 9),
(67, '2021020301', 'D014', '02017', '0720', '004', 1, 4),
(68, '2021020302', 'D014', '02017', '0720', '004', 1, 4),
(69, '2021020303', 'D014', '02017', '0714', '005', 2, 5),
(70, '2021020308', 'D014', '02017', '0714', '005', 7, 10),
(71, '2021020206', 'D015', '02032', '0720', '002', 3, 5),
(72, '2021020206', 'D015', '02005', '0619', '002', 7, 12),
(73, '2021020205', 'D015', '02005', '0713', '003', 7, 12),
(74, '2021020206', 'D015', '02033', '0701', '004', 7, 12),
(75, '2021020103', 'D016', '02038', '0506', '001', 1, 3),
(76, '2021020204', 'D016', '02032', '0615', '001', 7, 9),
(77, '2021010103', 'D016', '02038', '0501', '004', 4, 6),
(78, '2021010104', 'D016', '02038', '0501', '004', 4, 6),
(79, '2021020204', 'D016', '02033', '0719', '005', 7, 12),
(80, '2021020106', 'D017', '02004', '0805', '004', 3, 6),
(81, '2021020302', 'D017', '02027', '0702', '004', 7, 12),
(82, '2021020301', 'D017', '02027', '0704', '005', 1, 6),
(83, '2021020109', 'D017', '02002', '0717', '005', 7, 10),
(84, '2021020302', 'D018', '02039', '0701', '001', 1, 6),
(85, '2021010203', 'D018', '02013', '0501', '001', 10, 12),
(86, '2021010204', 'D018', '02013', '0501', '001', 10, 12),
(87, '2021020301', 'D019', '02022', '0620', '001', 7, 12),
(88, '2021020302', 'D019', '02022', '0702', '005', 1, 6),
(89, '2021020108', 'D020', '02004', '0502', '004', 9, 12),
(90, '2021020107', 'D020', '02004', '0502', '005', 7, 10),
(91, '2021020207', 'D021', '02005', '0615', '001', 1, 6),
(92, '2021020207', 'D021', '02032', '0707', '002', 1, 3),
(93, '2021020207', 'D021', '02033', '0718', '003', 1, 6),
(94, '2021010303', 'D021', '02012', '0703', '003', 8, 11),
(95, '2021010204', 'D022', '02033', '0704', '003', 1, 6),
(96, '2021010205', 'D022', '02033', '0706', '003', 7, 12),
(97, '2021020306', 'D022', '02012', '0504', '005', 1, 4),
(98, '2021010205', 'D023', '02023', '0508', '001', 1, 4),
(99, '2021020206', 'D023', '02025', '0706', '003', 1, 6),
(100, '2021010206', 'D023', '02023', '0618', '003', 8, 11),
(101, '2021010205', 'D023', '02023', '0701', '005', 1, 4),
(102, '2021010206', 'D023', '02023', '0705', '005', 7, 10),
(103, '2021010201', 'D024', '02037', '0713', '001', 1, 6),
(104, '2021010103', 'D024', '02010', '0615', '001', 10, 12),
(105, '2021010103', 'D024', '02010', '0619', '003', 1, 6),
(106, '2021010202', 'D024', '02037', '0701', '005', 7, 12),
(107, '2021020305', 'D025', '02024', '0615', '001', 1, 6),
(108, '2021020306', 'D025', '02022', '0713', '002', 1, 6),
(109, '2021020304', 'D025', '02017', '0620', '005', 1, 4),
(110, '2021020305', 'D025', '02017', '0620', '005', 1, 4),
(111, '2021020305', 'D026', '02015', '0508', '003', 7, 12),
(112, '2021020306', 'D026', '02041', '0701', '004', 1, 6),
(113, '2021020103', 'D027', '02010', '0501', '002', 4, 6),
(114, '2021020104', 'D027', '02010', '0501', '002', 4, 6),
(115, '2021010106', 'D027', '02035', '0707', '003', 1, 4),
(116, '2021020103', 'D027', '02010', '0615', '004', 7, 12),
(117, '2021020104', 'D027', '02010', '0617', '005', 1, 6),
(118, '2021010104', 'D028', '02026', '0504', '002', 1, 4),
(119, '2021020107', 'D028', '02035', '0503', '002', 8, 11),
(120, '2021020108', 'D028', '02035', '0503', '002', 8, 11),
(121, '2024010105', 'D028', '02026', '0505', '003', 3, 6),
(122, '2021010106', 'D028', '02026', '0505', '003', 3, 6),
(123, '2021020209', 'D029', '02032', '0503', '001', 7, 9),
(124, '2021020204', 'D029', '02036', '0703', '003', 1, 3),
(125, '2021020205', 'D029', '02036', '0703', '003', 1, 3),
(126, '2021020209', 'D029', '02033', '0508', '004', 1, 6),
(127, '2021020206', 'D029', '02036', '0501', '005', 1, 3),
(128, '2021020207', 'D029', '02036', '0501', '005', 1, 3),
(129, '2021020109', 'D030', '02010', '0716', '001', 4, 6),
(130, '2021020108', 'D030', '02010', '0715', '002', 2, 4),
(131, '2021020201', 'D030', '02036', '0502', '003', 1, 3),
(132, '2021020109', 'D030', '02030', '0620', '004', 1, 6),
(133, '2021020108', 'D030', '02030', '0615', '005', 1, 6),
(134, '2021020202', 'D031', '02032', '0507', '001', 7, 9),
(135, '2021010203', 'D031', '02020', '0718', '002', 7, 9),
(136, '2021010201', 'D031', '02020', '0501', '004', 7, 9),
(137, '2021010202', 'D031', '02020', '0501', '004', 7, 9),
(138, '2021020202', 'D031', '02033', '0707', '005', 7, 12),
(139, '2021020104', 'D032', '02008', '0806', '001', 7, 9),
(140, '2021020103', 'D032', '02008', '0717', '002', 1, 3),
(141, '2021020403', 'D032', '02009', '0502', '002', 10, 12),
(142, '2021010304', 'D032', '02009', '0506', '003', 4, 6),
(143, '2021020402', 'D032', '02009', '0504', '004', 4, 6),
(144, '2021020105', 'D032', '02009', '0717', '004', 8, 10),
(145, '2021010303', 'D032', '02009', '0806', '005', 7, 9),
(146, '2021020203', 'D033', '02037', '0716', '003', 7, 12),
(147, '2021020108', 'D034', '02008', '0502', '001', 1, 3),
(148, '2021020106', 'D034', '02008', '0502', '002', 7, 9),
(149, '2021010305', 'D034', '02009', '0805', '003', 4, 6),
(150, '2021010306', 'D034', '02009', '0506', '004', 4, 6),
(151, '2021020208', 'D035', '02018', '0618', '002', 2, 6),
(152, '2021020307', 'D035', '02041', '0716', '002', 7, 12),
(153, '2021020308', 'D035', '02041', '0716', '005', 1, 6),
(154, '2021020207', 'D035', '02018', '0615', '005', 8, 12),
(155, '2021020209', 'D036', '02036', '0704', '001', 4, 6),
(156, '2021020304', 'D036', '02022', '0508', '001', 7, 12),
(157, '2021020303', 'D036', '02022', '0704', '002', 1, 6),
(158, '2021020202', 'D036', '02025', '0706', '002', 7, 12),
(159, '2021010102', 'D037', '02016', '0506', '001', 7, 9),
(160, '2021010107', 'D037', '02016', '0806', '002', 7, 9),
(161, '2021010104', 'D037', '02016', '0504', '002', 10, 12),
(162, '2021020101', 'D037', '02016', '0717', '003', 10, 12),
(163, '2021010106', 'D037', '02016', '0717', '004', 1, 3),
(164, '2021010103', 'D037', '02016', '0504', '005', 7, 9),
(165, '2021010101', 'D037', '02016', '0806', '005', 10, 12),
(166, '2021020307', 'D038', '02012', '0714', '002', 2, 5),
(167, '2021020209', 'D038', '02020', '0620', '003', 10, 12),
(168, '2021010301', 'D038', '02012', '0503', '005', 1, 4),
(169, '2021010302', 'D038', '02012', '0503', '005', 1, 4),
(170, '2021010101', 'D039', '02040', '0503', '001', 1, 3),
(171, '2021010102', 'D039', '02040', '0503', '001', 1, 3),
(172, '2021020209', 'D039', '02037', '0703', '002', 1, 6),
(173, '2021010102', 'D039', '02040', '0617', '003', 8, 12),
(174, '2021010101', 'D039', '02040', '0617', '004', 2, 6),
(175, '2021020109', 'D040', '02003', '0713', '001', 9, 11),
(176, '2021010202', 'D040', '02033', '0619', '003', 7, 12),
(177, '2021020109', 'D040', '02003', '0718', '004', 7, 12),
(178, '2021010101', 'D041', '02038', '0507', '001', 4, 6),
(179, '2021010102', 'D041', '02038', '0507', '001', 4, 6),
(180, '2021010101', 'D041', '02028', '0501', '002', 1, 3),
(181, '2021010102', 'D041', '02028', '0501', '002', 1, 3),
(182, '2021020205', 'D042', '02037', '0703', '001', 7, 12),
(183, '2021020204', 'D042', '02037', '0715', '004', 7, 12),
(184, '2021020101', 'D042', '02035', '0505', '005', 2, 5),
(185, '2021020102', 'D042', '02035', '0505', '005', 2, 5),
(186, '2021010204', 'D043', '02017', '0705', '001', 2, 5),
(187, '2021010205', 'D043', '02017', '0505', '002', 2, 5),
(188, '2021010204', 'D043', '02017', '0505', '002', 2, 5),
(189, '2021020208', 'D043', '02036', '0507', '004', 7, 9),
(190, '2021020205', 'D043', '02025', '0720', '005', 1, 6),
(191, '2021020201', 'D044', '02032', '0706', '001', 3, 5),
(192, '2021010205', 'D044', '02021', '0618', '001', 10, 12),
(193, '2021010206', 'D044', '02021', '0618', '001', 10, 12),
(194, '2021020206', 'D044', '02020', '0707', '004', 3, 5),
(195, '2021020207', 'D044', '02020', '0707', '004', 3, 5),
(196, '2021020201', 'D044', '02033', '0713', '004', 7, 12),
(197, '2021020208', 'D045', '02037', '0718', '001', 1, 6),
(198, '2021020107', 'D045', '02010', '0702', '001', 9, 11),
(199, '2021020107', 'D045', '02030', '0615', '003', 1, 6),
(200, '2021020207', 'D045', '02037', '0619', '004', 7, 12),
(201, '2021020103', 'D046', '02003', '0501', '001', 4, 6),
(202, '2021020101', 'D046', '02010', '0617', '002', 3, 5),
(203, '2021020101', 'D046', '02030', '0704', '004', 1, 6),
(204, '2021020209', 'D046', '02018', '0707', '005', 1, 5),
(205, '2021020103', 'D046', '02003', '0702', '005', 7, 12),
(206, '2021020308', 'D047', '02022', '0620', '001', 1, 6),
(207, '2021020203', 'D047', '02020', '0805', '001', 7, 9),
(208, '2021020201', 'D047', '02020', '0620', '002', 1, 3),
(209, '2021020202', 'D047', '02020', '0620', '002', 1, 3),
(210, '2021020307', 'D047', '02022', '0715', '003', 1, 6),
(211, '2021020305', 'D048', '02027', '0716', '002', 1, 6),
(212, '2021020201', 'D048', '02025', '0503', '004', 1, 6),
(213, '2021020208', 'D048', '02025', '0713', '005', 1, 6),
(214, '2021020306', 'D048', '02027', '0620', '005', 7, 12),
(215, '2021010106', 'D049', '02010', '0716', '001', 7, 9),
(216, '2021020204', 'D049', '02025', '0719', '002', 1, 6),
(217, '2021020203', 'D049', '02025', '0703', '002', 7, 12),
(218, '2021010106', 'D049', '02030', '0706', '004', 7, 12),
(219, '2021020106', 'D050', '02001', '0717', '001', 4, 6),
(220, '2021020103', 'D050', '02001', '0506', '001', 7, 9),
(221, '2021020105', 'D050', '02001', '0504', '001', 10, 12),
(222, '2021020109', 'D050', '02001', '0805', '003', 1, 3),
(223, '2021020102', 'D050', '02001', '0504', '003', 8, 10),
(224, '2021020104', 'D050', '02001', '0805', '004', 7, 9),
(225, '2021020107', 'D050', '02001', '0805', '004', 10, 12),
(226, '2021020108', 'D050', '02001', '0805', '005', 7, 9),
(227, '2021020206', 'D051', '02037', '0715', '001', 1, 6),
(228, '2021020208', 'D051', '02020', '0508', '003', 2, 4),
(229, '2021020306', 'D051', '02039', '0701', '003', 7, 12),
(230, '2021020305', 'D051', '02039', '0619', '004', 1, 6),
(231, '2021010104', 'D052', '02010', '0701', '001', 4, 6),
(232, '2021020201', 'D052', '02005', '0708', '002', 7, 12),
(233, '2021020202', 'D052', '02005', '0720', '003', 7, 12),
(234, '2021010104', 'D052', '02030', '0618', '005', 1, 6),
(235, '2021020105', 'D053', '02010', '0708', '001', 7, 9),
(236, '2021020105', 'D053', '02030', '0704', '005', 7, 12),
(237, '2021020101', 'D054', '02003', '0703', '001', 2, 4),
(238, '2021020102', 'D054', '02003', '0703', '001', 2, 4),
(239, '2021010205', 'D054', '02013', '0501', '001', 7, 9),
(240, '2021020102', 'D054', '02029', '0620', '002', 7, 12),
(241, '2021020101', 'D054', '02029', '0720', '004', 7, 12),
(242, '2021020106', 'D055', '02003', '0716', '001', 1, 3),
(243, '2021020304', 'D055', '02027', '0718', '004', 1, 6),
(244, '2021020106', 'D055', '02029', '0618', '004', 7, 12),
(245, '2021020303', 'D055', '02027', '0718', '005', 7, 12),
(246, '2021020107', 'D056', '02003', '0708', '001', 4, 6),
(247, '2021020303', 'D056', '02015', '0715', '001', 7, 12),
(248, '2021020304', 'D056', '02015', '0713', '003', 1, 6),
(249, '2021020107', 'D056', '02029', '0702', '003', 7, 12),
(250, '2021020201', 'D057', '02037', '0720', '001', 7, 12),
(251, '2021020305', 'D057', '02041', '0618', '005', 7, 12),
(252, '2021020208', 'D058', '02032', '0502', '001', 10, 12),
(253, '2021020303', 'D058', '02041', '0720', '003', 1, 6),
(254, '2021020208', 'D058', '02033', '0716', '004', 1, 6),
(255, '2021020304', 'D058', '02041', '0615', '005', 7, 12),
(256, '2021010203', 'D059', '02023', '0719', '001', 1, 4),
(257, '2021010204', 'D059', '02023', '0702', '002', 2, 5),
(258, '2021020207', 'D059', '02025', '0701', '002', 7, 12),
(259, '2021010204', 'D059', '02023', '0718', '005', 2, 5),
(260, '2021010203', 'D059', '02023', '0715', '005', 8, 11),
(261, '2021020308', 'D060', '02039', '0619', '001', 7, 12),
(262, '2021020201', 'D060', '02018', '0615', '003', 7, 11),
(263, '2021020202', 'D060', '02018', '0708', '005', 1, 5),
(264, '2021020307', 'D060', '02039', '0708', '005', 7, 12),
(265, '2021020101', 'D061', '02004', '0717', '002', 9, 12),
(266, '2021020104', 'D061', '02004', '0504', '003', 3, 6),
(267, '2021020105', 'D061', '02004', '0805', '003', 7, 10),
(268, '2021020102', 'D061', '02004', '0806', '004', 8, 11),
(269, '2021020103', 'D061', '02004', '0806', '005', 2, 5),
(270, '2021010106', 'D062', '02011', '0615', '002', 7, 11),
(271, '2021010104', 'D062', '02011', '0703', '004', 8, 12),
(272, '2024010105', 'D062', '02011', '0715', '005', 1, 5),
(273, '2024010105', 'D062', '02038', '0501', '005', 10, 12),
(274, '2021010106', 'D062', '02038', '0501', '005', 10, 12),
(275, '2021020209', 'D063', '02005', '0719', '002', 7, 12),
(276, '2021010101', 'D063', '02026', '0507', '003', 1, 4),
(277, '2021010102', 'D063', '02026', '0507', '003', 1, 4),
(278, '2021020208', 'D063', '02005', '0708', '003', 7, 12),
(279, '2021010301', 'D064', '02006', '0805', '001', 1, 3),
(280, '2021010303', 'D064', '02006', '0506', '001', 4, 6),
(281, '2021010302', 'D064', '02006', '0805', '002', 1, 3),
(282, '2021010305', 'D064', '02006', '0506', '003', 1, 3),
(283, '2021010306', 'D064', '02006', '0504', '004', 1, 3),
(284, '2021010304', 'D064', '02006', '0805', '005', 2, 4),
(285, '2021020102', 'D065', '02010', '0708', '002', 1, 3),
(286, '2021020102', 'D065', '02030', '0615', '004', 1, 6),
(287, '2021010206', 'D066', '02013', '0503', '001', 4, 6),
(288, '2021020104', 'D067', '02003', '0805', '001', 4, 6),
(289, '2021020105', 'D067', '02003', '0805', '001', 4, 6),
(290, '2021020105', 'D067', '02029', '0705', '003', 1, 6),
(291, '2021010201', 'D067', '02013', '0506', '004', 10, 12),
(292, '2021020104', 'D067', '02029', '0703', '005', 7, 12),
(293, '2021020308', 'D068', '02027', '0714', '002', 7, 12),
(294, '2021020307', 'D068', '02027', '0703', '004', 1, 6),
(295, '2021020303', 'D069', '02039', '0618', '002', 7, 12),
(296, '2021010206', 'D069', '02033', '0702', '004', 1, 6),
(297, '2021020406', 'D070', '02009', '0502', '001', 4, 6),
(298, '2021020405', 'D070', '02009', '0806', '001', 10, 12),
(299, '2021020404', 'D070', '02009', '0717', '002', 4, 6),
(300, '2021020407', 'D070', '02009', '0806', '003', 4, 6),
(301, '2021020306', 'D071', '02017', '0505', '001', 1, 4),
(302, '2021020307', 'D071', '02017', '0505', '001', 1, 4),
(303, '2021020108', 'D071', '02003', '0714', '001', 7, 9),
(304, '2021020308', 'D071', '02017', '0501', '003', 1, 4),
(305, '2021020108', 'D071', '02029', '0719', '004', 1, 6),
(306, '2021010303', 'D072', '02014', '0720', '001', 1, 3),
(307, '2021010304', 'D072', '02014', '0720', '001', 1, 3),
(308, '2021010305', 'D072', '02014', '0714', '001', 10, 12),
(309, '2021010306', 'D072', '02014', '0714', '001', 10, 12),
(310, '2021010301', 'D072', '02014', '0501', '005', 7, 9),
(311, '2021010302', 'D072', '02014', '0501', '005', 7, 9),
(312, '2021020305', 'D073', '02012', '0714', '003', 1, 4),
(313, '2021020106', 'D074', '02038', '0507', '002', 3, 5),
(314, '2021020107', 'D074', '02038', '0507', '002', 3, 5),
(315, '2021020109', 'D074', '02038', '0805', '002', 10, 12),
(316, '2021020108', 'D074', '02038', '0806', '003', 7, 9),
(317, '2021010206', 'D074', '02019', '0719', '005', 1, 5),
(318, '2021010205', 'D074', '02019', '0713', '005', 7, 11),
(319, '2024010105', 'D075', '02028', '0501', '001', 1, 3),
(320, '2021020304', 'D075', '02039', '0706', '002', 1, 6),
(321, '2021020301', 'D075', '02039', '0618', '003', 1, 6),
(322, '2021010103', 'D075', '02028', '0503', '003', 8, 10),
(323, '2021010104', 'D075', '02028', '0503', '003', 8, 10),
(324, '2021020303', 'D076', '02012', '0618', '001', 1, 4),
(325, '2021020304', 'D076', '02012', '0618', '001', 1, 4),
(326, '2021020307', 'D076', '02015', '0701', '001', 7, 12),
(327, '2021020308', 'D076', '02015', '0718', '003', 7, 12),
(328, '2021020306', 'D077', '02015', '0705', '001', 7, 12),
(329, '2021020202', 'D077', '02037', '0715', '004', 1, 6),
(330, '2021020205', 'D078', '02018', '0615', '002', 1, 5),
(331, '2021020301', 'D078', '02015', '0715', '002', 7, 12),
(332, '2021020302', 'D078', '02015', '0617', '003', 1, 6),
(333, '2021020206', 'D078', '02018', '0706', '005', 8, 12),
(334, '2024010105', 'D079', '02040', '0503', '002', 4, 6),
(335, '2021010106', 'D079', '02040', '0503', '002', 4, 6),
(336, '2024010105', 'D079', '02031', '0705', '002', 8, 12),
(337, '2021010106', 'D079', '02031', '0715', '003', 8, 12),
(338, '2021020105', 'D079', '02035', '0506', '005', 2, 5),
(339, '2021010103', 'D080', '02040', '0505', '001', 7, 9),
(340, '2021010104', 'D080', '02040', '0505', '001', 7, 9),
(341, '2021020109', 'D080', '02035', '0506', '002', 1, 4),
(342, '2021010104', 'D080', '02031', '0701', '003', 2, 6),
(343, '2021010103', 'D080', '02031', '0508', '004', 8, 12),
(344, '2021020405', 'D081', '02014', '0507', '001', 1, 3),
(345, '2021020406', 'D081', '02014', '0507', '001', 1, 3),
(346, '2021020403', 'D081', '02014', '0503', '002', 1, 3),
(347, '2021020404', 'D081', '02014', '0503', '002', 1, 3),
(348, '2021020407', 'D081', '02014', '0506', '003', 8, 10),
(349, '2021020401', 'D081', '02014', '0501', '004', 1, 3),
(350, '2021020402', 'D081', '02014', '0501', '004', 1, 3),
(351, '2021010202', 'D082', '02013', '0806', '002', 1, 3),
(352, '2021010101', 'D082', '02010', '0707', '002', 4, 6),
(353, '2021010102', 'D082', '02010', '0707', '002', 4, 6),
(354, '2021010101', 'D082', '02030', '0720', '002', 7, 12),
(355, '2021010102', 'D082', '02030', '0508', '005', 1, 6),
(356, '2021020106', 'D083', '02010', '0617', '001', 7, 9),
(357, '2021020302', 'D083', '02041', '0508', '002', 7, 12),
(358, '2021020106', 'D083', '02030', '0719', '003', 7, 12),
(359, '2021020301', 'D083', '02041', '0708', '004', 7, 12),
(360, '2021020205', 'D084', '02032', '0708', '001', 1, 3),
(361, '2021010203', 'D084', '02033', '0620', '003', 1, 6),
(362, '2021020204', 'D084', '02020', '0505', '004', 1, 3),
(363, '2021020205', 'D084', '02020', '0505', '004', 1, 3),
(364, '2021020205', 'D084', '02033', '0620', '004', 7, 12),
(365, '2021010202', 'D085', '02006', '0504', '001', 1, 3),
(366, '2021010204', 'D085', '02006', '0502', '001', 7, 9),
(367, '2021010205', 'D085', '02006', '0504', '002', 7, 9),
(368, '2021010203', 'D085', '02006', '0806', '002', 10, 12),
(369, '2021010206', 'D085', '02006', '0806', '003', 1, 3),
(370, '2021010201', 'D085', '02006', '0502', '004', 2, 4);

UPDATE jadwal SET kode_dosen = 'D010';

UPDATE jadwal
    SET kode_dosen = 'D022'
    WHERE kode_mk = '02010';

UPDATE jadwal
    SET kode_dosen = NULL
    WHERE kode_dosen = 'D010';

UPDATE jadwal
    SET kode_dosen = 'D012',
    kode_ruang = '0702'
    WHERE kode_kelas = '2021020204';

UPDATE jadwal
    SET kode_dosen = (SELECT kode_dosen FROM dosen
    WHERE nama_dosen = 'Dika Rizky Yunianto S.Kom., M.Kom.')
    WHERE kode_mk = '02010';

DELETE FROM jadwal WHERE kode_dosen IS NOT NULL;

/* TUGAS */

UPDATE mk
    SET nama_mk = 'Basis Data Dasar'
    WHERE nama_mk = 'Basis Data';

select * from hari;

UPDATE jadwal
    SET kode_hari = '001',
    jp_mulai = 5,
    jp_selesai = 10
    WHERE kode_mk = '02010';

select * from jadwal WHERE kode_mk = '02010';

DELETE FROM jadwal WHERE kode_mk = '02016';

select * from jadwal  WHERE kode_mk = '02016';

INSERT INTO mk 
VALUES
    ('02042', 'Pancasila'),
    ('02043', 'Belanegara'),
    ('02044', 'Wawasan Nusantara');

select * from mk;

DELETE FROM mk_backup;

SELECT * FROM mk_backup;
SELECT * FROM dosen;

INSERT INTO mk_backup
    SELECT * FROM mk;

select * from mk_backup;

CREATE TABLE mahasiswa(
    NIM VARCHAR(10) NOT NULL,
    nama_mahasiswa VARCHAR(50) NOT NULL,
    kode_kelas VARCHAR(10) NOT NULL,
    PRIMARY KEY (NIM),
    FOREIGN KEY (kode_kelas) REFERENCES kelas(kode_kelas)
);

UPDATE kelas
    SET kode_kelas = '2024010105',
    nama_kelas = 'SIB-1E'
    WHERE kode_kelas = '2021010105';

ALTER Table kelas
    MODIFY nama_kelas VARCHAR(10) NOT NULL;

INSERT INTO mahasiswa
VALUES
('2341760123', 'Syaqira Nazaretna', '2024010105'),
('2341760184', 'Yonanda Mayla Rusdiaty', '2024010105'),
('2341760067', 'Afril Maulana Rizky', '2024010105'),
('2341760029', 'Aidatul Rosida', '2024010105'),
('2341760089', 'Alfin Afriansyah', '2024010105'),
('2341760032', 'Annisa', '2024010105'),
('2341760099', 'Aqil Rahmat Alfiandi', '2024010105'),
('2341760061', 'Athallah Ayudya Paramesti', '2024010105'),
('2341760073', 'Bayu Triwibowo', '2024010105'),
('2341760008', 'Claudya Destine Julia Handoko', '2024010105');

select * from mahasiswa;

UPDATE jadwal
SET kode_dosen = 'D033'
WHERE kode_mk = '02010' AND kode_kelas = '2024010105';
select * from jadwal WHERE kode_mk = '02010' AND kode_kelas = '2024010105';

DELETE FROM kelas;

SELECT * FROM dosen WHERE kode_dosen = 'D033';

use jadwal_perkuliahan;

