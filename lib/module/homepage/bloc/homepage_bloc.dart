import 'dart:async';
import 'dart:developer';

import '../../../base/base_response.dart';
import '../../../bloc/bloc.dart';
import '../model/homepage_model.dart';
import '../repository/homepage_repo.dart';

class HomePageBloc extends Bloc {
  StreamController<Response<RestaurantModel>> restaurantcontroller =
      StreamController<Response<RestaurantModel>>();

  Stream<Response<RestaurantModel>> get restaurantstream =>
      restaurantcontroller.stream;
  StreamSink<Response<RestaurantModel>> get restaurantsink =>
      restaurantcontroller.sink;

  final allcourserepo = HomepgeRepo();

  void allcoursesget(body) async {
    restaurantsink.add(Response.loading("Loading"));
    try {
      final client = await allcourserepo.restraurantmethod(body);
      restaurantsink.add(Response.completed(client));
    } catch (e) {
      restaurantsink.add(Response.error(e.toString()));
      log("Homepage: ${e.toString()}");
    }
  }

  @override
  void dispose() {
    restaurantcontroller.close();
  }
}
