import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rns_app/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rns_app/screens/Payment.dart';

class LoginPage extends StatefulWidget {
  static String id = 'login_page_screen';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  FirebaseAuth _auth = FirebaseAuth.instance;

  TextEditingController messageTextController;
  String email;
  String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Login",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.lightBlueAccent,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                  child: Center(
                      child: TextField(
                controller: messageTextController,
                keyboardType: TextInputType.emailAddress,
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter your email Address'),
                onChanged: (newValue) {
                  email = newValue;
                },
              ))),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                  child: Center(
                      child: TextField(
                obscureText: true,
                controller: messageTextController,
                keyboardType: TextInputType.emailAddress,
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter your password'),
                onChanged: (newValue) {
                  password = newValue;
                },
              ))),
            ),
            FlatButton(
              child: Text(
                'Login',
                style: TextStyle(color: Colors.lightBlueAccent),
              ),
              onPressed: () async {
                final user = await _auth.signInWithEmailAndPassword(
                    email: email, password: password);
                if (user != null) {
                  Navigator.pushNamed(context, PaymentScreen.id);
                } else {
                  print("email");
                  print("password");
                }
              },
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
