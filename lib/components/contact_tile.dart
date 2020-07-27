import 'package:flutter/material.dart';

class ContactTile extends StatelessWidget {
  ContactTile({this.name, this.number});
  String number;
  String name;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 5.0, top: 4.0),
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage('images/kim.jpg'), fit: BoxFit.fill),
              ),
            ),
          ),
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  name,
                  style: TextStyle(fontSize: 22.0),
                  textAlign: TextAlign.left,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  number,
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
