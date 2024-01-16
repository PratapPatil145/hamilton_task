import 'dart:async';

import '../bloc/bloc.dart';
import 'base_response.dart';

class BaseBloc extends Bloc {
  StreamController<Response<dynamic>> streamController =
      StreamController<Response<dynamic>>();
  Stream<Response<dynamic>> get stream => streamController.stream;
  StreamSink<Response<dynamic>> get sink => streamController.sink;

  StreamController<Response<dynamic>> streamController1 =
      StreamController<Response<dynamic>>();
  Stream<Response<dynamic>> get stream1 => streamController1.stream;
  StreamSink<Response<dynamic>> get sink1 => streamController1.sink;

  void connection(dynamic map) async {
    sink.add(Response.completed(map));
    // sink.add(map);
  }

  void connection1(dynamic map) async {
    sink1.add(Response.completed(map));
    // sink.add(map);
  }

  @override
  void dispose() {
    streamController.close();
    streamController1.close();
  }
}
