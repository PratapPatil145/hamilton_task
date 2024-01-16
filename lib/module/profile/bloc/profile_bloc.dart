import 'dart:async';
import 'dart:developer';

import '../../../base/base_response.dart';
import '../../../bloc/bloc.dart';
import '../model/profile_model.dart';
import '../repository/profile_repo.dart';

class ProfileBloc extends Bloc {
  StreamController<Response<ProfileModel>> profilecontroller =
      StreamController<Response<ProfileModel>>();

  Stream<Response<ProfileModel>> get profilestream => profilecontroller.stream;
  StreamSink<Response<ProfileModel>> get profilesink => profilecontroller.sink;

  final allcourserepo = ProfileRepo();

  void allcoursesget(body) async {
    profilesink.add(Response.loading("Loading"));
    try {
      final client = await allcourserepo.profilemethod(body);
      profilesink.add(Response.completed(client));
    } catch (e) {
      profilesink.add(Response.error(e.toString()));
      log("profile: ${e.toString()}");
    }
  }

  @override
  void dispose() {
    profilecontroller.close();
  }
}
