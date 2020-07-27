import 'package:flutter/material.dart';
import 'package:rns_app/screens/ContactList.dart';
import 'package:rns_app/screens/Payment.dart';
import 'package:rns_app/screens/loginPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RNS TASK',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginPage(),
      routes: {
        LoginPage.id: (context) => LoginPage(),
        PaymentScreen.id: (context) => PaymentScreen(),
        ContactListScreen.id: (context) => ContactListScreen(),
      },
      initialRoute: LoginPage.id,
    );
  }
}
