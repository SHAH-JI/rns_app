import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:image_picker/image_picker.dart';
import 'package:rns_app/model/dummyData.dart';
import 'package:rns_app/screens/ContactList.dart';
import 'package:file_picker/file_picker.dart';

class PaymentScreen extends StatefulWidget {
  static String id = 'payment_screen';
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  Firestore fireStore = Firestore.instance;

  void getData() async {
    final user = await fireStore.collection('payment').getDocuments();
    for (var userData in user.documents) {
      print(userData);
    }
  }

  Future<PickedFile> imageFile;
  File file;
  pickImageFromGallery(ImageSource source) async {
    imageFile = ImagePicker().getImage(source: source);
    file = await FilePicker.getFile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment"),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Center(
                child: GestureDetector(
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage('images/kim.jpg'),
                          fit: BoxFit.fill),
                    ),
                  ),
                  onTap: () {
                    pickImageFromGallery(ImageSource.gallery);
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                message,
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                amount,
                style: TextStyle(fontSize: 40.0, color: Colors.black12),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  'Hello',
                  style: TextStyle(fontSize: 20.0, color: Colors.black12),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
//              crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.cancel,
                          size: 70.0,
                          color: Colors.lightBlueAccent,
                        ),
                        iconSize: 40.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          '        Decline',
                          style: TextStyle(color: Colors.lightBlueAccent),
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, ContactListScreen.id);
                        },
                        icon: Icon(
                          Icons.check,
                          size: 70.0,
                          color: Colors.lightBlueAccent,
                        ),
                        iconSize: 40.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          '        Send',
                          style: TextStyle(color: Colors.lightBlueAccent),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Text("Phone Number : $phoneNumber"),
          ],
        ),
      ),
    );
  }
}
