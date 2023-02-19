import 'package:flutter/material.dart';
//import 'package:pdf_render/pdf_render_widgets.dart';
import 'SecondScreen.dart';
import 'main.dart';
import 'Alumin.dart';
import 'registration.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:datepicker_dropdown/datepicker_dropdown.dart';
//import 'package:file_picker/file_picker.dart';
//import 'package:file_picker/file_picker.dart';
//import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
//import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
//import 'package:pdf_render/pdf_render.dart';

class alumini extends StatefulWidget {
  const alumini({Key? key}) : super(key: key);

  @override
  State<alumini> createState() => _aluminiState();
}

class _aluminiState extends State<alumini> {
  String? Choice;
  final _Regformkey = GlobalKey<FormState>();
  String _RegEmail = '';
  String _Regpassword = '';
  String _phone_number = '';
  String _user_name = '';
  String _College_name = '';
  String _addmission_year = '';
  String _alumni_year = '';
  //late File file
  TextEditingController RegEmail = new TextEditingController();
  TextEditingController Regpass = new TextEditingController();
  TextEditingController phone = new TextEditingController();
  TextEditingController username = new TextEditingController();
  TextEditingController collegename = new TextEditingController();
  TextEditingController addmissionyear = new TextEditingController();
  TextEditingController aluminiyear = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
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
            "Registration Form",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body:  Center(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepOrange,Colors.orangeAccent],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
            ),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Card(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Form(
                    key: _Regformkey,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Column(
                            children: [
                              RadioListTile(
                                  title: Text('Student'),
                                  value: "Student",
                                  groupValue: Choice,
                                  onChanged: (value){
                                    setState(() {
                                      Choice = value.toString();
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context)=>Registration_form()));
                                    });
                                  }
                              ),
                              RadioListTile(
                                  title: Text('Alumni'),
                                  value: "Alumni",
                                  groupValue: Choice,
                                  onChanged: (value){
                                    setState(() {
                                      Choice = value.toString();
                                    });
                                  }
                              ),
                            ],
                          ),
                          //Email
                          TextFormField(
                            controller: RegEmail,
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
                            onChanged: (value)=> _RegEmail= value,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          //Password
                          TextFormField(
                            controller: Regpass,
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
                            onChanged: (value)=> _Regpassword = value,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: phone,
                            decoration: const InputDecoration(labelText: 'Phone Number'),
                            validator: (value)
                            {
                              if(value == null || value.trim().isEmpty)
                              {
                                return 'Please Enter your Phone Number';
                              }
                              //Checking if the Email address has the right format.
                              if(value.trim().length<9)
                              {
                                return 'The Phone number should be at least 9 number in length';
                              }
                              return null;
                            },
                            onChanged: (value)=> _phone_number = value,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: username,
                            decoration: const InputDecoration(labelText: 'User Name'),
                            validator: (value)
                            {
                              if(value == null || value.trim().isEmpty)
                              {
                                return 'Please Enter your User_Name';
                              }
                              return null;
                            },
                            onChanged: (value)=> _user_name = value,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: collegename,
                            decoration: const InputDecoration(labelText: 'College Name'),
                            validator: (value)
                            {
                              if(value == null || value.trim().isEmpty)
                              {
                                return 'Please Enter your College Name';
                              }
                              return null;
                            },
                            onChanged: (value)=> _College_name = value,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: aluminiyear,
                            decoration: const InputDecoration(labelText: 'Alumini year'),
                            validator: (value)
                            {
                              if(value == null || value.trim().isEmpty)
                              {
                                return 'Please Enter your Alumini Year';
                              }
                              return null;
                            },
                            onChanged: (value)=> _alumni_year = value,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          RaisedButton(
                            textColor: Colors.black,
                            color: Colors.greenAccent,
                            child: Text('Submit'),
                            onPressed: () async {
                              WidgetsFlutterBinding.ensureInitialized();
                              await Firebase.initializeApp();
                              Map <String,dynamic>data = {
                                "field1":RegEmail.text,
                                "field2":Regpass.text,
                                "field3":phone.text,
                                "field4":username.text,
                                "field5":collegename.text,
                                "field6":aluminiyear.text,
                              };
                              FirebaseFirestore.instance.collection("Users").add(data);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
