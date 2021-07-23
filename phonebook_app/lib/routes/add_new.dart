import 'package:flutter/material.dart';
import 'package:phonebook/api/api.dart';

class addNew extends StatefulWidget {
  const addNew({ Key? key}) : super(key: key);

  @override
  _addNewState createState() => _addNewState();
}

class _addNewState extends State<addNew> {
  List<DynamicWidget> phoneNumbers = [];
  contactAPI api = contactAPI();
  int pnIndex = 0;

  addDynamic() {
    if (phoneNumbers.length >= 4) {
      return;
    }
    phoneNumbers.add(DynamicWidget(index: pnIndex));
    setState(() {
      pnIndex++;
    });
  }

  clearDynamic() {
    
  }


  @override
  Widget build(BuildContext context) {
    final TextEditingController _firstname = TextEditingController();
    final TextEditingController _lastname = TextEditingController();

    clearTextInput() {
      _firstname.clear();
      _lastname.clear();
    }
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Adding Contact'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
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
            //TEXTFIELDS
            TextField(
              controller: _firstname,
              decoration: InputDecoration(labelText: 'First Name'),
            ),
            TextField(
              controller: _lastname,
              decoration: InputDecoration(labelText: 'Last Name'),
            ),
            SizedBox(height: 25,),
            // Container(
            //   height: 235,
            //   child: ListView.builder(
            //     scrollDirection: Axis.vertical,
            //     itemCount: _phoneNumbers.length,
            //     itemBuilder: (BuildContext context, int index){
            //       return TextField(
            //         controller: _phoneNumbers[index],
            //         decoration: InputDecoration(labelText: 'Phone Number #${index+1}'),
            //       );
            //     },
            //   ),
            // ),
            Container(
              height: 225,
              child: new ListView.builder(
                itemCount: phoneNumbers.length,
                itemBuilder: (BuildContext context, int index){
                  return phoneNumbers[index];
                }
              ),
            ),

            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                TextButton(
                  onPressed: clearDynamic, 
                  child: Text('Clear All',
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: addDynamic,
                  child: Text('+ Add Number'),
                ),
                TextButton(
                  onPressed: () {
                    api.createContact(_firstname.text, _lastname.text);
                    clearTextInput();
                    Navigator.pop(context);
                  }, 
                  child: Text('Add Contact',
                    style: TextStyle(
                        color: Colors.green,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DynamicWidget extends StatelessWidget {
  int index;
  DynamicWidget({required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: new TextField(
        decoration: new InputDecoration(hintText: 'Phone Number'),
        keyboardType: TextInputType.number,
      ),
    );
  }
}
