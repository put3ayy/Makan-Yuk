import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/format_rupiah.dart';
import '../widgets/app_text.dart';
import 'add_menu_page.dart';
import 'menu_detail_page.dart';

class MenuListPage extends StatefulWidget {
  const MenuListPage({super.key});

  @override
  State<MenuListPage> createState() => _MenuListPageState();
}

class _MenuListPageState extends State<MenuListPage> {
  //List menu makanan dan minuman
  final List<Map<String, dynamic>> _menus = [
    {'nama': 'Nasi Goreng', 'harga': 13000, 'jenis': 'makanan'},
    {'nama': 'Nasi Uduk', 'harga': 12000, 'jenis': 'makanan'},
    {'nama': 'Mie Ayam', 'harga': 15000, 'jenis': 'makanan'},
    {'nama': 'Bakso', 'harga': 15000, 'jenis': 'makanan'},
    {'nama': 'Soto Ayam', 'harga': 13000, 'jenis': 'makanan'},
    {'nama': 'Ketoprak', 'harga': 13000, 'jenis': 'makanan'},
    {'nama': 'Ayam Bakar', 'harga': 13000, 'jenis': 'makanan'},

    {'nama': 'Air Mineral', 'harga': 4000, 'jenis': 'minuman'},
    {'nama': 'Es Teh Manis', 'harga': 4000, 'jenis': 'minuman'},
    {'nama': 'Es Jeruk', 'harga': 5000, 'jenis': 'minuman'},
    {'nama': 'Es Coklat', 'harga': 7000, 'jenis': 'minuman'},
    {'nama': 'Kopi Susu', 'harga': 8000, 'jenis': 'minuman'},
  ];

  Future<void> _tambahMenu() async {
    final result = await Get.to(() => const AddMenuPage());
    if (result != null) {
      final menuBaru = Map<String, dynamic>.from(result as Map);
      menuBaru['jenis'] ??= 'makanan';
      setState(() {
        if (menuBaru['jenis'] == 'makanan') {
          // makanan disisipkan sebelum minuman pertama agar kelompok tetap rapi
          final indexMinuman =
              _menus.indexWhere((m) => m['jenis'] == 'minuman');
          if (indexMinuman == -1) {
            _menus.add(menuBaru);
          } else {
            _menus.insert(indexMinuman, menuBaru);
          }
        } else {
          _menus.add(menuBaru);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        scrolledUnderElevation: 0,
        title: const AppText('MakanYuk', size: 30, weight: FontWeight.w600),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: AppText(
              'Daftar menu di MakanYuk',
              size: 16,
              weight: FontWeight.w500,
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 88),
              itemCount: _menus.length,
              itemBuilder: (context, index) {
                final menu = _menus[index];
                final bool minuman = menu['jenis'] == 'minuman';
                final MaterialColor warna = minuman ? Colors.blue : Colors.orange;
                final bool awalKelompok = index > 0 && _menus[index - 1]['jenis'] != menu['jenis'];
                final double radius = minuman ? 28 : 12;

                return Card(
                  elevation: 0,
                  color: warna.shade50,
                  margin: EdgeInsets.only(
                    top: awalKelompok ? 24 : 0,
                    bottom: 10,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(radius),
                    side: BorderSide(
                      color: warna.shade200,
                      width: minuman ? 2 : 1,
                    ),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 6,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(radius),
                    ),
                    leading: Icon(
                      minuman ? Icons.local_drink : Icons.lunch_dining,
                      color: warna,
                      size: 30,
                    ),
                    title: AppText(
                      menu['nama'],
                      size: 15,
                      weight: FontWeight.w600,
                    ),
                    subtitle: AppText(
                      '${minuman ? 'Minuman' : 'Makanan'} • ${formatRupiah(menu['harga'])}',
                      size: 13,
                      weight: FontWeight.w500,
                      color: warna.shade800,
                    ),
                    trailing: Icon(
                      minuman ? Icons.local_cafe : Icons.restaurant,
                      color: warna.shade300,
                    ),
                    onTap: () => Get.to(() => MenuDetailPage(menu: menu)),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _tambahMenu,
        child: const Icon(Icons.add),
      ),
    );
  }
}