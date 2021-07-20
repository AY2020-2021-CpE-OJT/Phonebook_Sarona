import 'package:flutter/material.dart';
import 'package:phonebook/routes/view_contact.dart';
import 'no_contacts.dart';

class contactsListing extends StatelessWidget {
  final List contacts;
  final Function(String id) toDelete;

  
  contactsListing({required this.contacts,  required this.toDelete});

  @override
  Widget build(BuildContext context) {
    return contacts.isEmpty ? no_Contacts() : Container(
      padding: EdgeInsets.fromLTRB(8, 5, 8, 70),
      child: ListView(
        children: contacts.map((contact) => GestureDetector(
          onTap: () => 
          Navigator.push(context, 
            MaterialPageRoute(
              builder: (context) => viewContact(contact: contact)
            )
          ),
          child: Card(
            child: new ListTile(
              leading: CircleAvatar(
                radius: 20,
                child: Text('${contact['first_name'].substring(0,1).toUpperCase()}${contact['last_name'].substring(0,1).toUpperCase()}'),
              ),
              title: Text('${contact['first_name']} ${contact['last_name']}'),
              subtitle: contact['phone_numbers']?.isEmpty ? Text('') : Text('${contact['phone_numbers'][0]}'),
              trailing: Wrap(
                children: [
                  IconButton(
                    onPressed: () => showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(25))),
                          title: new Text('Are you sure?', textAlign: TextAlign.center),
                          content: Text('This will delete the whole contact', textAlign: TextAlign.center),
                          actions: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                TextButton(
                                    onPressed: () {
                                      toDelete(contact['_id']);
                                      Navigator.of(context).pop();
                                    },    //Deletes the data
                                    child: Text('Confirm',
                                      style: TextStyle(color: Colors.red,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {Navigator.of(context).pop();},
                                  child: Text('Cancel',
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        );
                      }
                    ),
                    icon: Icon(Icons.delete),
                    splashRadius: 16,
                    color: Colors.red[500],
                  ),
                ],
              ),
            ),
          ),
        )).toList()
      ),
    );
  }
}