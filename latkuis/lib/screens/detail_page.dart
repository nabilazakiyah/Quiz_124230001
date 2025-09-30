import 'package:bikin_data/models/animalList_page.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required int index});
  
  get index => null;

  Future<void> _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception("Tidak bisa membuka $url");
    }
  }

  @override
  Widget build(BuildContext context) {
  
    final Animal = dummyAnimals[index];

    return Scaffold(
      appBar: AppBar(
        title: Text(Animal.name),
        backgroundColor: Colors.pink[200],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(Animal.image, height: 300),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              "${Animal.name} (${Animal.type})",
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text("Genre: ${Animal.weight}"),
            Text("Director: ${Animal.habitat}"),
            Text("Rating: ${Animal.height}"),
            const SizedBox(height: 10),
            Text("Casts: ${Animal.activities}"),
            const SizedBox(height: 10),
            Text(
              "Synopsis:",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(Animal.name),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink[300],
              ),
              onPressed: () => _launchURL(Animal.wikipedia),
              icon: const Icon(Icons.open_in_new),
              label: const Text("Lihat di Wikipedia/IMDb"),
            ),
          ],
        ),
      ),
    );
  }
}