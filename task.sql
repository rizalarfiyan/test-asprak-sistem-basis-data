-- 3.Apakah terdapat kesalahan pada soal diatas, kalau iya jelaskan kalau tidak dapat jawab tidak ada
-- Jawab: Ada kesalahan
-- 1. kolom jenis kelamin di tabel anggota harusnya enum('P','L') bukan enum('pria','wanita')
-- 2. kolom lama_pinjam di tabel peminjaman harusnya int(11) bukan date
-- 3. seluruh kolom id (primary/foreign key) harusnya varchar(11) bukan int(11)
-- 4. Format date harusnya YYYY-MM-DD bukan DD/MM/YYYY
-- 5. enum 'sudah dikembalikan' pada data harusnya lowercase menyesuaikan enum di dalam tabel peminjaman kolom status
-- 6. data '-' dapat di ubah ataupun di beri nilai null dalam database
-- dan beberapa masih ada lagi

-- 4.Tuliskan SQL untuk mengetahui siapa nama anggota yang belum melakukan pengembalian buku.
SELECT DISTINCT anggota.nama
FROM anggota
INNER JOIN peminjaman ON anggota.anggota_id = peminjaman.anggota_id
WHERE peminjaman.status = 'dipinjam';

-- 5.Tuliskan SQL untuk menampilkan alamat anggota dan jumlah setiap kabupaten.
SELECT alamat, COUNT(alamat) AS jumlah
FROM anggota
GROUP BY alamat;

-- 6.Tuliskan SQL untuk melihat usia/ umur tiap anggota saat ini
SELECT nama, YEAR(CURDATE()) - YEAR(tanggal_lahir) AS umur
FROM anggota;

-- 7.Tuliskan SQL untuk menampilkan data buku, data kategori dan data penerbit.
SELECT buku.judul, kategori.nama_kategori, penerbitan.nama_penerbit
FROM buku
INNER JOIN kategori ON buku.kategori_id = kategori.kategori_id
INNER JOIN penerbitan ON buku.penerbitan_id = penerbitan.penerbitan_id;

-- 8.Tuliskan SQL untuk menampilkan judul dan tanggal pinjam buku yang telah dipinjam oleh Gunadi.
SELECT buku.judul, peminjaman.tanggal_pinjam
FROM buku
INNER JOIN peminjaman_detail ON buku.buku_id = peminjaman_detail.buku_id
INNER JOIN peminjaman ON peminjaman_detail.peminjaman_id = peminjaman.peminjaman_id
INNER JOIN anggota ON peminjaman.anggota_id = anggota.anggota_id
WHERE anggota.nama = 'Gunadi';

-- 9.Tuliskan SQL untuk menampilkan nama anggota, alamat, tanggal pinjam dan tanggal kembali yang dinputkan oleh user Doni.
SELECT anggota.nama, anggota.alamat, peminjaman.tanggal_pinjam, pengembalian.tanggal_kembali
FROM anggota
INNER JOIN peminjaman ON anggota.anggota_id = peminjaman.anggota_id
INNER JOIN pengembalian ON peminjaman.peminjaman_id = pengembalian.peminjaman_id
INNER JOIN user ON peminjaman.user_id = user.user_id
WHERE user.nama = 'Doni';

-- 10.Tuliskan SQL untuk menampilkan data judul buku, kategori, penerbit, tanggal peminjaman, tanggal kembali dan nama anggota serta urutkan berdasarkan judul buku dari bersar ke kecil (Z - A).
SELECT buku.judul, kategori.nama_kategori, penerbitan.nama_penerbit, peminjaman.tanggal_pinjam, pengembalian.tanggal_kembali, anggota.nama
FROM buku
INNER JOIN kategori ON buku.kategori_id = kategori.kategori_id
INNER JOIN penerbitan ON buku.penerbitan_id = penerbitan.penerbitan_id
INNER JOIN peminjaman_detail ON buku.buku_id = peminjaman_detail.buku_id
INNER JOIN peminjaman ON peminjaman_detail.peminjaman_id = peminjaman.peminjaman_id
INNER JOIN pengembalian ON peminjaman.peminjaman_id = pengembalian.peminjaman_id
INNER JOIN anggota ON peminjaman.anggota_id = anggota.anggota_id
ORDER BY buku.judul DESC;

