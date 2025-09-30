import 'package:flutter/material.dart';

class CekHariPage extends StatefulWidget {
  const CekHariPage({super.key});

  @override
  State<CekHariPage> createState() => _CekHariPageState();
}

class _CekHariPageState extends State<CekHariPage> {
  final TextEditingController _nomorController = TextEditingController();
  String hasil = "";

  void cekHari() {
    int nomor = int.tryParse(_nomorController.text) ?? 0;
    List<String> hari = [
      "Senin",
      "Selasa",
      "Rabu",
      "Kamis",
      "Jumat",
      "Sabtu",
      "Minggu"
    ];

    if (nomor >= 1 && nomor <= 7) {
      setState(() {
        hasil = "Hari: ${hari[nomor - 1]}";
      });
    } else {
      setState(() {
        hasil = "Nomor tidak valid (1-7)";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Cek Hari")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _nomorController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Masukkan angka (1-7)",
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: cekHari,
              child: const Text("Cek Hari"),
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
