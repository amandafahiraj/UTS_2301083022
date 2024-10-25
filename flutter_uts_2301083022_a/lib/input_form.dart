import 'package:flutter/material.dart';

class InputForm extends StatelessWidget {
  final TextEditingController kodeController;
  final TextEditingController namaController;
  final TextEditingController meterLaluController;
  final TextEditingController meterIniController;
  final String jenisPelanggan;
  final Function(String) onJenisPelangganChanged;
  final VoidCallback onCalculate;

  InputForm({
    required this.kodeController,
    required this.namaController,
    required this.meterLaluController,
    required this.meterIniController,
    required this.jenisPelanggan,
    required this.onJenisPelangganChanged,
    required this.onCalculate,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
            onJenisPelangganChanged(value!);
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
          keyboardType: TextInputType.number,
        ),
        TextField(
          controller: meterIniController,
          decoration: InputDecoration(labelText: 'Meter Bulan Ini'),
          keyboardType: TextInputType.number,
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: onCalculate,
          child: Text('Hitung Total Bayar'),
        ),
      ],
    );
  }
}
