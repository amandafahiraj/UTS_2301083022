import 'package:flutter/material.dart';
import 'pdam.dart';
import 'input_form.dart';
import 'output_display.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PdamCalculatorScreen(),
    );
  }
}



class PdamCalculatorScreen extends StatefulWidget {
  @override
  _PdamCalculatorScreenState createState() => _PdamCalculatorScreenState();
}

class _PdamCalculatorScreenState extends State<PdamCalculatorScreen> {
  final TextEditingController kodeController = TextEditingController();
  final TextEditingController namaController = TextEditingController();
  final TextEditingController meterLaluController = TextEditingController();
  final TextEditingController meterIniController = TextEditingController();

  String jenisPelanggan = 'GOLD';
  String result = '';

  void _calculateBill() {
    final pdam = Pdam(
      kodePembayaran: kodeController.text, 
      namaPelanggan: namaController.text, 
      jenisPelanggan: jenisPelanggan, 
      tanggal: DateTime.now(), 
      meterBulanIni: double.tryParse(meterIniController.text) ?? 0, 
      meterBulanLalu: double.tryParse(meterLaluController.text) ?? 0,
    );

    pdam.hitungTotalBayar();

    setState(() {
      result = 'Kode Pembayaran: ${pdam.kodePembayaran}\n'
          'Nama Pelanggan: ${pdam.namaPelanggan}\n'
          'Jenis Pelanggan: ${pdam.jenisPelanggan}\n'
          'Tanggal: ${pdam.tanggal.toLocal()}\n'
          'Total Bayar: Rp ${pdam.totalBayar.toStringAsFixed(2)}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDAM Calculator'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: kodeController,
              decoration: InputDecoration(labelText: 'Kode Pembayaran'),
            ),
            TextField(
              controller: namaController,
              decoration: InputDecoration(labelText: 'Nama Pelanggan'),
            ),
            DropdownButton<String>(
              value: jenisPelanggan,
              onChanged: (value) {
                setState(() {
                  jenisPelanggan = value!;
                });
              },
              items: ['GOLD', 'SILVER', 'UMUM']
                  .map((jenis) => DropdownMenuItem(
                    value: jenis,
                    child: Text(jenis),
                    ))
                  .toList(),
              ),
              TextField(
                controller: meterLaluController,
                decoration: InputDecoration(labelText: 'Meter Bulan Lalu'),
                keyboardType:  TextInputType.number,
              ),
              TextField(
                controller: meterIniController,
                decoration: InputDecoration(labelText: 'Meter Bulan Ini'),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _calculateBill, 
                child: Text('Hitung Total Bayar'),
                ),
                SizedBox(height: 20),
                Text(
                  result,
                  style: TextStyle(fontSize: 16),
                ),
          ],
        ),
    ),
    );
  }
}
