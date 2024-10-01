import 'package:flutter/material.dart';
import 'package:flutter_application_2/MaintenancePage.dart';
import 'package:flutter_application_2/BoronganPage.dart';
import 'package:flutter_application_2/DetailMaintenance.dart';

void main() {
  runApp(MaterialApp(
    title: "homePage",
    home: HalamanSatu(),
  ));
}

class HalamanSatu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        leading: Icon(Icons.wallet),
        title: Text("Rp.2.000.000,00"),
        actions: <Widget>[Icon(Icons.circle_notifications)],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                  'assets/jasa_tukang.jpg'), // Replace with your actual image path
              SizedBox(height: 16.0),
              Text(
                "Perbaikan Bangunan",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              ListTile(
                leading: Icon(Icons.home_repair_service, color: Colors.orange),
                title: Text("Maintenance"),
                subtitle: Text("Panggil jasa perbaikan & perawatan"),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MaintenanceScreen(),
                    ),
                  );
                },
              ),
              Divider(),
              Text(
                "Jasa Konstruksi",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              ListTile(
                leading: Icon(Icons.construction, color: Colors.orange),
                title: Text("Borongan"),
                subtitle: Text(
                    "Bangun/renovasi bersama Kuli-AH yang andal & tersertifikasi"),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BuatPekerjaanBoronganScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.build, color: Colors.orange),
                title: Text("Harian"),
                subtitle: Text("Tukang harian untuk pekerjaan konstruksi"),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailPekerjaanScreen(),
                    ),
                  );
                },
              ),
              Divider(),
              Text(
                "Keunggulan",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              ListTile(
                leading: Icon(Icons.check_circle, color: Colors.green),
                title: Text(
                    "Mitra disaring melalui tahapan seleksi ketat baik hard skills maupun soft skills oleh tim Teknik Sipil Kuli-AH"),
              ),
              ListTile(
                leading: Icon(Icons.check_circle, color: Colors.green),
                title: Text(
                    "Mitra sudah diberikan pelatihan berkala untuk hard skills dan soft skills setiap bulannya"),
              ),
              ListTile(
                leading: Icon(Icons.check_circle, color: Colors.green),
                title: Text(
                    "Seluruh mitra sudah dilindungi asuransi yang diberikan oleh Kuli-AH"),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Riwayat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}

// class fiturHome extends StatelessWidget {
//   fiturHome({required this.titel, this.teks, this.iconfitur});

//   final String titel;
//   final String teks;
//   final IconData iconfitur;

//   @override
//   Widget build(BuildContext context){
//     ListTile(
//                 leading: iconfitur,
//                 title: titel,
//                 subtitle: teks,
//                 trailing: Icon(Icons.arrow_forward),
//                 onTap: () {
//                   // Handle onTap
//                 },
//               ),
//   }
//   }

////////////////////////////////////////////


