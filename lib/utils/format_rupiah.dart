String formatRupiah(int harga) {
  final angka = harga.toString();
  final buffer = StringBuffer();
  for(int i = 0; i< angka.length; i++) {
    if (i > 0 && (angka.length - i) % 3 == 0) buffer.write(".");
    buffer.write(angka[i]);
  }
  return 'Rp $buffer';
}