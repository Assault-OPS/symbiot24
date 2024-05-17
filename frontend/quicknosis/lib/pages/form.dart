import 'package:flutter/material.dart';
import '../pages/symptoms.dart';

class Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final formKey = GlobalKey<FormState>(); //key for form
  String? username = "";
  int? age = 0;
  int? selectedRadio;
  bool isSubmitted = false;

  @override
  void initState() {
    super.initState();
    selectedRadio = null;
  }

  void setSelectedRadio(int val) {
    setState(() => selectedRadio = val);
  }

  @override
  Widget build(BuildContext context) {
    final double height= MediaQuery.of(context).size.height;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return  Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: Color(0xFFffffff),
        body: Container(
          padding: const EdgeInsets.only(left: 40, right: 40),
          child: Form(
            key: formKey, //key for form
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height:height*0.04),
                Text("Patient Details", style: TextStyle(fontSize: 30, color:Color(0xFF363f93)),),
                SizedBox(height: 30),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Enter name"
                  ),
                  validator: (value) {
                    if(value!.length < 4) return "Please enter more than 4 characters";
                    else return null;
                  },
                  onSaved: (value) => setState(() => username = value)
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Enter age"
                  ),
                  validator: (value) {
                    if(RegExp(r'[a-zA-Z]').hasMatch(value!)) return "Please enter a number";
                    else return null;
                  },
                  onSaved: (value) => setState(() => age = int.tryParse(value!))
                ),
                SizedBox(height:25),
                Row(
                  children: [
                  Radio(
                    value: 1,
                    groupValue: selectedRadio,
                    activeColor: Colors.lightBlue,
                    onChanged: (value) => setSelectedRadio(value!)
                    ),
                    Text("Male")
                  ]
                ),
                Row(
                  children: [
                  Radio(
                    value: 0,
                    groupValue: selectedRadio,
                    activeColor: Colors.lightBlue,
                    onChanged: (value) => setSelectedRadio(value!)
                    ),
                    Text("Female")
                  ]
                ),
                SizedBox(height: 25),
                Row(
                  children: [
                    ElevatedButton(
                      child: Text("Submit"),
                      onPressed: () {
                        final isValid = formKey.currentState!.validate();
                        if(isValid && selectedRadio != null) {
                          formKey.currentState!.save();
                          isSubmitted = true;
                          print(username);
                          print(age);
                          print(selectedRadio == 0 ? "Female" : "Male");
                        }
                      }
                    ),
                    SizedBox(width: 25),
                    ElevatedButton(
                      child: Text("Continue"),
                      onPressed: () {
                        if(isSubmitted)
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Symptoms()));
                        else {
                          final String message = "Please submit the form before you proceed";
                          final snackBar = SnackBar(
                            content: Text(message, style: TextStyle(fontSize: 20)),
                            backgroundColor: Colors.red
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }                          
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white
                      )
                    )
                  ],
                )
              ],
            ),
          ),
        )
    );
  }
}