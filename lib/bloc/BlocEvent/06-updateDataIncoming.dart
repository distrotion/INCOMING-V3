// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:dio/dio.dart';
// import '../../data/model.dart';
// import '../../page/INCOMING/incomingvar.dart';

// //-------------------------------------------------

// // String server = 'http://localhost:14100/';
// String server = 'http://172.23.10.32:14100/';

// abstract class updateINCM_Event {}

// class updateINCM_GOOD extends updateINCM_Event {}

// class updateINCM_WAIT extends updateINCM_Event {}

// class updateINCM_GOOD_NA extends updateINCM_Event {}

// class updateINCM_NOGOOD extends updateINCM_Event {}

// class updateINCM_Bloc extends Bloc<updateINCM_Event, List<INCOMINGmaster>> {
//   updateINCM_Bloc() : super([INCOMINGmaster(ITEMs: '')]) {
//     on<updateINCM_GOOD>((event, emit) {
//       return _updateINCM_GOOD([], emit);
//     });
//     on<updateINCM_WAIT>((event, emit) {
//       return _updateINCM_WAIT([], emit);
//     });
//     on<updateINCM_GOOD_NA>((event, emit) {
//       return _updateINCM_GOOD_NA([], emit);
//     });
//     on<updateINCM_NOGOOD>((event, emit) {
//       return _updateINCM_NOGOOD_NA([], emit);
//     });
//   }

//   Future<void> _updateINCM_GOOD(
//       List<INCOMINGmaster> toAdd, Emitter<List<INCOMINGmaster>> emit) async {
//     //--------------------------------------------------
//     Object bodyout = {
//       "MATNR": INCOMINGDATAoutput.MATNRnow,
//       "CHARG": INCOMINGDATAoutput.CHARGnow,
//       "MBLNR": INCOMINGDATAoutput.MBLNRnow,
//       "BWART": INCOMINGDATAoutput.BWARTnow,
//       "MENGE": INCOMINGDATAoutput.MENGEnow,
//       "MEINS": INCOMINGDATAoutput.MEINSnow,
//       "MAT_FG": INCOMINGDATAoutput.MAT_FGnow,
//       "KUNNR": INCOMINGDATAoutput.KUNNRnow,
//       "SORTL": INCOMINGDATAoutput.SORTLnow,
//       "NAME1": INCOMINGDATAoutput.NAME1now,
//       "CUST_LOT": INCOMINGDATAoutput.CUST_LOTnow,
//       "PART_NM": INCOMINGDATAoutput.PART_NMnow,
//       "PART_NO": INCOMINGDATAoutput.PART_NOnow,
//       "PROCESS": INCOMINGDATAoutput.PROCESSnow,
//       "OLDMAT_CP": INCOMINGDATAoutput.OLDMAT_CPnow,
//       "STATUS": INCOMINGDATAoutput.STATUSnow,
//       "UserNO": INCOMINGDATAoutput.UserNO,
//       //
//       "ITEM": INCOMINGDATAactive.ItemName,
//       "ITEMstatus": "GOOD",
//       "ITEMspecialAccStatus": '',
//       "ITEMspecialAccCOMMENT": '',
//       "ITEMspecialAccPic": '',
//       "ITEMspecialAccPic01": '',
//       "ITEMspecialAccPic02": '',
//       "ITEMspecialAccPic03": '',
//       "ITEMspecialAccPic04": '',
//       "ITEMspecialAccPic05": '',
//       "ITEMsPiecesSelected": '',
//     };

//     //--------------------------------------------------
//     final response = await Dio().post(
//       server + "updateDataIncommingGOOD",
//       data: bodyout,
//     );

//     List<INCOMINGmaster> output = [];

//     // if (response.statusCode == 200) {
//     //   var databuff = response.data;
//     // } else {
//     //   //
//     // }

//     emit(output);
//   }

//   Future<void> _updateINCM_WAIT(
//       List<INCOMINGmaster> toAdd, Emitter<List<INCOMINGmaster>> emit) async {
//     //--------------------------------------------------
//     Object bodyout = {
//       "MATNR": INCOMINGDATAoutput.MATNRnow,
//       "CHARG": INCOMINGDATAoutput.CHARGnow,
//       "MBLNR": INCOMINGDATAoutput.MBLNRnow,
//       "BWART": INCOMINGDATAoutput.BWARTnow,
//       "MENGE": INCOMINGDATAoutput.MENGEnow,
//       "MEINS": INCOMINGDATAoutput.MEINSnow,
//       "MAT_FG": INCOMINGDATAoutput.MAT_FGnow,
//       "KUNNR": INCOMINGDATAoutput.KUNNRnow,
//       "SORTL": INCOMINGDATAoutput.SORTLnow,
//       "NAME1": INCOMINGDATAoutput.NAME1now,
//       "CUST_LOT": INCOMINGDATAoutput.CUST_LOTnow,
//       "PART_NM": INCOMINGDATAoutput.PART_NMnow,
//       "PART_NO": INCOMINGDATAoutput.PART_NOnow,
//       "PROCESS": INCOMINGDATAoutput.PROCESSnow,
//       "OLDMAT_CP": INCOMINGDATAoutput.OLDMAT_CPnow,
//       "STATUS": INCOMINGDATAoutput.STATUSnow,
//       "UserNO": INCOMINGDATAoutput.UserNO,
//       //
//       "ITEM": INCOMINGDATAactive.ItemName,
//       "ITEMstatus": "WAIT",
//       "ITEMspecialAccStatus": 'waitting for specialaccept',
//       "ITEMspecialAccCOMMENT": NOGOODcon.SpacialAccText,
//       "ITEMspecialAccPic": '',
//       "ITEMspecialAccPic01": NOGOODcon.base64pic01,
//       "ITEMspecialAccPic02": NOGOODcon.base64pic02,
//       "ITEMspecialAccPic03": NOGOODcon.base64pic03,
//       "ITEMspecialAccPic04": NOGOODcon.base64pic04,
//       "ITEMspecialAccPic05": NOGOODcon.base64pic05,
//       "ITEMsPiecesSelected": NOGOODcon.PiecesDropdownSelected,
//     };

