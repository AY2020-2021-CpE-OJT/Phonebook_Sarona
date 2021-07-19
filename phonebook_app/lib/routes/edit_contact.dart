import 'package:flutter/material.dart';
import 'package:phonebook/api/api.dart';

class editContact extends StatelessWidget {
  // const editContact({ Key? key }) : super(key: key);
  final Map contact;
  editContact({required this.contact});
  
  
  @override
  Widget build(BuildContext context) {
    final TextEditingController _firstname = TextEditingController();
    final TextEditingController _lastname = TextEditingController();
    final List<TextEditingController> _phoneNumbers = [
      for (var i = 0; i < contact['phone_numbers'].length; i++) 
        TextEditingController()
    ];
    /*===================================================================================================*/
    _firstname.text = contact['first_name'];
    _lastname.text = contact['last_name'];
    for (var i = 0; i < contact['phone_numbers'].length; i++) {
      _phoneNumbers[i].text = contact['phone_numbers'][i];
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Editing Contact'),
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
                child: Icon(Icons.edit,
                  color: Colors.blue[600],
                  size: 50,
                ),
              ),
              Divider(height: 20, color: Colors.blueGrey[900],),
              SizedBox(height: 20,),
              TextField(
                controller: _firstname,
                decoration: InputDecoration(labelText: 'First Name'),
              ),
              TextField(
                controller: _lastname,
                decoration: InputDecoration(labelText: 'Last Name'),
              ),
              SizedBox(height: 35,),
              Container(
                height: 235,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: contact['phone_numbers'].length,
                  itemBuilder: (BuildContext context, int index){
                    return TextField(
                      controller: _phoneNumbers[index],
                      decoration: InputDecoration(labelText: 'Phone Number #${index+1}'),
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  TextButton(
                    onPressed: () {}, 
                    child: Text('Save Changes'),
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