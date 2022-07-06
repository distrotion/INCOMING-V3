import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

import '../../data/global.dart';
import '../../page/INCOMING/mainbody.dart';
import '../../widget/common/Loading.dart';

//-------------------------------------------------
String serverflush = Gflashserver;

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
    FreeLoading(maintablecontext);
    final response = await Dio().post(
      serverflush,
      data: {"Qurey": "flush"},
    );

    print("FULSH");
    Navigator.pop(maintablecontext);

    emit(0);
  }
}
