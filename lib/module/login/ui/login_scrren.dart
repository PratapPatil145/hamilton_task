import "dart:convert";
import "dart:ffi";

import "package:flutter/gestures.dart";
import "package:flutter/material.dart";
import "package:halimton_task/api/api_calls.dart";
import "package:halimton_task/module/homepage/ui/homepage.dart";
import "package:halimton_task/module/login/bloc/login_bloc.dart";

import "../../../base/base_response.dart";
import "../../registration/ui/registration.dart";

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginBloc loginbloc = LoginBloc();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  var email;

  var password;

  void initState() {
    loginbloc.loginstream.listen((event) async {
      switch (event.status) {
        case Status.LOADING:
          await ApiCall().showLoaderDialog(context);
          break;
        case Status.COMPLETED:
          Navigator.pop(context);
          // setState(() {});
          print("api call ");

          if (event.data!.message! == "User Login SuccessFully") {
            ApiCall().showToast("Login SuccessFully", context);
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => HomePageScreen()),
              (Route<dynamic> route) => false,
            );
          } else {
            ApiCall().showToast("Incorrect Password", context);
          }
          break;
        case Status.ERROR:
          Navigator.pop(context);
          ApiCall().showToast("Incorrect Password", context);
          print("error is ${Error}");
          setState(() {});
          break;
      }
    });
    super.initState();
  }

  Future<void> callLoginApi() async {
    Map<String, dynamic> body = {
      'phone_number': email.toString(),
      'password': password.toString(),
    };
    print(body);
    var b2 = jsonEncode(body);
    print(b2);
    loginbloc.loginmethod(b2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [Color(0xff5CC2E0), Color(0xff805CFF)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 5,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/login_top_icon.png"))),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.only(bottom: 15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        colors: [Color(0xff79a2ef), Color(0xff8c6cff)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      )),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Login your account",
                        style: TextStyle(
                            fontWeight: FontWeight.w400, color: Colors.white),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 10, top: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: Colors.white),
                        child: TextField(
                          keyboardType: TextInputType.numberWithOptions(),
                          controller: emailController,
                          // maxLength: 10,
                          decoration: InputDecoration(
                            // hintText: "E-mail",

                            label: Row(
                              children: [
                                Icon(
                                  Icons.person_2_outlined,
                                  color: Colors.grey.shade500,
                                ),
                                Text(
                                  "  Mobile No",
                                  style: TextStyle(color: Colors.grey.shade700),
                                )
                              ],
                            ),

                            contentPadding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                          ),
                          onChanged: (value) {
                            email = value;
                            print("jjjjjjjjj${email}");
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: Colors.white),
                        child: TextField(
                          controller: passController,
                          decoration: InputDecoration(
                            // hintText: "Password",
                            label: Row(
                              children: [
                                Icon(
                                  Icons.lock_clock_outlined,
                                  color: Colors.grey.shade500,
                                ),
                                Text(
                                  "  Password",
                                  style: TextStyle(color: Colors.grey.shade700),
                                )
                              ],
                            ),

                            contentPadding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                          ),
                          onChanged: (value) {
                            password = value;
                          },
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => HomePageScreen()));
                        },
                        child: Text(
                          "Forgot your password?",
                          style: TextStyle(
                              fontWeight: FontWeight.w400, color: Colors.white),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          if (email == null || email == "") {
                            ApiCall().showToast("Enter Mobile No", context);
                          } else if (!validateMobile(email)) {
                            // ApiCall().showToast("Invalid Mobile No", context);
                          } else if (password == null || password == "") {
                            ApiCall().showToast("Enter Password", context);
                          } else {
                            callLoginApi();
                          }
                        },
                        child: Container(
                          width: double.infinity,
                          margin: EdgeInsets.only(top: 20),
                          padding: EdgeInsets.symmetric(
                            vertical: 14,
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color(0xff5b45bd)),
                          child: Center(
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, bottom: 40),
                  child: RichText(
                    text: TextSpan(
                      text: "You don't have an account yet |   ",
                      style: TextStyle(fontSize: 14),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Sign in',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // Navigate to the second screen when "Sign in" is clicked
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegistrationScreen()),
                              );
                            },
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 1,
                      width: 120,
                      child: VerticalDivider(
                        color: Colors.white,
                        thickness: 80,
                      ),
                    ),
                    Text(
                      "Login with",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 1,
                      width: 120,
                      child: VerticalDivider(
                        color: Colors.white,
                        thickness: 80,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/google.png",
                        height: 50,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Image.asset(
                        "assets/apple.png",
                        height: 50,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Image.asset(
                        "assets/facebook.png",
                        height: 50,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Image.asset(
                        "assets/twitter.png",
                        height: 50,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool validateEmail(String email) {
    RegExp regex = RegExp(
      r'^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$',
    );
    return regex.hasMatch(email);
  }

  bool validateMobile(String value) {
    RegExp regex = RegExp(r'^[6-9]\d{9}$');

    if (value.isEmpty) {
      ApiCall().showToast("Enter the valid Number", context);
      return false;
    }

    if (!regex.hasMatch(value)) {
      print(value);
      ApiCall().showToast("Mobile Number should be 10 Digit", context);

      return false;
    }

    return true;
  }
}
