import 'package:flutter/material.dart';
import 'package:phonebook/api/api.dart';

class editContact extends StatefulWidget {
  final Map contact;
  const editContact({ Key? key, required this.contact }) : super(key: key);

  @override
  _editContactState createState() => _editContactState();
}

class _editContactState extends State<editContact> {
  final _formKey = GlobalKey<FormState>();
  contactAPI api = contactAPI();
  int pnIndex = 2;

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < pnIndex; i++) {
      if (widget.contact['phone_numbers'][i] == '') {
        pnIndex--;
      }
    }
  }

  addedSnackBar() {
      return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Saved new changes')));
  }

  addNumber () {
      if (pnIndex >= 3) {
        return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Cannot add more Phone Numbers')));
      }
      setState(() {
        pnIndex++;
      });
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController _firstname = TextEditingController();
    final TextEditingController _lastname = TextEditingController();
    final List<TextEditingController> _phoneNumbers = [
      for (var i = 0; i < widget.contact['phone_numbers'].length; i++) 
        TextEditingController()
    ];
    /*===================================================================================================*/
    _firstname.text = widget.contact['first_name'];
    _lastname.text = widget.contact['last_name'];
    for (var i = 0; i < widget.contact['phone_numbers'].length; i++) {
      _phoneNumbers[i].text = widget.contact['phone_numbers'][i];
    }
    /*===================================================================================================*/

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

    return Scaffold(
      appBar: AppBar(
        title: Text('Editing Contact'),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
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
                              api.updateContact(data, widget.contact['_id']);
                              clearTextFields();
                              Navigator.pop(context);
                            }
                          }, 
                          child: Text('Save Changes',
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