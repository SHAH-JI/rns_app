import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rns_app/components/contact_tile.dart';
import 'package:rns_app/model/dummyData.dart';
import 'package:rns_app/model/person.dart';

class ContactListScreen extends StatefulWidget {
  static String id = "contact_list_screen";
  @override
  _ContactListScreenState createState() => _ContactListScreenState();
}

class _ContactListScreenState extends State<ContactListScreen> {
  Firestore _fireStore = Firestore.instance;
  List<Person> updated = [];
  void getData() async {
    final user = await _fireStore.collection('contactList').getDocuments();
    for (var userData in user.documents) {
      updated.add(Person(
          name: userData['name'],
          number: userData['number'],
          image: userData['image']));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              onPressed: () {
                showSearch(context: context, delegate: Search(names));
              },
              icon: Icon(Icons.search),
            )
          ],
        ),
        body: Container(
          child: ListView.separated(
            itemCount: names.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: ContactTile(
                  name: names[index],
                  number: phoneNumbers[index],
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
          ),
        ));
  }
}

class Search extends SearchDelegate {
  String selectedResult;
  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          query = " ";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      child: Center(
        child: Text(selectedResult),
      ),
    );
  }

  final List<String> listExample;
  Search(this.listExample);

  List<String> recentList = ['Ku Wo', "Artur RI"];

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestionList = [];
    query.isEmpty
        ? suggestionList = recentList
        : suggestionList.addAll(listExample.where(
            (element) => element.contains(query),
          ));

    return ListView.builder(
        itemCount: suggestionList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(suggestionList[index]),
            onTap: () {
              selectedResult = suggestionList[index];
              showResults(context);
            },
          );
        });
  }
}