-- 11.Tuliskan SQL untuk menampilkan data judul buku, kategori, penerbit, tanggal peminjaman, tanggal kembali, nama anggota serta username admin yang melakukan transakasi pengembalian
SELECT buku.judul, kategori.nama_kategori, penerbitan.nama_penerbit, peminjaman.tanggal_pinjam, pengembalian.tanggal_kembali, anggota.nama, user.username
FROM buku
INNER JOIN kategori ON buku.kategori_id = kategori.kategori_id
INNER JOIN penerbitan ON buku.penerbitan_id = penerbitan.penerbitan_id
INNER JOIN peminjaman_detail ON buku.buku_id = peminjaman_detail.buku_id
INNER JOIN peminjaman ON peminjaman_detail.peminjaman_id = peminjaman.peminjaman_id
INNER JOIN pengembalian ON peminjaman.peminjaman_id = pengembalian.peminjaman_id
INNER JOIN anggota ON peminjaman.anggota_id = anggota.anggota_id
INNER JOIN user ON peminjaman.user_id = user.user_id
ORDER BY buku.judul DESC;

-- 12.Tuliskan SQL untuk menampilkan data judul buku, kategori, penerbit, tanggal peminjaman, lama pinjam dan nama anggota untuk data buku yang belum dikembalikan.
SELECT buku.judul, kategori.nama_kategori, penerbitan.nama_penerbit, peminjaman.tanggal_pinjam, DATEDIFF(CURDATE(), peminjaman.tanggal_pinjam) AS lama_pinjam, anggota.nama
FROM buku
INNER JOIN kategori ON buku.kategori_id = kategori.kategori_id
INNER JOIN penerbitan ON buku.penerbitan_id = penerbitan.penerbitan_id
INNER JOIN peminjaman_detail ON buku.buku_id = peminjaman_detail.buku_id
INNER JOIN peminjaman ON peminjaman_detail.peminjaman_id = peminjaman.peminjaman_id
INNER JOIN anggota ON peminjaman.anggota_id = anggota.anggota_id
WHERE peminjaman.status = 'dipinjam';

-- 13.Tuliskan SQL untuk merubah data anggota dengan nama Puspita Dewi menjadi Puspita Dewi Asih.
UPDATE anggota
SET nama = 'Puspita Dewi Asih'
WHERE nama = 'Puspita Dewi';

-- 14.Tuliskan SQL untuk merubah nama tabel user menjadi user_admin
ALTER TABLE user RENAME TO user_admin;

-- 15.Tuliskan SQL untuk merubah field dan tipe data pada tabel user_admin dengan detail seperti berikut:
-- a.User_id int(11) menjadi user_admin_id varchar(10)
-- b.Nama varchar(100) menjadi nama_admin varchar(50)
-- c.Username varchar(100) menjadi username_admin varchar(50)
-- d. Password varchar(100) menjadi password_admin varchar(50)
ALTER TABLE user_admin
DROP FOREIGN KEY peminjaman_ibfk_2,
DROP FOREIGN KEY pengembalian_ibfk_2,
CHANGE user_id user_admin_id VARCHAR(10),
CHANGE nama nama_admin VARCHAR(50),
CHANGE username username_admin VARCHAR(50),
CHANGE password password_admin VARCHAR(50);
ALTER TABLE peminjaman ADD CONSTRAINT peminjaman_ibfk_2 FOREIGN KEY (user_id) REFERENCES user_admin (user_admin_id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE pengembalian ADD CONSTRAINT pengembalian_ibfk_2 FOREIGN KEY (user_id) REFERENCES user_admin (user_admin_id) ON DELETE CASCADE ON UPDATE CASCADE;
