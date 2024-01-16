import '../../../base/api_constants.dart';
import '../../../base/base_httpcall.dart';
import '../model/registration_model.dart';

class RegistrationRepository {
  Future<RegistrationModel> registeredrepo(dynamic body) async {
    BaseHTTP baseHTTP = BaseHTTP();
    final response =
        await baseHTTP.postWithURLEncoded(ApiConstants.registration, body);

    // log("login rsp= ${response.toString()}" as num);
    return RegistrationModel.fromJson(response);
  }
}
