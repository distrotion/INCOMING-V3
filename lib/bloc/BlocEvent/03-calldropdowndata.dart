import 'dart:convert';
import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'dart:convert' as convert;

import 'package:dio/dio.dart';
import '../../MainBody.dart';
import '../../data/Base64Img.dart';
import '../../data/model.dart';

import '../../page/INCOMING/incomingvar.dart';

//-------------------------------------------------

String server = 'http://172.23.10.40:9210/';
String serverflush = 'http://172.23.10.40:1880/flush';

//-------------------------------------------------

abstract class CallDropDownDataS_INCM_Event {}

class CallDropDownDataS_INCM_Pressed_01 extends CallDropDownDataS_INCM_Event {}

class CallDropDownDataS_INCM_Pressed_02 extends CallDropDownDataS_INCM_Event {}

class CallDropDownDataS_INCM_Bloc
    extends Bloc<CallDropDownDataS_INCM_Event, CallDropDownDataS_INCM> {
  /// {@macro counter_bloc}
  CallDropDownDataS_INCM_Bloc() : super(ZeCallDropdowndata_INCM) {
    on<CallDropDownDataS_INCM_Pressed_01>((event, emit) {
      return _PostData01_2(ZeCallDropdowndata_INCM, emit);
    });
    on<CallDropDownDataS_INCM_Pressed_02>((event, emit) {
      return _PostData02_2(ZeCallDropdowndata_INCM, emit);
    });
  }
  Future<void> _PostData01_2(CallDropDownDataS_INCM toAdd,
      Emitter<CallDropDownDataS_INCM> emit) async {
    // final response = await http.post(Uri.parse(server + "getDataIncomming"),
    // body: {
    //   "MATNR": MATNRnow,
    //   "CHARG": CHARGnow
    // },
    //     headers: {
    //       "Accept": "application/json",
    //       "Access-Control_Allow_Origin": "*"
    //     });

    final response = await Dio().post(
      server + "getDataIncomming",
      data: {
        "MATNR": INCOMINGDATArequest.MATNRnow,
        "CHARG": INCOMINGDATArequest.CHARGnow
      },
    );

    var data_input;
    if (response.statusCode == 200) {
      // var databuff = jsonDecode(response.body);
      var databuff = response.data;

      // if (databuff[0]['status'] == 'ok') {
      // data_input = databuff[0]['output'];
      // var dataset1 = data_input[0]['Appearance_for_Rust'] ?? '';
      // var dataset2 = data_input[0]['Appearance_for_Scratch'] ?? '';

      // print(dataset1);

      //   if (ItemNow == 'Appearance_for_Rust') {
      //     if (dataset1 != '') {
      //       // print(dataset1);
      //       if (dataset1['status'].toString() == 'WAIT') {
      //         statusNow = dataset1['status'].toString();
      //         specialAccStatusNow = dataset1['specialAccStatus'].toString();
      //         specialAccCOMMENTNow = dataset1['specialAccCOMMENT'].toString();
      //         specialAccPicNow = dataset1['specialAccPic01'].toString();
      //         confirmPass = false;
      //         wait = true;
      //         PassText = 'PASS';
      //       } else if (dataset1['status'].toString() == 'reject') {
      //         statusNow = dataset1['status'].toString();
      //         specialAccStatusNow = dataset1['specialAccStatus'].toString();
      //         specialAccCOMMENTNow = dataset1['specialAccCOMMENT'].toString();
      //         specialAccPicNow = dataset1['specialAccPic01'].toString();
      //         confirmPass = true;
      //         wait = false;
      //         PassText = 'REJECT';
      //       } else {
      //         statusNow = dataset1['status'].toString();
      //         specialAccStatusNow = dataset1['specialAccStatus'].toString();
      //         specialAccCOMMENTNow = dataset1['specialAccCOMMENT'].toString();
      //         specialAccPicNow = dataset1['specialAccPic01'].toString();
      //         confirmPass = true;
      //         wait = false;
      //         PassText = 'PASS';
      //         // nextItem(contexttable);
      //       }
      //     } else {
      //       statusNow = '';
      //       specialAccStatusNow = '';
      //       specialAccCOMMENTNow = '';
      //       specialAccPicNow = '';
      //       confirmPass = false;
      //       wait = false;
      //       PassText = 'PASS';
      //     }
      //   } else if (ItemNow == 'Appearance_for_Scratch') {
      //     if (dataset2 != '') {
      //       if (dataset2['status'].toString() == 'WAIT') {
      //         statusNow = dataset2['status'].toString();
      //         specialAccStatusNow = dataset2['specialAccStatus'].toString();
      //         specialAccCOMMENTNow = dataset2['specialAccCOMMENT'].toString();
      //         specialAccPicNow = dataset2['specialAccPic01'].toString();
      //         confirmPass = false;
      //         wait = true;
      //         PassText = 'PASS';
      //       } else if (dataset2['status'].toString() == 'reject') {
      //         //statusNow 'reject'
      //         statusNow = dataset2['status'].toString();
      //         specialAccStatusNow = dataset2['specialAccStatus'].toString();
      //         specialAccCOMMENTNow = dataset2['specialAccCOMMENT'].toString();
      //         specialAccPicNow = dataset2['specialAccPic01'].toString();
      //         confirmPass = true;
      //         wait = false;
      //         PassText = 'REJECT';
      //       } else {
      //         statusNow = dataset2['status'].toString();
      //         specialAccStatusNow = dataset2['specialAccStatus'].toString();
      //         specialAccCOMMENTNow = dataset2['specialAccCOMMENT'].toString();
      //         specialAccPicNow = dataset2['specialAccPic01'].toString();
      //         confirmPass = true;
      //         wait = false;
      //         PassText = 'PASS';
      //         // html.window.location.reload();
      //         // Navigator.pop(contexttable);
      //         // onLoadingType02(maintablecontext,
      //         //     maintablecontext.read<DataSetBloc>().add(GetDataPressed()));
      //       }
      //     } else {
      //       statusNow = '';
      //       specialAccStatusNow = '';
      //       specialAccCOMMENTNow = '';
      //       specialAccPicNow = '';
      //       confirmPass = false;
      //       wait = false;
      //       PassText = 'PASS';
      //     }
      //   } else {
      //     statusNow = '';
      //     specialAccStatusNow = '';
      //     specialAccCOMMENTNow = '';
      //     specialAccPicNow = '';
      //     confirmPass = false;
      //     wait = false;
      //     PassText = 'PASS';
      //   }
      // } else {
      //   statusNow = '';
      //   specialAccStatusNow = '';
      //   specialAccCOMMENTNow = '';
      //   specialAccPicNow = '';
      //   confirmPass = false;
      //   wait = false;
      //   PassText = 'PASS';
      // }
    } else {
      data_input = '';
      print("where is my server");
    }

    // yield state;
    // state = ZeCallDropdowndata_INCM;
    emit(ZeCallDropdowndata_INCM);
  }

  Future<void> _PostData02_2(CallDropDownDataS_INCM toAdd,
      Emitter<CallDropDownDataS_INCM> emit) async {
    Object bodyout = {};
    // if (ItemNow == 'Appearance_for_Rust') {
    //   bodyout = {
    //     "MATNR": MATNRnow,
    //     "CHARG": CHARGnow,
    //     "MBLNR": MBLNRnow,
    //     "BWART": BWARTnow,
    //     "MENGE": MENGEnow,
    //     "MEINS": MEINSnow,
    //     "MAT_FG": MAT_FGnow,
    //     "KUNNR": KUNNRnow,
    //     "SORTL": SORTLnow,
    //     "NAME1": NAME1now,
    //     "CUST_LOT": CUST_LOTnow,
    //     "PART_NM": PART_NMnow,
    //     "PART_NO": PART_NOnow,
    //     "PROCESS": PROCESSnow,
    //     "OLDMAT_CP": OLDMAT_CPnow,
    //     "STATUS": STATUSnow,
    //     "UserNO": UserNO,

    //     "ITEM": "Appearance_for_Rust",
    //     "ITEMstatus": ITEMstatusNow,
    //     "ITEMspecialAccStatus": ITEMspecialAccStatusNow,
    //     "ITEMspecialAccCOMMENT": ITEMspecialAccCOMMENTNow,
    //     "ITEMspecialAccPic01": base64pic01,
    //     "ITEMspecialAccPic02": base64pic02,
    //     "ITEMspecialAccPic03": base64pic03,
    //     "ITEMspecialAccPic04": base64pic04,
    //     "ITEMspecialAccPic05": base64pic05,
    //     "ITEMsPiecesSelected": PiecesDropdownSelected,

    //   };
    // } else if (ItemNow == 'Appearance_for_Scratch') {
    //   bodyout = {
    //     "MATNR": MATNRnow,
    //     "CHARG": CHARGnow,
    //     "MBLNR": MBLNRnow,
    //     "BWART": BWARTnow,
    //     "MENGE": MENGEnow,
    //     "MEINS": MEINSnow,
    //     "MAT_FG": MAT_FGnow,
    //     "KUNNR": KUNNRnow,
    //     "SORTL": SORTLnow,
    //     "NAME1": NAME1now,
    //     "CUST_LOT": CUST_LOTnow,
    //     "PART_NM": PART_NMnow,
    //     "PART_NO": PART_NOnow,
    //     "PROCESS": PROCESSnow,
    //     "OLDMAT_CP": OLDMAT_CPnow,
    //     "STATUS": STATUSnow,
    //     "UserNO": UserNO,

    //     "ITEM": "Appearance_for_Scratch",
    //     "ITEMstatus": ITEMstatusNow,
    //     "ITEMspecialAccStatus": ITEMspecialAccStatusNow,
    //     "ITEMspecialAccCOMMENT": ITEMspecialAccCOMMENTNow,
    //     // "ITEMspecialAccPic": ITEMspecialAccPicNow,
    //     "ITEMspecialAccPic01": base64pic01,
    //     "ITEMspecialAccPic02": base64pic02,
    //     "ITEMspecialAccPic03": base64pic03,
    //     "ITEMspecialAccPic04": base64pic04,
    //     "ITEMspecialAccPic05": base64pic05,
    //     "ITEMsPiecesSelected": PiecesDropdownSelected,

    //     //base64pic

    //     // "Appearance_for_Scratch": {
    //     //   "status": '',
    //     //   "specialAccStatus": '',
    //     //   "specialAccCOMMENT": '',
    //     //   "specialAccPic": '',
    //     // }
    //   };
    // } else {
    //   bodyout = {
    //     "MATNR": MATNRnow,
    //     "CHARG": CHARGnow,
    //     "MBLNR": MBLNRnow,
    //     "BWART": BWARTnow,
    //     "MENGE": MENGEnow,
    //     "MEINS": MEINSnow,
    //     "MAT_FG": MAT_FGnow,
    //     "KUNNR": KUNNRnow,
    //     "SORTL": SORTLnow,
    //     "NAME1": NAME1now,
    //     "CUST_LOT": CUST_LOTnow,
    //     "PART_NM": PART_NMnow,
    //     "PART_NO": PART_NOnow,
    //     "PROCESS": PROCESSnow,
    //     "OLDMAT_CP": OLDMAT_CPnow,
    //     "STATUS": STATUSnow,
    //     "ITEM": "",
    //     "UserNO": UserNO,
    //   };
    // }

    // // final response = await http.post(Uri.parse(server + "updateDataIncomming"),
    // //     body: bodyout,
    // //     headers: {
    // //       "Accept": "application/json",
    // //       "Access-Control_Allow_Origin": "*"
    // //     }).timeout(const Duration(seconds: 5));

    // final response =
    //     await Dio().post(server + "updateDataIncomming", data: bodyout);

    // var data_input;
    // if (response.statusCode == 200) {
    //   // if (response.data[0]['status'] == 'ok') {
    //   // } else {}

    // } else {
    //   data_input = '';
    //   print("where is my server");
    // }
    // // base64pic = logo;
    // BlocProvider.of<BlocPageRebuild>(contexttable).rebuildPage();

    emit(ZeCallDropdowndata_INCM);
  }
}
