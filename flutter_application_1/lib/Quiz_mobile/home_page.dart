import 'package:flutter/material.dart';
import 'package:flutter_application_1/Quiz_mobile/profile_page.dart';
import 'piramida_page.dart';
import 'konversi_page.dart';
import 'cekhari_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home Page")),
      body: Center(
        child: GridView.extent(
          maxCrossAxisExtent: 160, // kotak max lebar 160px
          padding: const EdgeInsets.all(12),
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          children: [
             _menuCard(
              context,
              title: "Profil",
              icon: Icons.person,
              page: const ProfilePage(),
            ),
            _menuCard(
              context,
              title: "Hitung Piramida",
              icon: Icons.change_history,
              page: const PiramidaPage(),
            ),
            _menuCard(
              context,
              title: "Konversi Waktu",
              icon: Icons.access_time,
              page: const KonversiPage(),
            ),
            _menuCard(
              context,
              title: "Cek Hari",
              icon: Icons.calendar_month,
              page: const CekHariPage(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _menuCard(BuildContext context,
      {required String title, required IconData icon, required Widget page}) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => page),
        );
      },
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40, color: const Color.fromARGB(255, 209, 5, 206)),
              const SizedBox(height: 8),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
