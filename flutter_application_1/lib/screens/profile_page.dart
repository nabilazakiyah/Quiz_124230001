import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Halaman Profile"),
      ),
      body: Center(
        child: Text("Ini adalah halaman Profile"),
      ),
    );
  }
}