import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({ Key? key }) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    final TextEditingController _username = TextEditingController();
    final TextEditingController _password = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.fromLTRB(50, 80, 50, 100),
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
              ),
              TextFormField(
                controller: _password,
                decoration: InputDecoration(
                  hintText: 'Enter your Password',
                  labelText: 'Password',
                  helperText: ' '
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  
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
    );
  }
}