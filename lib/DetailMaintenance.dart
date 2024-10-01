import 'package:flutter/material.dart';
import 'package:flutter_application_2/MaintenancePage.dart';
import 'package:flutter_application_2/ConfirmationPesananPage.dart';

void main() {
  runApp(DetailMaintenance());
}

class DetailMaintenance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Detail Pekerjaan',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DetailPekerjaanScreen(),
    );
  }
}

class DetailPekerjaanScreen extends StatefulWidget {
  @override
  _DetailPekerjaanScreenState createState() => _DetailPekerjaanScreenState();
}

class _DetailPekerjaanScreenState extends State<DetailPekerjaanScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedPerbaikan;
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  TextEditingController _alamatController = TextEditingController();
  TextEditingController _detailController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _timeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Pekerjaan'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MaintenanceScreen(),
              ),
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              DropdownButtonFormField<String>(
                value: _selectedPerbaikan,
                hint: Text('Pilih Perbaikan Hunian'),
                onChanged: (newValue) {
                  setState(() {
                    _selectedPerbaikan = newValue;
                  });
                },
                items: <String>[
                  'Kamar tidur',
                  'Kamar mandi',
                  'Ruang tamu',
                  'Dapur'
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                decoration: InputDecoration(
                  labelText: 'Jenis Perbaikan Harian',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Masukkan alamat';
                  }
                  return null;
                },
                controller: _alamatController,
                decoration: InputDecoration(
                  labelText: 'Alamat Hunian',
                  hintText: 'Masukkan Alamat',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _dateController,
                readOnly: true,
                onTap: _pickDate,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Pilih Tanggal survey';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Tanggal Survey',
                  hintText: 'Pilih Tanggal Survey',
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.calendar_today),
                ),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _timeController,
                readOnly: true,
                onTap: _pickTime,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Isi Jam survey';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Jam Survey',
                  hintText: 'Pilih Jam Survey',
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.access_time),
                ),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _detailController,
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Masukkan Detail Pekerjaan';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Detail Pekerjaan',
                  hintText: 'Ketik situasi saat ini...',
                  border: OutlineInputBorder(),
                ),
              ),
              Spacer(),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => KonfirmasiPesananScreen(
                          jenisPerbaikan: _selectedPerbaikan!,
                          alamat: _alamatController.text,
                          tanggalSurvey: _dateController.text,
                          jamSurvey: _timeController.text,
                          detailPekerjaan: _detailController.text,
                        ),
                      ),
                    );
                  }
                },
                child: Text('Lanjut'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
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

  Future<void> _pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _dateController.text = '${picked.day}/${picked.month}/${picked.year}';
      });
    }
  }

  Future<void> _pickTime() async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
        _timeController.text = picked.format(context);
      });
    }
  }
}
