class Pdam {
  String kodePembayaran;
  String namaPelanggan;
  String jenisPelanggan;
  DateTime tanggal;
  double meterBulanIni;
  double meterBulanLalu;
  double totalBayar = 0.0;

  Pdam({
    required this.kodePembayaran,
    required this.namaPelanggan,
    required this.jenisPelanggan,
    required this.tanggal,
    required this.meterBulanIni,
    required this.meterBulanLalu,
  });

  void hitungTotalBayar() {
    double meterPakai = meterBulanIni - meterBulanLalu;
    double biayaPerMeter;

    if (jenisPelanggan == 'GOLD') {
      if (meterPakai <= 10) {
        biayaPerMeter = 5000;
      } else if (meterPakai <= 20) {
        biayaPerMeter = 10000;
      } else {
        biayaPerMeter = 20000;
      }
    } else if (jenisPelanggan == 'SILVER') {
      if (meterPakai <= 10) {
        biayaPerMeter = 4000;
      } else if (meterPakai <= 20) {
        biayaPerMeter = 8000;
      } else {
        biayaPerMeter = 10000;
      }
    } else {
      // jenis UMUM
      if (meterPakai <= 10) {
        biayaPerMeter = 2000;
      } else if (meterPakai <= 20) {
        biayaPerMeter = 3000;
      } else {
        biayaPerMeter = 5000;
      }
    }

    totalBayar = meterPakai * biayaPerMeter;
  }
}