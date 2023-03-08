import "package:flutter/material.dart";
import 'package:wecareapplication_parthkhushboo/main.dart';


class LoginPage extends StatefulWidget{
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String? _email;
  String? _password;
  


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                'We Care',
                style: TextStyle(
                  fontSize: 32.0,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
                              const SizedBox(height: 20),

                Image.asset(
                'assets/images/logo.png',
                width: 150.0,
              ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                   // labelText: 'Email',
                   enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 3,color: Colors.blueAccent),
                    borderRadius: BorderRadius.circular(10),
                   ),
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Enter Email Address',
                  hintStyle: TextStyle(color: Colors.grey),
 
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter Email Address';
                    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                        .hasMatch(value)) {
                      return 'Enter Valid Email Address';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _email = value;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  obscureText: true,
                  decoration:  InputDecoration(
                   // labelText: 'Password',
                    enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 3,color: Colors.blueAccent),
                    borderRadius: BorderRadius.circular(10),
                   ),
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Enter Password ',
                  hintStyle: TextStyle(color: Colors.grey),
 
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter password';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _password = value;
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      // TODO: Perform login
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MyApp()));
                    }
                  },
                  child: const Text('Login'),
                ),
              ],
            ),
          ),
        ),
    ),
    );
  }
}