//     //--------------------------------------------------
//     // final response = await Dio().post(
//     //   server + "updateDataIncomming",
//     //   data: bodyout,
//     // );

//     List<INCOMINGmaster> output = [];

//     // if (response.statusCode == 200) {
//     //   var databuff = response.data;
//     // } else {
//     //   //
//     // }

//     emit(output);
//   }

//   Future<void> _updateINCM_GOOD_NA(
//       List<INCOMINGmaster> toAdd, Emitter<List<INCOMINGmaster>> emit) async {
//     //--------------------------------------------------
//     Object bodyout = {
//       "MATNR": INCOMINGDATAoutput.MATNRnow,
//       "CHARG": INCOMINGDATAoutput.CHARGnow,
//       "MBLNR": INCOMINGDATAoutput.MBLNRnow,
//       "BWART": INCOMINGDATAoutput.BWARTnow,
//       "MENGE": INCOMINGDATAoutput.MENGEnow,
//       "MEINS": INCOMINGDATAoutput.MEINSnow,
//       "MAT_FG": INCOMINGDATAoutput.MAT_FGnow,
//       "KUNNR": INCOMINGDATAoutput.KUNNRnow,
//       "SORTL": INCOMINGDATAoutput.SORTLnow,
//       "NAME1": INCOMINGDATAoutput.NAME1now,
//       "CUST_LOT": INCOMINGDATAoutput.CUST_LOTnow,
//       "PART_NM": INCOMINGDATAoutput.PART_NMnow,
//       "PART_NO": INCOMINGDATAoutput.PART_NOnow,
//       "PROCESS": INCOMINGDATAoutput.PROCESSnow,
//       "OLDMAT_CP": INCOMINGDATAoutput.OLDMAT_CPnow,
//       "STATUS": INCOMINGDATAoutput.STATUSnow,
//       "UserNO": INCOMINGDATAoutput.UserNO,
//       //
//       "ITEM": INCOMINGDATAactive.ItemName,
//       "ITEMstatus": "GOOD",
//       "ITEMspecialAccStatus": 'SpecialAccept has approved',
//       "ITEMspecialAccCOMMENT": '',
//       "ITEMspecialAccPic": '',
//       "ITEMspecialAccPic01": '',
//       "ITEMspecialAccPic02": '',
//       "ITEMspecialAccPic03": '',
//       "ITEMspecialAccPic04": '',
//       "ITEMspecialAccPic05": '',
//       "ITEMsPiecesSelected": '',
//     };

//     //--------------------------------------------------
//     // final response = await Dio().post(
//     //   server + "updateDataIncomming",
//     //   data: bodyout,
//     // );

//     List<INCOMINGmaster> output = [];

//     // if (response.statusCode == 200) {
//     //   var databuff = response.data;
//     // } else {
//     //   //
//     // }

//     emit(output);
//   }

//   Future<void> _updateINCM_NOGOOD_NA(
//       List<INCOMINGmaster> toAdd, Emitter<List<INCOMINGmaster>> emit) async {
//     //--------------------------------------------------
//     Object bodyout = {
//       "MATNR": INCOMINGDATAoutput.MATNRnow,
//       "CHARG": INCOMINGDATAoutput.CHARGnow,
//       "MBLNR": INCOMINGDATAoutput.MBLNRnow,
//       "BWART": INCOMINGDATAoutput.BWARTnow,
//       "MENGE": INCOMINGDATAoutput.MENGEnow,
//       "MEINS": INCOMINGDATAoutput.MEINSnow,
//       "MAT_FG": INCOMINGDATAoutput.MAT_FGnow,
//       "KUNNR": INCOMINGDATAoutput.KUNNRnow,
//       "SORTL": INCOMINGDATAoutput.SORTLnow,
//       "NAME1": INCOMINGDATAoutput.NAME1now,
//       "CUST_LOT": INCOMINGDATAoutput.CUST_LOTnow,
//       "PART_NM": INCOMINGDATAoutput.PART_NMnow,
//       "PART_NO": INCOMINGDATAoutput.PART_NOnow,
//       "PROCESS": INCOMINGDATAoutput.PROCESSnow,
//       "OLDMAT_CP": INCOMINGDATAoutput.OLDMAT_CPnow,
//       "STATUS": INCOMINGDATAoutput.STATUSnow,
//       "UserNO": INCOMINGDATAoutput.UserNO,
//       //
//       "ITEM": INCOMINGDATAactive.ItemName,
//       "ITEMstatus": "NOGOOD",
//       "ITEMspecialAccStatus": '',
//       "ITEMspecialAccCOMMENT": '',
//       "ITEMspecialAccPic": '',
//       "ITEMspecialAccPic01": '',
//       "ITEMspecialAccPic02": '',
//       "ITEMspecialAccPic03": '',
//       "ITEMspecialAccPic04": '',
//       "ITEMspecialAccPic05": '',
//       "ITEMsPiecesSelected": '',
//     };

//     //--------------------------------------------------
//     // final response = await Dio().post(
//     //   server + "updateDataIncomming",
//     //   data: bodyout,
//     // );

//     List<INCOMINGmaster> output = [];

//     // if (response.statusCode == 200) {
//     //   var databuff = response.data;
//     // } else {
//     //   //
//     // }

//     emit(output);
//   }
// }
