import 'package:bikin_data/screens/detail_page.dart';
import 'package:bikin_data/models/animalList_page.dart';
import 'package:bikin_data/screens/login.dart';
import 'package:bikin_data/screens/profile_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String username;
  final String? alamat;

  const HomePage({super.key, required this.username, this.alamat});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF0F5), 
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFB6C1),
        elevation: 0,
        title: const Text(
          "Home Page",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return const ProfilePage();
                }),
              );
            },
            icon: const Icon(Icons.person, color: Colors.white),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) {
                  return const LoginPage();
                }),
                (route) => false,
              );
            },
            icon: const Icon(
              Icons.logout_outlined,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Text(
            "Selamat datang, $username ",
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: Color(0xFF8B5E83), 
            ),
            textAlign: TextAlign.center,
          ),
          if (alamat != null) ...[
            const SizedBox(height: 8),
            Text(
              "Alamat: $alamat",
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
            ),
          ],
          const SizedBox(height: 20),

          // Grid list 
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 kolom
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.65, // biar seragam proporsinya
                ),
                itemBuilder: (context, index) {
                  return _animalCard(context, index);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _animalCard(BuildContext context, int index) {
    final kingdom = dummyAnimals[index];
    return InkWell(
    
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return DetailPage(index: index);
          }),
        );
      },

      
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.pink.shade100,
              blurRadius: 6,
              offset: const Offset(3, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Gambar poster
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
              child: Image.network(
                
              dummyAnimals[index].image,
                fit: BoxFit.cover,
                height: 180,
              ),
            ),

            // Info 
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Text(
                    dummyAnimals[index].name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Color(0xFF8B5E83),
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    " ${dummyAnimals[index].type}",
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.pink.shade400,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    " ${dummyAnimals[index].habitat}",
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.pink.shade400,
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  

}


