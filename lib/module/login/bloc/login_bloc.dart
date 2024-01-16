import 'dart:async';
import 'dart:developer';

import 'package:halimton_task/module/login/repository/login_repo.dart';

import '../../../base/base_response.dart';
import '../../../bloc/bloc.dart';
import '../model/login_model.dart';

class LoginBloc extends Bloc {
  StreamController<Response<LoginModel>> loginController =
      StreamController<Response<LoginModel>>();
  Stream<Response<LoginModel>> get loginstream => loginController.stream;
  StreamSink<Response<LoginModel>> get loginsink => loginController.sink;

  final repo = LoginRepository();

  @override
  void dispose() {
    // TODO: implement dispose
    loginController.close();
  }

  void loginmethod(dynamic map) async {
    loginsink.add(Response.loading("Loading"));
    try {
      final client = await repo.loginrepo(map);
      loginsink.add(Response.completed(client));
    } catch (e) {
      loginsink.add(Response.error(e.toString()));
      log("Login: ${e.toString()}");
    }
  }
}
