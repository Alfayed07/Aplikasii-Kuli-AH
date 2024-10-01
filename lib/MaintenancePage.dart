import 'package:flutter/material.dart';
import 'package:flutter_application_2/DetailMaintenance.dart';
import 'package:flutter_application_2/main.dart';

void main() {
  runApp(MaintenancePage());
}

class MaintenancePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Maintenance Process',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MaintenanceScreen(),
    );
  }
}

class MaintenanceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Maintenance'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HalamanSatu(),
              ),
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            MaintenanceStep(
              icon: Icons.engineering,
              title: 'Pesan Surveyor',
              description:
                  'Pesan dan atur jadwal pertemuan dengan surveyor untuk pengecekan',
            ),
            MaintenanceStep(
              icon: Icons.assignment,
              title: 'Proses Survei',
              description:
                  'Proses survei untuk mendapatkan estimasi pengerjaan',
            ),
            MaintenanceStep(
              icon: Icons.calculate,
              title: 'Estimasi Perbaikan',
              description:
                  'Tunggu hasil survei dan dapatkan estimasi perbaikan',
            ),
            MaintenanceStep(
              icon: Icons.build,
              title: 'Proses Perbaikan',
              description:
                  'Pengerjaan perbaikan akan dilakukan jika pembayaran telah selesai',
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPekerjaanScreen(),
                  ),
                );
              },
              child: Text('Pesan Maintenance'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 12.0),
                textStyle: TextStyle(fontSize: 16.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MaintenanceStep extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  MaintenanceStep({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(icon, size: 40.0, color: Colors.blue),
            SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    description,
                    style: TextStyle(fontSize: 14.0),
                  ),
                ],
              ),
            ),
          ],
        ),
        Divider(height: 32.0),
      ],
    );
  }
}
