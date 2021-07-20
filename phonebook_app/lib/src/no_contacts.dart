import 'package:flutter/material.dart';
import 'package:phonebook/routes/add_new.dart';

class no_Contacts extends StatelessWidget {
  const no_Contacts({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.people, size: 70,),
            Text(
              'No contacts are listed',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 4),
            TextButton(
              onPressed: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => addNew())
                );
              },
              child: Text(
                'Add contacts',
                style: TextStyle(
                  color: Colors.pink[400],
                ),
              ),
            )
          ],
        ),
      );
  }
}
