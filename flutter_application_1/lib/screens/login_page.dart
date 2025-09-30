import 'package:flutter_application_1/screens/home_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {

  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameC = TextEditingController();
  final passwordC = TextEditingController();
  bool isLoginSuccess = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _usernameField(),
          _passwordField(),
          _loginButton(),
        ],
      ),
    );
  }

  Widget _usernameField(){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: TextFormField(
        enabled: true,
        controller: usernameC,
        decoration: InputDecoration(
          hintText: "Username anda",
          fillColor: Colors.amber,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          )
        ),
      ),
    );
  }

  Widget _passwordField(){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: TextFormField(
        obscureText: true,
        enabled: true,
        controller: passwordC,
        decoration: InputDecoration(
          hintText: "Password anda",
          fillColor: Colors.amber,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          )
        ),
      ),
    );
  }

  Widget _loginButton(){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: (){
          _login();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.amber
        ), 
        child: Text("Login", 
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),
        
        ),
      ),
    );
  }

  void _login(){
    String text = "", username, password;
    username = usernameC.text;
    password = passwordC.text;

    if(password == '123'){
      setState(() {
        text = "Login Berhasil";
        isLoginSuccess = true;
      });
      Navigator.pushReplacement(  //ini buat nama yg bakal muncul di homepage
        context, 
        MaterialPageRoute(builder: (context){
          return HomePage(username: username,);
        })
        );
    }else{
      setState(() {
        text = "Login Gagal";
        isLoginSuccess = false;
      });
    }

    SnackBar snackBar = SnackBar(
      content: Text(text),
      backgroundColor: (isLoginSuccess) ? Colors.green : Colors.red,

      );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);

    
  }
}