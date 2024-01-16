import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../api/api_calls.dart';
import '../../../base/base_response.dart';
import '../../../base/const_string.dart';
import '../profile/ui/profile.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              "Pratap Awachar",
              style: TextStyle(color: Colors.black),
            ),
            accountEmail: Text(
              "awacharpratap210@gmail.com",
              style: TextStyle(color: Colors.black),
            ),
            currentAccountPicture: CircleAvatar(
              child: Stack(
                children: [
                  CircleAvatar(
                      minRadius: 80,
                      maxRadius: 80,
                      backgroundImage: AssetImage("assets/twitter.png")),
                  // ClipOval(
                  //   child: Image.asset(
                  //     'assets/bank/user_profile_male.png',
                  //   ),
                  // ),
                  Positioned(
                      right: -15,
                      bottom: -10,
                      child: IconButton(
                          onPressed: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) =>
                            //             UpdateProfileScreen()));
                          },
                          icon: Icon(
                            Icons.edit,
                            color: Colors.white,
                          )))
                ],
              ),
            ),
            decoration: BoxDecoration(
                // color: Color(0xffD421D8),

                image: DecorationImage(
                    image: AssetImage('assets/bank/navigation_backImage.png'),
                    fit: BoxFit.cover)),
          ),

          SizedBox(),
          ListTile(
            leading: Icon(
              Icons.person_2_outlined,
              color: Colors.blue,
              size: 25,
            ),
            title: Text('Profile'),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()
                    //  MyFav()
                    ),
              )
            },
          ),
          SizedBox(),
          ListTile(
            leading: Icon(
              Icons.favorite_border_outlined,
              color: Colors.blue,
              size: 25,
            ),
            title: Text('My Favourite List'),
            onTap: () => {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => MyFavoriteListScreen()),
              // )
            },
          ),

          ListTile(
            leading: Icon(
              Icons.list,
              color: Colors.blue,
              size: 25,
            ),
            title: Text('Course wise Document'),
            onTap: () => {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => SubscribeCourseScreen()
              //       //SearchNotFound()
              //       ),
              // )
            },
          ),

          // ListTile(
          //   leading: Icon(
          //     Icons.my_library_books,
          //     color: Colors.blue,
          //     size: 25,
          //   ),
          //   title: Text('Exam'),
          //   onTap: () => {
          //     Navigator.push(context,
          //         MaterialPageRoute(builder: (context) => CourseForExam()))
          //   },
          // ),

          // ListTile(
          //   leading: Icon(
          //     Icons.food_bank,
          //     color: Colors.blue,
          //     size: 25,
          //   ),
          //   title: Text('Wallet'),
          //   onTap: () => {
          //     Navigator.push(context,
          //         MaterialPageRoute(builder: (context) => BankDetailsPage()))
          //   },
          // ),
          ListTile(
            leading: Icon(
              Icons.wallet_giftcard,
              color: Colors.blue,
              size: 25,
            ),
            title: Text('Withdraw History'),
            onTap: () => {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => RequestWithdrawlUserScreen()))
            },
          ),

          ListTile(
            leading: Icon(
              Icons.payment_outlined,
              color: Colors.blue,
              size: 25,
            ),
            title: Text('Subscription/ Payment'),
            onTap: () => {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => AllCourseScreen()))
            },
          ),

          ListTile(
            leading: Icon(
              Icons.currency_exchange_sharp,
              color: Colors.blue,
              size: 25,
            ),
            title: Text('Payment History'),
            onTap: () => {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => UserPaymentHistoryScreen()))
            },
          ),

          ListTile(
            leading: Icon(
              Icons.notification_add_outlined,
              color: Colors.blue,
              size: 25,
            ),
            title: Text('Notification'),
            onTap: () => {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => NotificationScreen()
              //       //SearchNotFound()
              //       ),
              // )
            },
          ),

          ListTile(
            leading: Icon(
              Icons.read_more_outlined,
              color: Colors.blue,
              size: 25,
            ),
            title: Text('Terms & Conditions'),
            onTap: () => {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => TermAndCondition()))
            },
          ),

          ListTile(
            leading: Icon(
              Icons.privacy_tip_sharp,
              color: Colors.blue,
              size: 25,
            ),
            title: Text('Privacy & Policy'),
            onTap: () => {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => PrivacyScreen()))
            },
          ),
          ListTile(
            leading: Icon(
              Icons.currency_bitcoin,
              color: Colors.blue,
              size: 25,
            ),
            title: Text('Return & Refund Policy'),
            onTap: () => {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => ReturnAndRefundPrivacy()))
            },
          ),
          // ListTile(
          //   leading: Icon(
          //     Icons.currency_rupee_rounded,
          //     color: Colors.blue,
          //     size: 25,
          //   ),
          //   title: Text('Payment Policy'),
          //   onTap: () => {
          //     Navigator.push(context,
          //         MaterialPageRoute(builder: (context) => PaymentPolicy()))
          //   },
          // ),

          ListTile(
            leading: Icon(
              Icons.info,
              color: Colors.blue,
              size: 25,
            ),
            title: Text('About Us'),
            onTap: () => {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => AboutUsscreen()))
            },
          ),

          ListTile(
            leading: Icon(
              Icons.call,
              color: Colors.blue,
              size: 25,
            ),
            title: Text('Contact Us'),
            onTap: () => {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => ContactUsPage()))
            },
          ),

          ListTile(
            leading: Icon(
              Icons.feedback,
              color: Colors.blue,
              size: 25,
            ),
            title: Text('Feedback'),
            onTap: () => {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => FeedBackScreen()))
            },
          ),

          ListTile(
            leading: Icon(
              Icons.logout_outlined,
              color: Colors.blue,
              size: 25,
            ),
            title: Text('Logout'),
            onTap: () => {
              showDialog(
                context: context,
                builder: (BuildContext context) => LogoutDialog(context),
              ),
              // welcomeDialog(context),
              // showDialogBox2(),
            },
          ),
        ],
      ),
    );
  }

  // showDialogBox2() {
  //   showDialog(
  //       barrierDismissible: false,
  //       context: context,
  //       barrierColor: Colors.white,
  //       builder: (context) => CupertinoAlertDialog(
  //             title: const Text(
  //               "Do you want to Logout ?",
  //               style: TextStyle(color: Colors.black),
  //             ),
  //             content: Container(
  //               width: double.infinity,
  //               child: Padding(
  //                 padding: const EdgeInsets.only(top: 40),
  //                 child: Row(
  //                   mainAxisAlignment: MainAxisAlignment.spaceAround,
  //                   children: [
  //                     Container(
  //                       decoration: BoxDecoration(
  //                           color: Color(0xff470048),
  //                           borderRadius: BorderRadius.circular(10)),
  //                       child: TextButton(
  //                         onPressed: () {
  //                           logoutmethod();
  //                         },
  //                         child: Text(
  //                           "Yes",
  //                           style: TextStyle(color: Colors.white),
  //                         ),
  //                       ),
  //                     ),
  //                     Container(
  //                       decoration: BoxDecoration(
  //                           color: Color(0xff470048),
  //                           borderRadius: BorderRadius.circular(10)),
  //                       child: TextButton(
  //                         onPressed: () {
  //                           Navigator.pop(context);
  //                         },
  //                         child: Text(
  //                           "No",
  //                           style: TextStyle(color: Colors.white),
  //                         ),
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ),
  //           ));
  // }

  Widget LogoutDialog(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      content: Container(
        // color: Colors.white,
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: 30),
                child: Text(
                  "Do you want to Logout ?",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(top: 80),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Color(0xff470048),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "Yes",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Color(0xff470048),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "No",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
