
<?php
$host = '127.0.0.1';
$db   = 'tokoku';
$user = 'root';
$pass = '';

try {
    $pdo = new PDO(
        "mysql:host=$host;dbname=$db;charset=utf8mb4",
        $user,
        $pass,
        [
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
            PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC
        ]
    );

    $keyword = 'Laptop';
    $kategori = 'Elektronik';
    $limit = 5;
    $offset = 0;

    $sql = "SELECT id, nama_produk, harga
            FROM produk
            WHERE nama_produk LIKE :keyword
              AND kategori = :kategori
            ORDER BY harga DESC, id ASC
            LIMIT :limit OFFSET :offset";

    $stmt = $pdo->prepare($sql);
    $stmt->bindValue(':keyword', '%' . $keyword . '%', PDO::PARAM_STR);
    $stmt->bindValue(':kategori', $kategori, PDO::PARAM_STR);
    $stmt->bindValue(':limit', $limit, PDO::PARAM_INT);
    $stmt->bindValue(':offset', $offset, PDO::PARAM_INT);
    $stmt->execute();

    $hasil = $stmt->fetchAll();

} catch (PDOException $e) {
    die('Koneksi atau query gagal: ' . htmlspecialchars($e->getMessage()));
}
?>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <title>Hasil Praktikum Nomor 19</title>
</head>
<body>
    <h2>Hasil Pencarian Produk</h2>
    <p>Kata kunci: Laptop</p>
    <p>Kategori: Elektronik</p>

    <table border="1" cellpadding="8" cellspacing="0">
        <tr>
            <th>ID</th>
            <th>Nama Produk</th>
            <th>Harga</th>
        </tr>

        <?php if (count($hasil) > 0): ?>
            <?php foreach ($hasil as $produk): ?>
                <tr>
                    <td><?= htmlspecialchars((string) $produk['id']) ?></td>
                    <td><?= htmlspecialchars($produk['nama_produk']) ?></td>
                    <td>Rp <?= number_format((float) $produk['harga'], 0, ',', '.') ?></td>
                </tr>
            <?php endforeach; ?>
        <?php else: ?>
            <tr>
                <td colspan="3">Tidak ada produk yang sesuai.</td>
            </tr>
        <?php endif; ?>
    </table>
</body>
</html>
