import 'package:flutter/material.dart';
import 'package:phonebook/routes/login.dart';
import 'package:phonebook/src/contacts.dart';

void main() {runApp(MyApp());}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => LoginScreen(),
        '/contact': (context) => contactsScreen(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}


