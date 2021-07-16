import 'package:flutter/material.dart';
import 'package:phonebook/src/contacts.dart';
import 'package:phonebook/routes/add_new.dart';
import 'package:phonebook/routes/view_contact.dart';

void main() {runApp(MyApp());}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
      '/addnew': (context) => addNew(),
      '/view' : (context) => viewContact(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: contactsScreen(title: 'Phonebook'),
    );
  }
}


