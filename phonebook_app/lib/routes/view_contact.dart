import 'package:flutter/material.dart';

class viewContact extends StatelessWidget {
  final Map contact;
  const viewContact({ Key? key, required this.contact }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String avatarLetter = '${contact['first_name'].substring(0,1).toUpperCase()}${contact['last_name'].substring(0,1).toUpperCase()}';
    return Scaffold(
      appBar: AppBar(
        title: Text('Viewing Contact'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(25, 20, 25, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: CircleAvatar(
                child: Text(avatarLetter,
                  style: TextStyle(
                    fontSize: 27,
                  ),
                ),
                radius: 35,
              ),
            ),
            Divider(height: 20, color: Colors.blueGrey[900],),
            Text('FIRST NAME'),
            SizedBox(height: 5,),
            Text(
              '${contact['first_name']}',
              style: TextStyle(
                color: Colors.blue[900],
                fontSize: 28,
                letterSpacing: 1.5,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20,),
            Text('LAST NAME'),
            SizedBox(height: 5,),
            Text(
              '${contact['last_name']}',
              style: TextStyle(
                color: Colors.blue[900],
                fontSize: 28,
                letterSpacing: 1.5,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 35,),
            Text(
              'PHONE NUMBER(S)'
            ),
            SizedBox(height: 5,),
            Expanded(
              child: ListView.builder( 
                itemCount: contact['phone_numbers'].length,
                itemBuilder: (BuildContext context, int index){
                  return Text(
                    contact['phone_numbers'][index],
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
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
