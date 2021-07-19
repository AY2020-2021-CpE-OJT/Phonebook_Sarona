import 'package:flutter/material.dart';
import 'package:phonebook/routes/edit_contact.dart';

class viewContact extends StatelessWidget {
  final Map contact;
  const viewContact({ Key? key, required this.contact }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var avatarLetter = '${contact['first_name'].substring(0,1).toUpperCase()}${contact['last_name'].substring(0,1).toUpperCase()}';
    var fullName = '${contact['first_name']} ${contact['last_name']}';
    return Scaffold(
      appBar: AppBar(
        title: Text('Viewing Contact'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {Navigator.push(context, 
        MaterialPageRoute(builder: (context) => editContact(contact: contact)));
        },
        child: Icon(Icons.edit),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(25, 20, 25, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20),
              child: Center(
                child: CircleAvatar(
                  child: Text(avatarLetter,
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  radius: 42,
                ),
              ),
            ),
            Divider(height: 20, color: Colors.blueGrey[900],),
            Text('NAME'),
            SizedBox(height: 5,),
            Text(
              fullName,
              style: TextStyle(
                color: Colors.blue[900],
                fontSize: 28,
                letterSpacing: 1.5,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 45,),
            Text(
              'PHONE NUMBER(S)'
            ),
            SizedBox(height: 5,),
            Expanded(
              child: ListView.builder( 
                itemCount: contact['phone_numbers'].length,
                itemBuilder: (BuildContext context, int index){
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                    child: Row(
                      children: [
                        Icon(Icons.phone_android_sharp,
                          color: Colors.blue[900],
                        ),
                        SizedBox(width: 10,),
                        Text(
                            contact['phone_numbers'][index],
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ), 
          ],
        ),
      ),
    );
  }
}
