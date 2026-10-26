import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Poppins dipilih karena bentuknya bulat dan bersih, mudah dibaca di layar kecil.
// Ukuran, ketebalan, dan warna dijadikan parameter agar satu widget bisa dipakai untuk judul, nama menu, harga, dan tombol.
class AppText extends StatelessWidget {
  final String text;
  final double size;
  final FontWeight weight;
  final Color? color;

  const AppText (
    this.text, {
      super.key,
      this.size = 14,
      this.weight = FontWeight.normal,
      this.color,
    });

    @override
    Widget build (BuildContext context) {
      return Text (
        text,
        style: GoogleFonts.poppins (
          fontSize: size,
          fontWeight: weight,
          color: color,
        ),
      );
    }
}