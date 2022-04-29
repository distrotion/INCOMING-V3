// import 'dart:convert';
// import 'dart:html' as html;

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import 'dart:convert' as convert;

// import 'package:dio/dio.dart';
// import '../../MainBody.dart';
// import '../../data/Base64Img.dart';
// import '../../data/model.dart';

// import '../../page/INCOMING/incomingvar.dart';

// //-------------------------------------------------

// // String server = 'http://172.23.10.40:9210/';
// String server = 'http://172.23.10.32:14100/';

// //-------------------------------------------------

// abstract class CallDropDownDataS_INCM_Event {}

// class CallDropDownDataS_INCM_Pressed_01 extends CallDropDownDataS_INCM_Event {}

// class CallDropDownDataS_INCM_Pressed_02 extends CallDropDownDataS_INCM_Event {}

// class CallDropDownDataS_INCM_Bloc
//     extends Bloc<CallDropDownDataS_INCM_Event, CallDropDownDataS_INCM> {
//   /// {@macro counter_bloc}
//   CallDropDownDataS_INCM_Bloc() : super(ZeCallDropdowndata_INCM) {
//     on<CallDropDownDataS_INCM_Pressed_01>((event, emit) {
//       return _PostData01_2(ZeCallDropdowndata_INCM, emit);
//     });
//     on<CallDropDownDataS_INCM_Pressed_02>((event, emit) {
//       return _PostData02_2(ZeCallDropdowndata_INCM, emit);
//     });
//   }
//   Future<void> _PostData01_2(CallDropDownDataS_INCM toAdd,
//       Emitter<CallDropDownDataS_INCM> emit) async {
//     final response = await Dio().post(
//       server + "getDataIncomming",
//       data: {
//         "MATNR": INCOMINGDATArequest.MATNRnow,
//         "CHARG": INCOMINGDATArequest.CHARGnow
//       },
//     );

//     var data_input;
//     if (response.statusCode == 200) {
//       var databuff = response.data;
//     } else {
//       data_input = '';
//       print("where is my server");
//     }

//     // yield state;
//     // state = ZeCallDropdowndata_INCM;
//     emit(CallDropDownDataS_INCM(
//       data01: '',
//       data02: '',
//       data03: '',
//       data04: '',
//       data05: '',
//       data06: '',
//       data07: '',
//       data08: '',
//       data09: '',
//       data10: '',
//     ));
//   }

//   Future<void> _PostData02_2(CallDropDownDataS_INCM toAdd,
//       Emitter<CallDropDownDataS_INCM> emit) async {
//     emit(CallDropDownDataS_INCM(
//       data01: '',
//       data02: '',
//       data03: '',
//       data04: '',
//       data05: '',
//       data06: '',
//       data07: '',
//       data08: '',
//       data09: '',
//       data10: '',
//     ));
//   }
// }
