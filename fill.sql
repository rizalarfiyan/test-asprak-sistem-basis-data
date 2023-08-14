-- Fill the data
INSERT INTO kategori (kategori_id, nama_kategori)
VALUES ('K001', 'Novel'),
       ('K002', 'Komputer Umum'),
       ('K003', 'Jaringan Komputer');

INSERT INTO penerbitan (penerbitan_id, nama_penerbit)
VALUES ('P001', 'Gemilang'),
       ('P002', 'Cahaya offset'),
       ('P003', 'Terang Benerang');

INSERT INTO anggota (anggota_id, nama, jenis_kelamin, tanggal_lahir, telpon, alamat)
VALUES ('A001', 'Joko Pitono', 'L', '2000-04-21', '082256378265', 'Sleman'),
       ('A002', 'Gunadi', 'L', '2002-11-19', '081234667885', 'Jogja'),
       ('A003', 'Topik Nur Salim', 'L', '1999-09-30', '083678987445', 'Bantul'),
       ('A004', 'Puspita Dewi', 'P', '2000-02-07', '081678995243', 'Jogja'),
       ('A005', 'Trinita', 'P', '2001-06-01', '081445778998', 'Gunung Kidul');

INSERT INTO user (user_id, nama, username, password)
VALUES ('U001', 'Sella', 'Sela21', 'jfeU=jfej'),
       ('U002', 'Doni', 'Doni478', 'JiefkeijjI');

INSERT INTO buku (buku_id, judul, kategori_id, penerbitan_id, isbn, pengarang, tahun_terbit)
VALUES ('B001', 'Menggapai Mimpi', 'K001', 'P001', '100058', 'Joko Anwar', 2022),
       ('B002', 'Tips & Trik Komputer', 'K002', 'P002', '100107', 'Joni Sebastian', 2023),
       ('B003', 'Blockchain', 'K002', 'P003', '100677', 'Gerard', 2022),
       ('B004', 'Pengantar Komputer Informatika', 'K002', 'P001', '109887', 'Joko Anwar', 2020),
       ('B005', 'Security Computer', 'K003', 'P002', '207789', 'Albert', 2021);

INSERT INTO peminjaman (peminjaman_id, tanggal_pinjam, lama_pinjam, keterangan, status, anggota_id, user_id)
VALUES ('PJ001', '2022-06-01', NULL, NULL, 'sudah dikembalikan', 'A001', 'U001'),
       ('PJ002', '2022-06-28', 4, NULL, 'sudah dikembalikan', 'A003', 'U001'),
       ('PJ003', '2022-07-17', 10, NULL, 'sudah dikembalikan', 'A004', 'U001'),
       ('PJ004', '2022-08-08', NULL, NULL, 'dipinjam', 'A002', 'U002'),
       ('PJ005', '2022-09-27', 20, NULL, 'sudah dikembalikan', 'A001', 'U002'),
       ('PJ006', '2022-09-28', NULL, NULL, 'dipinjam', 'A005', 'U001');

INSERT INTO peminjaman_detail (peminjaman_detail_id, peminjaman_id, buku_id, jumlah)
VALUES ('PD001', 'PJ001', 'B001', 1),
       ('PD002', 'PJ002', 'B002', 1),
       ('PD003', 'PJ003', 'B001', 1),
       ('PD004', 'PJ004', 'B004', 1),
       ('PD005', 'PJ005', 'B001', 1),
       ('PD006', 'PJ005', 'B003', 1),
       ('PD007', 'PJ006', 'B004', 1),
       ('PD008', 'PJ006', 'B005', 1);

INSERT INTO pengembalian (pengembalian_id, peminjaman_id, tanggal_kembali, user_id)
VALUES ('PG001', 'PJ001', '2022-06-04', 'U002'),
       ('PG002', 'PJ002', '2022-07-02', 'U002'),
       ('PG003', 'PJ003', '2022-07-27', 'U001'),
       ('PG004', 'PJ005', '2022-10-17', 'U001');
