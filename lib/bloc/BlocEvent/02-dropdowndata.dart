// import 'dart:convert';
// import 'dart:html' as html;

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import 'dart:convert' as convert;

// import 'package:dio/dio.dart';

// import '../../MainBody.dart';
// import '../../data/Base64Img.dart';
// import '../../data/model.dart';

// //-------------------------------------------------

// // String server = 'http://172.23.10.40:9210/';
// String server = 'http://172.23.10.32:14100/';

// abstract class DropDownData_INCM_Event {}

// class DropDownData_INCM_Pressed extends DropDownData_INCM_Event {}

// class DropDownData_INCM_Bloc
//     extends Bloc<DropDownData_INCM_Event, DropDownData_INCM> {
//   /// {@macro counter_bloc}
//   DropDownData_INCM_Bloc() : super(zeroDropDownData_MR) {
//     on<DropDownData_INCM_Pressed>((event, emit) {
//       return _PostData01_1(zeroDropDownData_MR, emit);
//     });
//   }
//   Future<void> _PostData01_1(
//       DropDownData_INCM toAdd, Emitter<DropDownData_INCM> emit) async {
//     DropDownData_INCM stateoutput = zeroDropDownData_MR;

//     final response = await Dio().post(
//       server + "tblSAPGoodReceive_get",
//       data: {"MATNR": "", "CHARG": ""},
//     );

//     var data_input;
//     if (response.statusCode == 200) {
//       // var databuff = jsonDecode(response.body);
//       var databuff = response.data;
//       data_input = databuff[0]['output'];
//     } else {
//       data_input = '';
//       print("where is my server");
//     }

//     if (data_input != '') {
//       stateoutput.list01.clear();
//       stateoutput.list02.clear();
//       stateoutput.list03.clear();
//       stateoutput.list04.clear();
//       stateoutput.list05.clear();
//       stateoutput.list06.clear();
//       stateoutput.list07.clear();
//       stateoutput.list08.clear();
//       stateoutput.list09.clear();
//       stateoutput.list10.clear();

//       for (var i = 0; i < data_input['list01'].length; i++) {
//         stateoutput.list01.add(data_input['list01'][i].toString());
//       }

//       stateoutput.list02 = [""];
//       stateoutput.list03 = [""];
//       stateoutput.list04 = [""];
//       stateoutput.list05 = [""];
//       stateoutput.list06 = [""];
//       stateoutput.list07 = [""];
//       stateoutput.list08 = [""];
//       stateoutput.list09 = [""];
//       stateoutput.list10 = [""];
//       stateoutput.list08 = [""];
//       stateoutput.list09 = [""];
//       stateoutput.list10 = [""];
//     } else {
//       stateoutput.list01 = [""];
//       stateoutput.list02 = [""];
//       stateoutput.list03 = [""];
//       stateoutput.list04 = [""];
//       stateoutput.list05 = [""];
//       stateoutput.list06 = [""];
//       stateoutput.list07 = [""];
//       stateoutput.list08 = [""];
//       stateoutput.list09 = [""];
//       stateoutput.list10 = [""];
//     }

//     //stateoutput = ["","Appearance_for_Rust","Appearance_for_Scratch"]

//     emit(stateoutput);
//   }
// }
