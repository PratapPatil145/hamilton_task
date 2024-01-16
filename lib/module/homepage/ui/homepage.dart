import 'package:flutter/material.dart';
import 'package:halimton_task/module/homepage/bloc/homepage_bloc.dart';
import 'package:halimton_task/module/homepage/model/homepage_model.dart';

import '../../../api/api_calls.dart';
import '../../../base/base_response.dart';
import '../../../base/const_string.dart';
import '../../drawer/navigation_drawer.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  HomePageBloc homepagebloc = HomePageBloc();

  List<Data> restodaata = [];

  void initState() {
    callApi();
    homepagebloc.restaurantstream.listen((event) async {
      switch (event.status) {
        case Status.LOADING:
          await ApiCall().showLoaderDialog(context);
          break;
        case Status.COMPLETED:
          Navigator.pop(context);
          if (event.data!.message == "Success") {
            // print("${event.data.}")

            setState(() {
              restodaata = event.data!.data!;
              print(restodaata[0].createdUser);
              print(restodaata[0].logo);
              print("length of re${restodaata.length}");
            });
          }
          print("api call ");
          // print(event.data.message"Success")

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
          setState(() {});
          break;
      }
    });
    super.initState();
  }

  Future<void> callApi() async {
    Map<String, dynamic> body = {
      'PickupAvailable': 1.toString(),
      'AreaName': "Kuwait".toString(),
      'page': 1.toString(),
      'page limit': 10.toString()
    };
    print(body);

    homepagebloc.allcoursesget(body);
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Color(0xffF5F5F5),
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color(0xff699feb),
          title: Text(
            "",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xffffffff),
            ),
          ),
          // leading: IconButton(
          //   icon: const Icon(
          //     Icons.arrow_back_ios_new,
          //     color: Colors.white,
          //   ),
          //   onPressed: () {
          //     Navigator.pop(context);
          //   },
          // ),
        ),
      
      
        drawer: NavBar(),
        body: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: restodaata.length > 0
              ? Container(
                  padding: EdgeInsets.all(10),
                  // height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    // border: Border.all(color: Colors.grey),
                    color: Color(0xffF5F5F5),
                  ),
                  child: Container(
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemCount: restodaata.length,
                        // itemCount: 14,
                        itemBuilder: (context, index) {
                          int? bId;
                          String? image;
                          String? title;
                          String? b_description;
                          String? date;
                          String? publisher;
                          String? status;
                          // datecount(blogdata[index].date!);
                          return GestureDetector(
                            onTap: () {},
                            child: Container(
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.symmetric(vertical: 7),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.shade300,
                                      blurRadius: 2.0,
                                      spreadRadius: 2.0,
                                      offset: Offset(
                                        1.0,
                                        1.0,
                                      ),
                                    )
                                  ]),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border:
                                          Border.all(color: Color(0xFFFFFFFF)),
                                      color: Color(0xff000000),
                                      image: DecorationImage(
                                        image: restodaata[index].logo == ""
                                            ? AssetImage('assets/apple.png')
                                                as ImageProvider
                                            : NetworkImage(AppString.urlbanner +
                                                restodaata[index].logo!),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 7),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            restodaata[index].nameEn!,
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: Color(0xff000000),
                                            ),
                                            maxLines: 2,
                                          ),
                                          Text(
                                            restodaata[index].foodTypeEN!,
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.orange,
                                            ),
                                            maxLines: 3,
                                          ),
                                          Text(
                                            restodaata[index].qTime!.toString(),
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.green,
                                            ),
                                            maxLines: 3,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    // mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Image.asset(
                                        "assets/star.png",
                                        height: 20,
                                      ),
                                      Text(
                                        restodaata[index]
                                            .rating!
                                            .toStringAsFixed(1),
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.orange,
                                        ),
                                        maxLines: 3,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                )
              : Visibility(
                  // visible: isloading == false,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 70),
                          child: Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.all(10),
                            height: MediaQuery.of(context).size.height / 3,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              image: DecorationImage(
                                  image: AssetImage("assets/apple.png"),
                                  fit: BoxFit.cover),
                            ),
                          ),
                        ),
                        Text("There is No News",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff262626),
                            )),
                        // Container(
                        //   // padding: EdgeInsets.all(8.0),
                        //   margin: EdgeInsets.fromLTRB(8, 20, 8, 8),
                        //   height: 35,
                        //   decoration: BoxDecoration(
                        //       color: Color(0xff470048),
                        //       borderRadius: BorderRadius.circular(5)),
                        //   child: TextButton(
                        //       onPressed: () {
                        //         Navigator.push(
                        //             context,
                        //             MaterialPageRoute(
                        //                 builder: (context) =>
                        //                     CategoryViewMore()));
                        //       },
                        //       child: Text(
                        //         "Subscribe Now",
                        //         style: TextStyle(
                        //           'Lato',
                        //           fontSize: 14,
                        //           fontWeight: FontWeight.w700,
                        //           color: Color(0xffffffff),
                        //         ),
                        //       )),
                        // )
                      ],
                    ),
                  ),
                ),
        ));
  }
}
