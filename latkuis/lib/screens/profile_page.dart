import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Halaman Profile"),
        backgroundColor: Colors.pink[200],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 60,
              backgroundColor: Color.fromARGB(255, 237, 76, 130),
              child: Icon(
                Icons.person, //icon org nya
                size: 60,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 4,
              child: ListTile(
                leading: const Icon(Icons.badge, color: Colors.pink),
                title: const Text(
                  "Nama",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Text("Nabila Marwa Zakiyah"),
              ),
            ),
            const SizedBox(height: 10),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 4,
              child: ListTile(
                leading: const Icon(Icons.numbers, color: Colors.pink),
                title: const Text(
                  "NIM",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Text("124230001"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
