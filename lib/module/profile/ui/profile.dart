import 'package:flutter/material.dart';
import 'package:halimton_task/module/profile/bloc/profile_bloc.dart';

import '../../../api/api_calls.dart';
import '../../../base/base_response.dart';
import '../../../base/const_string.dart';
import '../../../sharePreference/shared_stored.dart';
import '../model/profile_model.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  ProfileBloc profilebloc = ProfileBloc();
  List<Data> profiledaata = [];

  String name = "";
  String country = "";
  int? following;
  int? followers;
  @override
  void initState() {
    callApi();
    profilebloc.profilestream.listen((event) async {
      switch (event.status) {
        case Status.LOADING:
          await ApiCall().showLoaderDialog(context);
          break;
        case Status.COMPLETED:
          Navigator.pop(context);
          setState(() {
            profiledaata = event.data!.data!;
            name = profiledaata[0].clientName!;

            followers = profiledaata[0].followlist!.follower!;
            following = profiledaata[0].followlist!.following!;
          });

          print("api call ");

          break;
        case Status.ERROR:
          setState(() {});
          break;
      }
    });
    super.initState();
  }

  Future<void> callApi() async {
    Map<String, dynamic> body = {
      'ClientID': 157442.toString(),
      'userid': 157442.toString(),
    };
    print(body);

    profilebloc.allcoursesget(body);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff699feb),
        leading: Text(""),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Center(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                    minRadius: 90,
                    maxRadius: 90,
                    backgroundImage:
                        //  SharedPrefrence().getprofileimage() == "" ||
                        //         SharedPrefrence().getprofileimage().toString() == null
                        //     ?
                        AssetImage("assets/google.png")
                    //  as ImageProvider
                    // : NetworkImage(AppString.urlbanner +
                    //     SharedPrefrence().getprofileimage()!),
                    ),
                Text(
                  name,
                  // "Pratap Awachar",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff000000),
                  ),
                ),
                Text(
                  "$country",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff000000),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    "Obsessed with fahim MD's love to go shopping on weekends and loveee food # Foodielife",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text(
                            "Followers",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff000000),
                            ),
                          ),
                          Text(
                            "$followers",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff000000),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Column(
                        children: [
                          Text(
                            "Following",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff000000),
                            ),
                          ),
                          Text(
                            "$following",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff000000),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      // width: double.infinity,
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 70),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blue,
                      ),
                      child: Text(
                        "Follow",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      // width: double.infinity,
                      margin: EdgeInsets.only(top: 20),
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.lightBlue,
                      ),
                      child: Text(
                        "Message",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        )),
      ),
    );
  }
}
