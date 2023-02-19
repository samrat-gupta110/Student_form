import 'dart:ffi';

import 'package:flutter/material.dart';
import 'main.dart';
import 'registration.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  //Define the key to access the form.
  final _formkey = GlobalKey<FormState>();

  String _Email = '';
  String _password = '';

  //This function will trigger when user click on submit button
  void _trysubmitform()
  {
    final bool? isValid = _formkey.currentState?.validate();
    if(isValid == true)
      {
        debugPrint('Submitted Successfully');
        debugPrint(_Email);
        debugPrint(_password);

        /*
        Continute proccessing the provided information with your own logic
        such us sending HTTP requests, savaing to SQLite database, etc
         */
      }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
        ),
        title: Center(
          child: Text(
              "User Form",
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepOrange,Colors.orangeAccent],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
        ),
        child: Center(
          child: Card(
            margin: const EdgeInsets.symmetric(horizontal: 35),
            child: Padding(
                padding: const EdgeInsets.all(20),
              child: Form(
                key: _formkey,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        //Email
                        TextFormField(
                          decoration: const InputDecoration(labelText: 'Email'),
                          validator: (value)
                          {
                            if(value == null || value.trim().isEmpty)
                              {
                                return 'Please Enter your Email Address';
                              }
                            //Checking if the Email address has the right format.
                            if(!RegExp(r'\S+@\S+\.\S+').hasMatch(value))
                              {
                                return 'Please Enter the Valid Email Address';
                              }
                            return null;
                          },
                          onChanged: (value)=> _Email = value,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        //Password
                        TextFormField(
                          decoration: const InputDecoration(labelText: 'Password'),
                          obscureText: true,
                          validator: (value){
                            if(value == null || value.trim().isEmpty)
                              {
                                return 'This field is required';
                              }
                            if(value.trim().length<8)
                              {
                                return 'The password should be at least 8 character length';
                              }
                            // Return null if the password is valid.
                            return null;
                          },
                          onChanged: (value)=> _password = value,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            RaisedButton(
                                textColor: Colors.black,
                                color: Colors.greenAccent,
                                child: Text('Submit'),
                                onPressed: (){
                                  _trysubmitform();
                                }
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            RaisedButton(
                                textColor: Colors.black,
                                color: Colors.greenAccent,
                                child: Text('Sign Up'),
                                onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Registration_form()));
                                },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
              ),
            ),
          ),
        ),
      )
    );
  }
}

