import 'package:flutter/material.dart';

import '../../../base/api_constants.dart';

import '../../../base/base_httpcall.dart';
import '../model/profile_model.dart';

class ProfileRepo {
  BaseHTTP baseHTTP = BaseHTTP();
  Future<ProfileModel> profilemethod(Map<String, dynamic> parameter) async {
    final response =
        await baseHTTP.getwithparameters(ApiConstants.profile_url, parameter);
    return ProfileModel.fromJson(response);
  }
}
