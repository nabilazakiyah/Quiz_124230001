import 'package:flutter/material.dart';

class PiramidaPage extends StatefulWidget {
  const PiramidaPage({super.key});

  @override
  State<PiramidaPage> createState() => _PiramidaPageState();
}

class _PiramidaPageState extends State<PiramidaPage> {
  final TextEditingController _alasController = TextEditingController();
  final TextEditingController _tinggiController = TextEditingController();
  String hasil = "";

  void hitung() {
    double alas = double.tryParse(_alasController.text) ?? 0;
    double tinggi = double.tryParse(_tinggiController.text) ?? 0;
    double volume = (alas * alas * tinggi) / 3;
    double keliling = 4 * alas;

    setState(() {
      hasil = "Volume: $volume cm³\nKeliling Alas: $keliling cm";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Hitung Piramida")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _alasController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Panjang alas (cm)",
              ),
            ),
            TextField(
              controller: _tinggiController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Tinggi piramida (cm)",
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: hitung,
              child: const Text("Hitung"),
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
