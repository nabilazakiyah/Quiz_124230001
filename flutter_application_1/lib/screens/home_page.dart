import 'package:flutter_application_1/models/game_data.dart';
import 'package:flutter_application_1/screens/login_page.dart';
import 'package:flutter_application_1/screens/detail_page.dart';
import 'package:flutter_application_1/screens/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  final String username;
  final String? alamat;
  const HomePage({super.key, required this.username, this.alamat});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false, udah gaperlu
        title: Text("Home Page"),
        actions: [
          IconButton(
            onPressed: (){
              // ini nanti ada back buttonnya
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context){
                    return ProfilePage();
                  }));
            },
            icon: Icon(Icons.person)),
          IconButton(
            onPressed: (){
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context){
                  return LoginPage();
                }),
                (route)=> false);
            },
            icon: Icon(Icons.logout_outlined, 
              color: Colors.red,)),
          
        ],
      ),
      body: Column(
        children: [
          Text("Selamat datang kakak $username",
          style: TextStyle(
            fontSize: 25,
          ),),
          // Text("jangan lupa absen spada"),
          TextButton(
         onPressed: () {
        _launchURL("https://spada.upnyk.ac.id");
        }, 
          child: Text("jangan lupa absen spada"),
        ),

          Expanded(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  ), 
                itemBuilder: (context, index){
                  return _gameCard(context, index);
                },
                itemCount: gameList.length,
                ),
            )),
        ],
      ),
    );
  }

  Widget _gameCard(context, int index){
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context){
            return DetailPage(index: index);
          }));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blueGrey.shade100,
          borderRadius: BorderRadius.all(Radius.circular(15))
        ),
        child: Column(
          children: [
            Image.network(gameList[index].imageUrls[0]),
            Text(gameList[index].name),
            Text("review : ${gameList[index].reviewAverage}"),
          ],
        ),
      ),
    );
  }


   Future<void> _launchURL(String url) async {
  final Uri uri = Uri.parse(url);
  if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
    throw 'Tidak bisa membuka $url';
  }
}


}