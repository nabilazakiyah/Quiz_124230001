import 'package:flutter/material.dart';

class KonversiPage extends StatefulWidget {
  const KonversiPage({super.key});

  @override
  State<KonversiPage> createState() => _KonversiPageState();
}

class _KonversiPageState extends State<KonversiPage> {
  final TextEditingController _jamController = TextEditingController();
  String hasil = "";

  void konversi() {
    try {
      // Ambil input, contoh: "12:15"
      List<String> parts = _jamController.text.split(":");
      int jam = int.parse(parts[0]);
      int menit = parts.length > 1 ? int.parse(parts[1]) : 0;

      // Buat DateTime acuan WIB
      DateTime waktuWIB = DateTime(2023, 1, 1, jam, menit);

      // Tambahkan offset
      DateTime waktuWITA = waktuWIB.add(const Duration(hours: 1));
      DateTime waktuWIT = waktuWIB.add(const Duration(hours: 2));

      // Format hasil
      String formatJam(DateTime t) =>
          "${t.hour.toString().padLeft(2, '0')}:${t.minute.toString().padLeft(2, '0')}";

      setState(() {
        hasil =
            "WIB: ${formatJam(waktuWIB)}\nWITA: ${formatJam(waktuWITA)}\nWIT: ${formatJam(waktuWIT)}";
      });
    } catch (e) {
      setState(() {
        hasil = "Format salah! Gunakan hh:mm (contoh: 12:15)";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Konversi Waktu")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _jamController,
              keyboardType: TextInputType.datetime,
              decoration: const InputDecoration(
                labelText: "Masukkan jam (format hh:mm)",
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: konversi,
              child: const Text("Konversi"),
            ),
            const SizedBox(height: 16),
            Text(
              hasil,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
