import 'package:flutter/material.dart';
import 'package:phonebook/api/api.dart';

class addNew extends StatelessWidget {
  const addNew({ Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _firstname = TextEditingController();
    final TextEditingController _lastname = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Adding Contact'),
        centerTitle: true,
      ),
      // resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(15),
                child: CircleAvatar(
                  radius: 42,
                  child: Icon(Icons.person_add,
                    size: 48,
                  ),
                ),
              ),
              Divider(height: 20, color: Colors.blueGrey[900],),
              SizedBox(height: 10),
              TextField(
                controller: _firstname,
                decoration: InputDecoration(labelText: 'First Name'),
              ),
              TextField(
                controller: _lastname,
                decoration: InputDecoration(labelText: 'Last Name'),
              ),
              SizedBox(height: 25,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () {}, 
                    child: Text('Clear All',
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {}, 
                    child: Text('Add Contact'),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
