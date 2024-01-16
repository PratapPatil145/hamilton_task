import 'dart:async';
import 'dart:developer';

import '../../../base/base_response.dart';
import '../../../bloc/bloc.dart';
import '../model/registration_model.dart';
import '../repository/regisgration _repo.dart';

class RegistrationBloc extends Bloc {
  StreamController<Response<RegistrationModel>> registerController =
      StreamController<Response<RegistrationModel>>();
  Stream<Response<RegistrationModel>> get registerstream =>
      registerController.stream;
  StreamSink<Response<RegistrationModel>> get registersink =>
      registerController.sink;

  final repo = RegistrationRepository();

  @override
  void dispose() {
    // TODO: implement dispose
    registerController.close();
  }

  void Addbankmethod(dynamic map) async {
    registersink.add(Response.loading("Loading"));
    try {
      final client = await repo.registeredrepo(map);
      registersink.add(Response.completed(client));
    } catch (e) {
      registersink.add(Response.error(e.toString()));
      log("Add Bank: ${e.toString()}");
    }
  }
}
