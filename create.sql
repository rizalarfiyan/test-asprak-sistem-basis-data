-- Create the database
drop database if exists test_asprak;
create database if not exists test_asprak;

CREATE TABLE buku (
  buku_id varchar(11) PRIMARY KEY,
  judul varchar(255),
  kategori_id varchar(11),
  penerbitan_id varchar(11),
  isbn varchar(50),
  pengarang varchar(150),
  tahun_terbit int(4)
);

CREATE TABLE kategori (
  kategori_id varchar(11) PRIMARY KEY,
  nama_kategori varchar(100)
);

CREATE TABLE penerbitan (
  penerbitan_id varchar(11) PRIMARY KEY,
  nama_penerbit varchar(100)
);

CREATE TABLE peminjaman_detail (
  peminjaman_detail_id varchar(11) PRIMARY KEY,
  peminjaman_id varchar(11),
  buku_id varchar(11),
  jumlah int(11)
);

CREATE TABLE peminjaman (
  peminjaman_id varchar(11) PRIMARY KEY,
  tanggal_pinjam date,
  lama_pinjam int(10),
  keterangan int(2),
  status enum('dipinjam','sudah dikembalikan'),
  anggota_id varchar(11),
  user_id varchar(11)
);

CREATE TABLE pengembalian (
  pengembalian_id varchar(11) PRIMARY KEY,
  peminjaman_id varchar(11),
  tanggal_kembali date,
  user_id varchar(11)
);

CREATE TABLE anggota (
  anggota_id varchar(11) PRIMARY KEY,
  nama varchar(100),
  jenis_kelamin enum('P','L'),
  tanggal_lahir date,
  telpon varchar(12),
  alamat text
);

CREATE TABLE user (
  user_id varchar(11) PRIMARY KEY,
  nama varchar(100),
  username varchar(100),
  password varchar(100)
);

ALTER TABLE buku ADD CONSTRAINT buku_ibfk_1 FOREIGN KEY (kategori_id) REFERENCES kategori (kategori_id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE buku ADD CONSTRAINT buku_ibfk_2 FOREIGN KEY (penerbitan_id) REFERENCES penerbitan (penerbitan_id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE peminjaman_detail ADD CONSTRAINT peminjaman_detail_ibfk_1 FOREIGN KEY (peminjaman_id) REFERENCES peminjaman (peminjaman_id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE peminjaman_detail ADD CONSTRAINT peminjaman_detail_ibfk_2 FOREIGN KEY (buku_id) REFERENCES buku (buku_id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE peminjaman ADD CONSTRAINT peminjaman_ibfk_1 FOREIGN KEY (anggota_id) REFERENCES anggota (anggota_id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE peminjaman ADD CONSTRAINT peminjaman_ibfk_2 FOREIGN KEY (user_id) REFERENCES user (user_id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE pengembalian ADD CONSTRAINT pengembalian_ibfk_1 FOREIGN KEY (peminjaman_id) REFERENCES peminjaman (peminjaman_id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE pengembalian ADD CONSTRAINT pengembalian_ibfk_2 FOREIGN KEY (user_id) REFERENCES user (user_id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE pengembalian ADD CONSTRAINT pengembalian_ibfk_3 FOREIGN KEY (peminjaman_id) REFERENCES peminjaman (peminjaman_id) ON DELETE CASCADE ON UPDATE CASCADE;
