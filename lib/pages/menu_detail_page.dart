import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/format_rupiah.dart';
import '../widgets/app_text.dart';

class MenuDetailPage extends StatelessWidget {
  final Map<String, dynamic> menu;

  const MenuDetailPage({super.key, required this.menu});

  @override
  Widget build(BuildContext context) {
    final bool minuman = menu['jenis'] == 'minuman';
    final MaterialColor warna = minuman ? Colors.blue : Colors.orange;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        scrolledUnderElevation: 0,
        title: const AppText('Detail Menu', size: 20, weight: FontWeight.w600),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //menambahkan icon di detail page
            Icon(
              minuman ? Icons.local_drink : Icons.lunch_dining,
              size: 72,
              color: warna,
            ),
            const SizedBox(height: 16),
            AppText(menu['nama'], size: 24, weight: FontWeight.bold),
            const SizedBox(height: 8),
            AppText(minuman ? 'Minuman' : 'Makanan', size: 14),
            const SizedBox(height: 8),
            AppText(formatRupiah(menu['harga']), size: 18),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => Get.back(), 
              child: const AppText('Kembali'),
              )
          ],
        ),
      ),
    );
  }
}