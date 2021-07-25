import 'package:flutter/material.dart';
import 'package:phonebook/api/api.dart';

class addNew extends StatefulWidget {
  const addNew({ Key? key}) : super(key: key);

  @override
  _addNewState createState() => _addNewState();
}

class _addNewState extends State<addNew> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstname = TextEditingController();
  final TextEditingController _lastname = TextEditingController();
  final List<TextEditingController> _phoneNumbers = [
    for (var i = 0; i < 3; i++) 
      TextEditingController()
  ];
  int pnIndex = 0;
  contactAPI api = contactAPI();

  addedSnackBar() {
      return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Added Contact..')));
  }

  addNumber () {
      if (pnIndex >= 3) {
        return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Cannot add more Phone Numbers')));
      }
      setState(() {
        pnIndex++;
      });
  }

  clearTextFields() {
      _firstname.clear();
      _lastname.clear();
      for (var i = 0; i < _phoneNumbers.length; i++) {
        _phoneNumbers[i].clear();
      }
      setState(() {
        pnIndex = 0;
      });
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adding Contact'),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          // physics: NeverScrollableScrollPhysics(),
          children: [
              SingleChildScrollView(
                child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: CircleAvatar(
                        radius: 40,
                        child: Icon(Icons.person_add,
                          size: 48,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    //NAME TEXTFIELDS
                    TextFormField(
                      controller: _firstname,
                      decoration: InputDecoration(
                        hintText: 'Enter a first name',
                        labelText: 'First Name',
                        helperText: ' ',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "First Name shouldn't be Empty";
                        } return null;
                      },
                    ),
                    TextFormField(
                      controller: _lastname,
                      decoration: InputDecoration(
                        hintText: 'Enter a last name',
                        labelText: 'Last Name',
                        helperText: ' ',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Last Name shouldn't be Empty";
                        } return null;
                      },
                    ),
                    SizedBox(height: 2),
                    //NUMBER TEXTFIELDS
                    Container(
                      height: 243,
                      child: Column(
                        children: [
                        //#1
                        if (pnIndex == 1 || pnIndex == 2 || pnIndex == 3)
                          Container(
                            child: Stack(
                              alignment: Alignment.centerRight,
                              children: <Widget>[
                                TextFormField(
                                  controller: _phoneNumbers[0],
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.call),
                                    hintText: 'Enter a Number',
                                    labelText: 'Phone Number #1',
                                    helperText: ' '
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Phone Number shouldn't be empty";
                                    } return null;
                                  },
                                ),
                                if (pnIndex == 1)
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        pnIndex--;
                                      });
                                      _phoneNumbers[0].clear();
                                    },
                                    icon: Icon(
                                      Icons.clear,
                                      color: Colors.red,
                                    ),
                                    splashRadius: 12,
                                  )
                              ],
                              
                            ),
                          ),
                        //#2
                        if (pnIndex == 2 || pnIndex == 3)
                          Container(
                            child: Stack(
                              alignment: Alignment.centerRight,
                              children: <Widget>[
                                TextFormField(
                                  controller: _phoneNumbers[1],
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.call),
                                    hintText: 'Enter a Number',
                                    labelText: 'Phone Number #2',
                                    helperText: ' ',
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Phone Number shouldn't be empty";
                                    } return null;
                                  },
                                ),
                                if (pnIndex == 2)
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        pnIndex--;
                                      });
                                      _phoneNumbers[1].clear();
                                    },
                                    icon: Icon(
                                      Icons.clear,
                                      color: Colors.red,
                                    ),
                                    splashRadius: 12,
                                  )
                              ],
                            ),
                          ),
                        //#3
                        if (pnIndex == 3)
                          Container(
                            child: Stack(
                              alignment: Alignment.centerRight,
                              children: <Widget>[
                                TextFormField(
                                  controller: _phoneNumbers[2],
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.call),
                                    hintText: 'Enter a Number',
                                    labelText: 'Phone Number #3',
                                    helperText: ' '
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Phone Number shouldn't be empty";
                                    } return null;
                                  },
                                ),
                                if (pnIndex == 3)
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        pnIndex--;
                                      });
                                      _phoneNumbers[2].clear();
                                    },
                                    icon: Icon(
                                      Icons.clear,
                                      color: Colors.red,
                                    ),
                                    splashRadius: 12,
                                  )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                    SizedBox(height: 20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        TextButton(
                          onPressed: clearTextFields, 
                          child: Text('Clear All',
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: addNumber,
                          child: Text('+ Add Number'),
                        ),
                        TextButton(
                          onPressed: () {
                            final List<String> pnums = [];
                            for (var i = 0; i < 3; i++) {
                              pnums.add(_phoneNumbers[i].text);
                            }
                            print('Added $pnums');

                            if (_formKey.currentState!.validate()) {
                              addedSnackBar();
                              
                              final data = contactInfo(fsName: _firstname.text, lsName: _lastname.text, phNumbers: pnums);
                              api.createContact(data);
                              clearTextFields();
                              Navigator.pop(context);
                            }
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
            ),
          ],
        ),
      ),
    );
  }
}
