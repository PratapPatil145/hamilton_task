import '../main.dart';

class SharedPrefrence {
  static const FCM_TOKEN = "fcm_token";
  static const is_login = 'login';
  static const userid = 'id';

  static const userName = 'UserName';

  static const email = 'Wass@gmail.com';

  static const profile_image = "pratap_image";
  static const rcode = "p";
  static const rs = "400";
  static const ischeck = "";
  static const walletcheck = "Pratap";

  static const userToken = "usertoken";
  static const usermobilenumber = "7721028071";

  static final SharedPrefrence _singleton = new SharedPrefrence._internal();

  factory SharedPrefrence() {
    return _singleton;
  }

  SharedPrefrence._internal();

  deleteAll() async {
    await sharedPrefrence.clear();
  }

  String? getFcmToken() {
    return sharedPrefrence.getString(FCM_TOKEN);
  }

  setFcmToken(String name) {
    sharedPrefrence.setString(FCM_TOKEN, name);
  }

  String? getUserToken() {
    return sharedPrefrence.getString(userToken);
  }

  setUserToken(String name) {
    sharedPrefrence.setString(userToken, name);
  }

  String? getUserIdfor() {
    return sharedPrefrence.getString(userid);
  }

  setUserIdfor(String name) {
    sharedPrefrence.setString(userid, name);
  }

  String? getLogin() {
    return sharedPrefrence.getString(is_login);
  }

  setLogin(String name) {
    sharedPrefrence.setString(is_login, name);
  }

  String? getUserName() {
    return sharedPrefrence.getString(userName);
  }

  setUserName(String name) {
    sharedPrefrence.setString(userName, name);
  }

  String? getEmail() {
    return sharedPrefrence.getString(email);
  }

  setEmail(String name) {
    sharedPrefrence.setString(email, name);
  }

  String? getprofileimage() {
    return sharedPrefrence.getString(profile_image);
  }

  setprofleimage(String name) {
    sharedPrefrence.setString(profile_image, name);
  }

  String? getReferCode() {
    return sharedPrefrence.getString(rcode);
  }

  setReferCode(String name) {
    sharedPrefrence.setString(rcode, name);
  }

  String? getwalletRS() {
    return sharedPrefrence.getString(rs);
  }

  setwaalletRS(String name) {
    sharedPrefrence.setString(rs, name);
  }

  String? getischeckwelcomebanner() {
    return sharedPrefrence.getString(ischeck);
  }

  setcheckwelcomebanner(String name) {
    sharedPrefrence.setString(ischeck, name);
  }

  String? getischeckWalletbanner() {
    return sharedPrefrence.getString(walletcheck);
  }

  setcheckWalletbanner(String name) {
    sharedPrefrence.setString(walletcheck, name);
  }

  String? getMobileNumber() {
    return sharedPrefrence.getString(usermobilenumber);
  }

  setMobileNumber(String name) {
    sharedPrefrence.setString(usermobilenumber, name);
  }
}
