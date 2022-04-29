import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

//-------------------------------------------------
String serverflush = 'http://172.23.10.40:1880/flush';

abstract class FLUSHsap_Event {}

class FLUSHsap_Pressed_01 extends FLUSHsap_Event {}

class FLUSHsap_Pressed_02 extends FLUSHsap_Event {}

class FLUSHsap_Bloc extends Bloc<FLUSHsap_Event, int> {
  FLUSHsap_Bloc() : super(0) {
    on<FLUSHsap_Pressed_01>((event, emit) {
      return _flushdata(0, emit);
    });
  }
  Future<void> _flushdata(int toAdd, Emitter<int> emit) async {
    final response = await Dio().post(
      serverflush,
      data: {"Qurey": "flush"},
    );

    emit(0);
  }
}
