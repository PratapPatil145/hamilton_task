import '../../../base/api_constants.dart';
import '../../../base/base_httpcall.dart';
import '../model/login_model.dart';

class LoginRepository {
  Future<LoginModel> loginrepo(dynamic body) async {
    BaseHTTP baseHTTP = BaseHTTP();
    final response =
        await baseHTTP.postWithURLEncoded(ApiConstants.login_url, body);

    // log("login rsp= ${response.toString()}" as num);
    return LoginModel.fromJson(response);
  }
}
