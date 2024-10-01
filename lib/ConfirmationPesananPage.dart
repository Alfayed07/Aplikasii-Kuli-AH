import 'package:flutter/material.dart';
import 'package:flutter_application_2/DetailMaintenance.dart';
import 'package:flutter_application_2/PembayaranPage.dart';

void main() {
  runApp(ConfirmationPage());
}

class ConfirmationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: KonfirmasiPesananScreen(
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

class KonfirmasiPesananScreen extends StatelessWidget {
  final String jenisPerbaikan;
  final String alamat;
  final String tanggalSurvey;
  final String jamSurvey;
  final String detailPekerjaan;

  KonfirmasiPesananScreen({
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
        title: Text('Konfirmasi Pesanan'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailPekerjaanScreen(),
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
            SectionTitle(title: 'Detail Pekerjaan'),
            DetailBox(
              details: {
                'Jenis Perbaikan': jenisPerbaikan,
                'Detail Pekerjaan': detailPekerjaan,
                'Tanggal Survey': tanggalSurvey,
                'Waktu Survey': jamSurvey,
              },
            ),
            SizedBox(height: 16),
            SectionTitle(title: 'Alamat Hunian'),
            DetailBox(
              details: {
                '': alamat,
              },
            ),
            SizedBox(height: 16),
            SectionTitle(title: 'Ringkasan Pesanan'),
            DetailBox(
              details: {
                'Total Hari Survey': '1 hari',
                'Total Biaya Survey': 'Rp 30.000',
                'Peruntukan': 'Survey Lokasi',
              },
            ),
            Spacer(),
            Center(
              child: ElevatedButton(
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
                child: Text('Bayar Sekarang'),
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
}

class SectionTitle extends StatelessWidget {
  final String title;

  SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class DetailBox extends StatelessWidget {
  final Map<String, String> details;

  DetailBox({required this.details});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: details.entries.map((entry) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: entry.key.isNotEmpty ? '${entry.key}: ' : '',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: entry.value),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
