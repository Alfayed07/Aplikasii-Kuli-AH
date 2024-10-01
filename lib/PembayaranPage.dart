import 'package:flutter/material.dart';
import 'package:flutter_application_2/DetailMaintenance.dart';
import 'package:flutter_application_2/ConfirmationPesananPage.dart';

void main() {
  runApp(PembayaranPage());
}

class PembayaranPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RingkasanPembayaranScreen(
        jenisPerbaikan: 'Dapur',
        alamat:
            'Jembatan Lima, Kecamatan Tambora\nJembatan Lima Blok D 32, Kota Jakarta Barat, Daerah Khusus Ibukota Jakarta, Indonesia',
        tanggalSurvey: '16 Juni 2024',
        jamSurvey: '08:00 - 10:00 WIB',
        detailPekerjaan: 'Perbaikan Atap Bocor',
      ),
    );
  }
}

class RingkasanPembayaranScreen extends StatelessWidget {
  final String jenisPerbaikan;
  final String alamat;
  final String tanggalSurvey;
  final String jamSurvey;
  final String detailPekerjaan;

  RingkasanPembayaranScreen({
    required this.jenisPerbaikan,
    required this.alamat,
    required this.tanggalSurvey,
    required this.jamSurvey,
    required this.detailPekerjaan,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('Kuli-Ah'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => KonfirmasiPesananScreen(
                  jenisPerbaikan: jenisPerbaikan,
                  alamat: alamat,
                  tanggalSurvey: tanggalSurvey,
                  jamSurvey: jamSurvey,
                  detailPekerjaan: detailPekerjaan,
                ),
              ),
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'RINGKASAN PEMBAYARAN',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Center(
              child: Column(
                children: [
                  Text(
                    'BAYAR SEBELUM 15 JUNI 2024, PUKUL 23:59 WIB',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'IDR 30.000',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            Text(
              'Payment Method',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            ListTile(
              leading: Icon(Icons.account_balance),
              title: Text('Bank Transfer'),
              trailing: Image.asset(
                'assets/bca_logo.png', // Pastikan ada logo BCA di folder assets
                width: 32,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VirtualAccountScreen(
                      jenisPerbaikan: jenisPerbaikan,
                      alamat: alamat,
                      tanggalSurvey: tanggalSurvey,
                      jamSurvey: jamSurvey,
                      detailPekerjaan: detailPekerjaan,
                    ),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.account_balance_wallet),
              title: Text('E-Wallet'),
              onTap: () {
                // Tindakan untuk e-wallet
              },
            ),
          ],
        ),
      ),
    );
  }
}

class VirtualAccountScreen extends StatelessWidget {
  final String jenisPerbaikan;
  final String alamat;
  final String tanggalSurvey;
  final String jamSurvey;
  final String detailPekerjaan;

  VirtualAccountScreen({
    required this.jenisPerbaikan,
    required this.alamat,
    required this.tanggalSurvey,
    required this.jamSurvey,
    required this.detailPekerjaan,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('Kuli-Ah'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RingkasanPembayaranScreen(
                  jenisPerbaikan: jenisPerbaikan,
                  alamat: alamat,
                  tanggalSurvey: tanggalSurvey,
                  jamSurvey: jamSurvey,
                  detailPekerjaan: detailPekerjaan,
                ),
              ),
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'RINGKASAN PEMBAYARAN',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Center(
              child: Column(
                children: [
                  Image.asset(
                    'assets/bca_logo.png', // Pastikan ada logo BCA di folder assets
                    width: 100,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Virtual Account Number',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '70078152343348993',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Virtual Account Name',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Kuli-Ah Bank',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Nominal',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'IDR 30.000',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  _showSuccessDialog(context);
                },
                child: Text('Oke'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  textStyle: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Pembayaran Berhasil'),
          content: Text('Terima kasih, pembayaran Anda telah berhasil.'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => DetailMaintenance()),
                  (Route<dynamic> route) => false,
                );
              },
            ),
          ],
        );
      },
    );
  }
}
