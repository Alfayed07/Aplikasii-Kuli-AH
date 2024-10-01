import 'package:flutter/material.dart';
import 'package:flutter_application_2/main.dart';

void main() {
  runApp(BuatPekerjaanBoronganApp());
}

class BuatPekerjaanBoronganApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Buat Pekerjaan Borongan',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: BuatPekerjaanBoronganScreen(),
    );
  }
}

class BuatPekerjaanBoronganScreen extends StatefulWidget {
  @override
  _BuatPekerjaanBoronganScreenState createState() =>
      _BuatPekerjaanBoronganScreenState();
}

class _BuatPekerjaanBoronganScreenState
    extends State<BuatPekerjaanBoronganScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedRole;
  TextEditingController _namaController = TextEditingController();
  TextEditingController _noHpController = TextEditingController();
  String? _jenisProyek;
  String? _jenisBangunan;
  TextEditingController _alamatController = TextEditingController();
  String? _penyediaMaterial;
  TextEditingController _luasTanahController = TextEditingController();
  TextEditingController _luasBangunanController = TextEditingController();
  TextEditingController _estimasiHargaController = TextEditingController();
  TextEditingController _deskripsiPekerjaanController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buat Pekerjaan Borongan'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Saya membuka proyek sebagai..'),
                Row(
                  children: [
                    Expanded(
                      child: RadioListTile<String>(
                        title: const Text('Pemilik Rumah'),
                        value: 'Pemilik Rumah',
                        groupValue: _selectedRole,
                        onChanged: (value) {
                          setState(() {
                            _selectedRole = value;
                          });
                        },
                      ),
                    ),
                    // Expanded(
                    //   child: RadioListTile<String>(
                    //     title: const Text('Developer'),
                    //     value: 'Developer',
                    //     groupValue: _selectedRole,
                    //     onChanged: (value) {
                    //       setState(() {
                    //         _selectedRole = value;
                    //       });
                    //     },
                    //   ),
                    // ),
                    Expanded(
                      child: RadioListTile<String>(
                        title: const Text('Kontraktor'),
                        value: 'Kontraktor',
                        groupValue: _selectedRole,
                        onChanged: (value) {
                          setState(() {
                            _selectedRole = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                TextFormField(
                  controller: _namaController,
                  decoration: InputDecoration(
                    labelText: 'Nama Penanggung Jawab Proyek *',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Masukkan nama penanggung jawab';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _noHpController,
                  decoration: InputDecoration(
                    labelText: 'No. Handphone *',
                    prefixText: '+62',
                  ),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Masukkan nomor handphone';
                    }
                    return null;
                  },
                ),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(labelText: 'Jenis Proyek *'),
                  value: _jenisProyek,
                  onChanged: (newValue) {
                    setState(() {
                      _jenisProyek = newValue;
                    });
                  },
                  items: [
                    'Pasang batu bata',
                    'Plesteran dan acian',
                    'Pengecatan',
                    'Pembuatan rangka atap',
                    'Pembuatan tangga',
                    'Pemasangan keramik',
                    'Pemasangan granit',
                    'Instalasi pipa air'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Pilih jenis proyek';
                    }
                    return null;
                  },
                ),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(labelText: 'Jenis Bangunan *'),
                  value: _jenisBangunan,
                  onChanged: (newValue) {
                    setState(() {
                      _jenisBangunan = newValue;
                    });
                  },
                  items: [
                    'Skala Kecil(Renovasi ruangan,Perbaikan rumah,Pembuatan gudang)',
                    'Skala Menengah(Pembangunan rumah baru,Pembangunan ruko,Renovasi besar rumah)',
                    'Skala Besar(Pembangunan gedung bertingkat,Pembangunan mall,Pembangunan infrastruktur)'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Pilih jenis bangunan';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _alamatController,
                  decoration: InputDecoration(
                    labelText: 'Detail Lokasi',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Masukkan detail lokasi';
                    }
                    return null;
                  },
                ),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(labelText: 'Penyedia Material *'),
                  value: _penyediaMaterial,
                  onChanged: (newValue) {
                    setState(() {
                      _penyediaMaterial = newValue;
                    });
                  },
                  items: ['Pemilik', 'Mitra 10', 'CV Jaya Mandiri']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Pilih penyedia material';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _luasTanahController,
                  decoration: InputDecoration(
                    labelText: 'Estimasi Luas Tanah *',
                    suffixText: 'm²',
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Masukkan estimasi luas tanah';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _luasBangunanController,
                  decoration: InputDecoration(
                    labelText: 'Estimasi Luas Bangunan *',
                    suffixText: 'm²',
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Masukkan estimasi luas bangunan';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _estimasiHargaController,
                  decoration: InputDecoration(
                    labelText: 'Estimasi Harga yang Diinginkan *',
                    prefixText: 'Rp ',
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Masukkan estimasi harga';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _deskripsiPekerjaanController,
                  decoration: InputDecoration(
                    labelText: 'Deskripsi Pekerjaan',
                  ),
                  maxLines: 3,
                ),
                SizedBox(height: 16.0),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Process the form data and navigate to success screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SuccessScreen(),
                          ),
                        );
                      }
                    },
                    child: Text('Buat Pekerjaan'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      padding: EdgeInsets.symmetric(
                          horizontal: 32.0, vertical: 12.0),
                      textStyle: TextStyle(fontSize: 16.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.mail,
                color: Colors.orange,
                size: 64.0,
              ),
              SizedBox(height: 16.0),
              Text(
                'Pekerjaan berhasil dibuat,\nsilahkan tunggu 2x24 jam untuk informasi selanjutnya dari tim kami',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: () {
                  //Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HalamanSatu(),
                    ),
                  );
                },
                child: Text('Kembali ke Beranda'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding:
                      EdgeInsets.symmetric(horizontal: 32.0, vertical: 12.0),
                  textStyle: TextStyle(fontSize: 16.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
