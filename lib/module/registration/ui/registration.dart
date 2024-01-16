import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:halimton_task/module/registration/bloc/registration_bloc.dart';

import '../../../api/api_calls.dart';
import '../../../base/base_response.dart';
import '../../homepage/ui/homepage.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  RegistrationBloc registrationbloc = RegistrationBloc();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController banknamecontroller = TextEditingController();
  TextEditingController ifsccontroller = TextEditingController();
  TextEditingController branchcontroller = TextEditingController();
  TextEditingController acController = TextEditingController();
  TextEditingController holdernameController = TextEditingController();
  bool term = false;

  var username;
  var fullname;
  var email;
  var phone;
  var password;
  // bool ischeck = false;

  void initState() {
    registrationbloc.registerstream.listen((event) async {
      switch (event.status) {
        case Status.LOADING:
          await ApiCall().showLoaderDialog(context);
          break;
        case Status.COMPLETED:
          Navigator.pop(context);
          if (event.data!.user!.clientName != null) {
            ApiCall().showToast("Register Profile SuccessFully", context);
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => HomePageScreen()),
              (Route<dynamic> route) => false,
            );
          }
          // setState(() {});
          print("api call ");
          // if (event.data!.code! == "200") {
          //   ApiCall().showToast("Account Add Sucessfully", context);
          // } else if (event.data!.code == "400") {
          //   Navigator.pushAndRemoveUntil(
          //     context,
          //     MaterialPageRoute(builder: (context) => LoginScreen()),
          //     (Route<dynamic> route) => false,
          //   );
          // } else {
          //   ApiCall().showToast("something went wrong", context);
          // }
          break;
        case Status.ERROR:
        Navigator.pop(context);
        ApiCall().showToast("Mobile Number already exits",context);
          setState(() {});
          break;
      }
    });
    super.initState();
  }

  Future<void> senduserdetails() async {
    Map<String, dynamic> body = {
      'Name': fullname.toString(),
      'Email': email.toString(),
      'phone_number': phone,
      'Password': password.toString(),
      'Country': 91.toString(),
      'UserName': username.toString()
    };
    print(body);
    var b2 = jsonEncode(body);
    print(b2);
    registrationbloc.Addbankmethod(b2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color(0xffffffff),
          title: Text(
            "Sign up",
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w700,
              color: Color(0xff000000),
            ),
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new,
              size: 20,
              color: Colors.blue,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                Container(
                  // margin: EdgeInsets.all(20),
                  // padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      // borderRadius: BorderRadius.circular(10),
                      // border: Border.all(color: Colors.grey),
                      color: Colors.white),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 30, 15, 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 5,
                              ),

                              TextFormField(
                                controller: banknamecontroller,
                                decoration: InputDecoration(
                                  labelText: "Username",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    borderSide: BorderSide(
                                      color: Colors.grey.shade400,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    borderSide: BorderSide(
                                      color: Colors.grey.shade400,
                                    ),
                                  ),
                                  contentPadding:
                                      EdgeInsets.fromLTRB(15, 0, 15, 0),
                                ),
                                onChanged: (value) {
                                  username = value;
                                  print("jjjjjjjjj${username}");
                                },
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter UserName';
                                  }
                                  return null;
                                },
                              ),

                              SizedBox(height: 20.0),
                              // Text("IFSC Code",
                              //     style: TextStyle(
                              //       fontSize: 15,
                              //       fontWeight: FontWeight.w600,
                              //       color: Color(0xff000000),
                              //     )),
                              SizedBox(
                                height: 5,
                              ),

                              TextFormField(
                                controller: ifsccontroller,
                                decoration: InputDecoration(
                                  label: Text(
                                    "Full Name",
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    borderSide: BorderSide(
                                      color: Colors.grey.shade400,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    borderSide: BorderSide(
                                      color: Colors.grey.shade400,
                                    ),
                                  ),
                                  contentPadding:
                                      EdgeInsets.fromLTRB(15, 0, 15, 0),
                                ),
                                onChanged: (value) {
                                  fullname = value;
                                  print("jjjjjjjjj${fullname}");
                                },
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter Name';
                                  } else if (value.length < 3) {
                                    return " Name must be greater than 3 Alphabet ";
                                  }
                                  return null;
                                },
                              ),

                              SizedBox(height: 20.0),

                              SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                controller: branchcontroller,
                                decoration: InputDecoration(
                                  labelText: "Email",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    borderSide: BorderSide(
                                      color: Colors.grey.shade400,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    borderSide: BorderSide(
                                      color: Colors.grey.shade400,
                                    ),
                                  ),
                                  contentPadding:
                                      EdgeInsets.fromLTRB(15, 0, 15, 0),
                                ),
                                onChanged: (value) {
                                  email = value;
                                  print("jjjjjjjjj${email}");

                                  if (!validateEmail(value)) {
                                    print("Invalid email address");
                                  }
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please Enter correct email';
                                  } else if (!validateEmail(value)) {
                                    return 'Invalid email address';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 20.0),

                              SizedBox(
                                height: 5,
                              ),

                              TextFormField(
                                controller: acController,
                                keyboardType: TextInputType.numberWithOptions(),
                                decoration: InputDecoration(
                                  hintText: "Phone",
                                  labelText: "Phone",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    borderSide: BorderSide(
                                      color: Colors.grey.shade400,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    borderSide: BorderSide(
                                      color: Colors.grey.shade400,
                                    ),
                                  ),
                                  contentPadding:
                                      EdgeInsets.fromLTRB(15, 0, 15, 0),
                                ),
                                onChanged: (value) {
                                  phone = value;
                                  print("jjjjjjjjj${phone}");

                                  //
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please Enter Phone Number';
                                  } else if (value.length != 10) {
                                    return 'Phone Number must be exactly 10 digits';
                                  } else if (!validateMobile(value)) {
                                    return "enter Valid mobile number";
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 20.0),

                              SizedBox(
                                height: 5,
                              ),

                              TextFormField(
                                  controller: holdernameController,
                                  decoration: InputDecoration(
                                    // hintText: "Enter Account Holder Name",
                                    labelText: "Password",

                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                      borderSide: BorderSide(
                                        color: Colors.grey.shade400,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                      borderSide: BorderSide(
                                        color: Colors.grey.shade400,
                                      ),
                                    ),
                                    contentPadding:
                                        EdgeInsets.fromLTRB(15, 0, 15, 0),
                                  ),
                                  onChanged: (value) {
                                    password = value;
                                    print("jjjjjjjjj${password}");
                                  },
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter Password';
                                    }
                                    return null;
                                  },
                                  obscureText: true),

                              SizedBox(height: 25.0),
                              Row(
                                // mainAxisAlignment: MainAxisAlignment.start,
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Checkbox(
                                      activeColor: Colors.green,
                                      value: term,
                                      onChanged: (newValue) {
                                        term = newValue!;
                                        print(term);
                                        setState(() {});
                                      }),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "I agree with the company's ",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 13),
                                          ),
                                          Text(
                                            "Privacy policy",
                                            style: TextStyle(
                                                color: Colors.blue,
                                                fontSize: 13,
                                                decoration:
                                                    TextDecoration.underline,
                                                decorationColor: Colors.blue),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            " and",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 13),
                                          ),
                                          Text(
                                            " terms of services ",
                                            style: TextStyle(
                                                color: Colors.blue,
                                                fontSize: 13,
                                                decoration:
                                                    TextDecoration.underline,
                                                decorationColor: Colors.blue),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),

                              SizedBox(
                                height: 30,
                              ),
                              Center(child: _buildSubmitButton()),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  Widget _buildSubmitButton() {
    return InkWell(
      onTap: () {
        if (term) {
          if (_formKey.currentState!.validate()) {
            print(username);
            print(fullname);
            print(email);
            print(phone);
            print(password);
            print("Buttonpressed");

            senduserdetails();
          }
        } else {
          ApiCall().showToast("Agrre with Privacy Policy", context);
        }
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => HomePageScreen()));
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: Color(0xff805FFE),
          borderRadius: BorderRadius.circular(08),
        ),
        margin: EdgeInsets.all(20),
        width: double.infinity,
        child: Center(
          child: Text('Sign Up',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w900,
                color: Color(0xffffffff),
              )),
        ),
      ),
    );
  }

  bool validateMobile(String value) {
    RegExp regex = RegExp(r'^[6-9]\d{9}$');

    if (value.isEmpty) {
      ApiCall().showToast("Enter the valid Number", context);
      return false;
    }

    if (!regex.hasMatch(value)) {
      print(value);
      ApiCall().showToast("Number Format is Wrong", context);

      return false;
    }

    return true;
  }

  bool validateEmail(String email) {
    RegExp regex = RegExp(
      r'^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$',
    );
    return regex.hasMatch(email);
  }
}
