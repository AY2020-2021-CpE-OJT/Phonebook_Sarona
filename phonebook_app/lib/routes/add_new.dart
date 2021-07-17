import 'package:flutter/material.dart';

class addNew extends StatelessWidget {
  const addNew({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add new Contacts'),
        centerTitle: true,
      ),
    );
  }
}
