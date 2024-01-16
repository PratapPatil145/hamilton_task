import 'package:flutter/material.dart';

import '../../../base/api_constants.dart';

import '../../../base/base_httpcall.dart';
import '../model/homepage_model.dart';

class HomepgeRepo {
  BaseHTTP baseHTTP = BaseHTTP();
  Future<RestaurantModel> restraurantmethod(
      Map<String, dynamic> parameter) async {
    final response =
        await baseHTTP.getwithparameters(ApiConstants.getResto_url, parameter);
    return RestaurantModel.fromJson(response);
  }
}
