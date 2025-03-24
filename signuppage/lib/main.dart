import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';
//Bhavya Sri Sai- 002893685
//Madhuri Tumula- 002892521

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Signup',
      home: SignupPage(),
    );
  }
}

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign Up")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: FormBuilder(
          key: _formKey,
          child: Column(
            children: [
              // First Row: Name (First Name & Last Name)
              Row(
                children: [
                  Expanded(
                    child: FormBuilderTextField(
                      name: 'first_name',
                      decoration: InputDecoration(labelText: "First Name"),
                      validator: FormBuilderValidators.required(errorText: "First Name is required"),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: FormBuilderTextField(
                      name: 'last_name',
                      decoration: InputDecoration(labelText: "Last Name"),
                      validator: FormBuilderValidators.required(errorText: "Last Name is required"),
                    ),
                  ),
                ],
              ),
              
              SizedBox(height: 16),

              // Second Row: Email & Contact Number
              Row(
                children: [
                  Expanded(
                    child: FormBuilderTextField(
                      name: 'email',
                      decoration: InputDecoration(labelText: "Email"),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(errorText: "Email is required"),
                        FormBuilderValidators.email(errorText: "Enter a valid email"),
                      ]),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: FormBuilderTextField(
                      name: 'contact_no',
                      decoration: InputDecoration(labelText: "Contact No."),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(errorText: "Contact No. is required"),
                        FormBuilderValidators.numeric(errorText: "Enter a valid number"),
                        FormBuilderValidators.minLength(10, errorText: "Enter a valid 10-digit number"),
                      ]),
                    ),
                  ),
                ],
              ),
              
              SizedBox(height: 16),

              // Third Row: Date of Birth & Aadhar
              Row(
                children: [
                  Expanded(
                    child: FormBuilderDateTimePicker(
                      name: 'dob',
                      decoration: InputDecoration(labelText: "Date of Birth"),
                      inputType: InputType.date,
                      format: DateFormat('yyyy-MM-dd'),
                      validator: FormBuilderValidators.required(errorText: "DOB is required"),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: FormBuilderTextField(
                      name: 'aadhar',
                      decoration: InputDecoration(labelText: "Aadhar Number"),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(errorText: "Aadhar is required"),
                        FormBuilderValidators.numeric(errorText: "Enter a valid Aadhar number"),
                        FormBuilderValidators.minLength(12, errorText: "Aadhar should be 12 digits"),
                      ]),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 16),

              // Fourth Row: Address
              FormBuilderTextField(
                name: 'address',
                decoration: InputDecoration(labelText: "Address"),
                maxLines: 3,
                validator: FormBuilderValidators.required(errorText: "Address is required"),
              ),

              SizedBox(height: 16),

              // Signup Button
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.saveAndValidate()) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Signup Successful')));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please fix the errors')));
                  }
                },
                child: Text("Sign Up"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}