import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({ Key? key }) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final TextEditingController _username = TextEditingController();
    final TextEditingController _password = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: Center(
          child: Padding(
            padding: EdgeInsets.fromLTRB(50, 20, 50, 100),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  CircleAvatar(
                    child: Icon(Icons.book, size: 54,),
                    radius: 48,
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _username,
                    decoration: InputDecoration(
                      hintText: 'Enter a Username',
                      labelText: 'Username',
                      helperText: ' '
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Username shouldn't be Empty";
                      } else if (value != 'admin') {
                        return "Incorrect Username";
                      } else return null;
                    },
                  ),
                  TextFormField(
                    controller: _password,
                    decoration: InputDecoration(
                      hintText: 'Enter your Password',
                      labelText: 'Password',
                      helperText: ' '
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Password shouldn't be Empty";
                      } else if (value != '123') {
                        return "Incorrect password";
                      } else return null;
                    },
                  ),
                  SizedBox(height: 8,),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        if (_username.text == 'admin' && _password.text == '123') {
                          Navigator.pushNamed(context, '/contact');
                        }
                      }
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    )
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}