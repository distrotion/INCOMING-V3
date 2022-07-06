import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import '../../data/global.dart';
import '../../model/model.dart';
import '../../page/INCOMING/incomingvar.dart';

//-------------------------------------------------

String server = Gmainserver;

abstract class QUERYincm_Event {}

class updateINCM_GOOD extends QUERYincm_Event {}

class updateINCM_WAIT extends QUERYincm_Event {}

class updateINCM_GOOD_NA extends QUERYincm_Event {}

class updateINCM_NOGOOD extends QUERYincm_Event {}

class QUERYincm_Pressed extends QUERYincm_Event {}

class QUERYincm_Bloc extends Bloc<QUERYincm_Event, List<INCOMINGmaster>> {
  QUERYincm_Bloc() : super([INCOMINGmaster(ITEMs: '')]) {
    on<QUERYincm_Pressed>((event, emit) {
      return _QUERYincm_Fn([], emit);
    });
    on<updateINCM_GOOD>((event, emit) {
      return _updateINCM_GOOD([], emit);
    });
    on<updateINCM_WAIT>((event, emit) {
      return _updateINCM_WAIT([], emit);
    });
    on<updateINCM_GOOD_NA>((event, emit) {
      return _updateINCM_GOOD_NA([], emit);
    });
    on<updateINCM_NOGOOD>((event, emit) {
      return _updateINCM_NOGOOD_NA([], emit);
    });
  }
  Future<void> _QUERYincm_Fn(
      List<INCOMINGmaster> toAdd, Emitter<List<INCOMINGmaster>> emit) async {
    final response = await Dio().post(
      server + "getINCOMING",
      data: {
        "MATNR": INCOMINGDATAoutput.MATNRnow,
        "CHARG": INCOMINGDATAoutput.CHARGnow
      },
    );

    List<INCOMINGmaster> output = [
      INCOMINGmaster(
        ITEMs: '-',
        ITEMsID: '-',
        RESULTFORMAT: '-',
        FREQUENCY: '-',
        PCS: '-',
      )
    ];

    if (response.statusCode == 200) {
      var databuff = response.data;
      print(databuff);
      for (int i = 0; i < databuff.length; i++) {
        //
        output.add(INCOMINGmaster(
          ITEMs: databuff[i]['ITEMsNAME'],
          ITEMsID: databuff[i]['ITEMs'],
          RESULTFORMAT: databuff[i]['RESULTFORMAT'],
          FREQUENCY: databuff[i]['FREQUENCY'],
          PCS: databuff[i]['PCS'],
          STATE: databuff[i]['STATE'],
        ));
      }
    } else {
      //
    }

    emit(output);
  }

  Future<void> _updateINCM_GOOD(
      List<INCOMINGmaster> toAdd, Emitter<List<INCOMINGmaster>> emit) async {
    //--------------------------------------------------
    Object bodyout = {
      "MATNR": INCOMINGDATAoutput.MATNRnow,
      "CHARG": INCOMINGDATAoutput.CHARGnow,
      "MBLNR": INCOMINGDATAoutput.MBLNRnow,
      "BWART": INCOMINGDATAoutput.BWARTnow,
      "MENGE": INCOMINGDATAoutput.MENGEnow,
      "MEINS": INCOMINGDATAoutput.MEINSnow,
      "MAT_FG": INCOMINGDATAoutput.MAT_FGnow,
      "KUNNR": INCOMINGDATAoutput.KUNNRnow,
      "SORTL": INCOMINGDATAoutput.SORTLnow,
      "NAME1": INCOMINGDATAoutput.NAME1now,
      "CUST_LOT": INCOMINGDATAoutput.CUST_LOTnow,
      "PART_NM": INCOMINGDATAoutput.PART_NMnow,
      "PART_NO": INCOMINGDATAoutput.PART_NOnow,
      "PROCESS": INCOMINGDATAoutput.PROCESSnow,
      "OLDMAT_CP": INCOMINGDATAoutput.OLDMAT_CPnow,
      "STATUS": INCOMINGDATAoutput.STATUSnow,
      "UserNO": INCOMINGDATAoutput.UserNO,
      //
      "ITEM": INCOMINGDATAactive.ItemName,
      "ITEMstatus": "GOOD",
      "ITEMspecialAccStatus": '',
      "ITEMspecialAccCOMMENT": '',
      "ITEMspecialAccPic": '',
      "ITEMspecialAccPic01": '',
      "ITEMspecialAccPic02": '',
      "ITEMspecialAccPic03": '',
      "ITEMspecialAccPic04": '',
      "ITEMspecialAccPic05": '',
      "ITEMsPiecesSelected": '',
    };

    //--------------------------------------------------
    final responseIN = await Dio().post(
      server + "updateDataIncommingGOOD",
      data: bodyout,
    );

    final response = await Dio().post(
      server + "getINCOMING",
      data: {
        "MATNR": INCOMINGDATAoutput.MATNRnow,
        "CHARG": INCOMINGDATAoutput.CHARGnow
      },
    );

    List<INCOMINGmaster> output = [
      INCOMINGmaster(
        ITEMs: '-',
        ITEMsID: '-',
        RESULTFORMAT: '-',
        FREQUENCY: '-',
        PCS: '-',
      )
    ];

    if (response.statusCode == 200) {
      var databuff = response.data;

      for (int i = 0; i < databuff.length; i++) {
        //
        output.add(INCOMINGmaster(
          ITEMs: databuff[i]['ITEMsNAME'],
          ITEMsID: databuff[i]['ITEMs'],
          RESULTFORMAT: databuff[i]['RESULTFORMAT'],
          FREQUENCY: databuff[i]['FREQUENCY'],
          PCS: databuff[i]['PCS'],
          STATE: databuff[i]['STATE'],
        ));
      }
    } else {
      //
    }

    emit(output);
  }

  Future<void> _updateINCM_WAIT(
      List<INCOMINGmaster> toAdd, Emitter<List<INCOMINGmaster>> emit) async {
    //--------------------------------------------------
    Object bodyout = {
      "MATNR": INCOMINGDATAoutput.MATNRnow,
      "CHARG": INCOMINGDATAoutput.CHARGnow,
      "MBLNR": INCOMINGDATAoutput.MBLNRnow,
      "BWART": INCOMINGDATAoutput.BWARTnow,
      "MENGE": INCOMINGDATAoutput.MENGEnow,
      "MEINS": INCOMINGDATAoutput.MEINSnow,
      "MAT_FG": INCOMINGDATAoutput.MAT_FGnow,
      "KUNNR": INCOMINGDATAoutput.KUNNRnow,
      "SORTL": INCOMINGDATAoutput.SORTLnow,
      "NAME1": INCOMINGDATAoutput.NAME1now,
      "CUST_LOT": INCOMINGDATAoutput.CUST_LOTnow,
      "PART_NM": INCOMINGDATAoutput.PART_NMnow,
      "PART_NO": INCOMINGDATAoutput.PART_NOnow,
      "PROCESS": INCOMINGDATAoutput.PROCESSnow,
      "OLDMAT_CP": INCOMINGDATAoutput.OLDMAT_CPnow,
      "STATUS": INCOMINGDATAoutput.STATUSnow,
      "UserNO": INCOMINGDATAoutput.UserNO,
      //
      "ITEM": INCOMINGDATAactive.ItemName,
      "ITEMstatus": "WAIT",
      "ITEMspecialAccStatus": 'waitting for specialaccept',
      "ITEMspecialAccCOMMENT": NOGOODcon.SpacialAccText,
      "ITEMspecialAccPic": '',
      "ITEMspecialAccPic01": NOGOODcon.base64pic01,
      "ITEMspecialAccPic02": NOGOODcon.base64pic02,
      "ITEMspecialAccPic03": NOGOODcon.base64pic03,
      "ITEMspecialAccPic04": NOGOODcon.base64pic04,
      "ITEMspecialAccPic05": NOGOODcon.base64pic05,
      "ITEMsPiecesSelected": NOGOODcon.PiecesDropdownSelected,
    };

    //--------------------------------------------------
    final responseIN = await Dio().post(
      server + "updateDataIncommingWAIT",
      data: bodyout,
    );

    final response = await Dio().post(
      server + "getINCOMING",
      data: {
        "MATNR": INCOMINGDATAoutput.MATNRnow,
        "CHARG": INCOMINGDATAoutput.CHARGnow
      },
    );

    List<INCOMINGmaster> output = [
      INCOMINGmaster(
        ITEMs: '-',
        ITEMsID: '-',
        RESULTFORMAT: '-',
        FREQUENCY: '-',
        PCS: '-',
      )
    ];

    if (response.statusCode == 200) {
      var databuff = response.data;

      for (int i = 0; i < databuff.length; i++) {
        //
        output.add(INCOMINGmaster(
          ITEMs: databuff[i]['ITEMsNAME'],
          ITEMsID: databuff[i]['ITEMs'],
          RESULTFORMAT: databuff[i]['RESULTFORMAT'],
          FREQUENCY: databuff[i]['FREQUENCY'],
          PCS: databuff[i]['PCS'],
          STATE: databuff[i]['STATE'],
        ));
      }
    } else {
      //
    }

    emit(output);
  }

  Future<void> _updateINCM_GOOD_NA(
      List<INCOMINGmaster> toAdd, Emitter<List<INCOMINGmaster>> emit) async {
    //--------------------------------------------------
    Object bodyout = {
      "MATNR": INCOMINGDATAoutput.MATNRnow,
      "CHARG": INCOMINGDATAoutput.CHARGnow,
      "MBLNR": INCOMINGDATAoutput.MBLNRnow,
      "BWART": INCOMINGDATAoutput.BWARTnow,
      "MENGE": INCOMINGDATAoutput.MENGEnow,
      "MEINS": INCOMINGDATAoutput.MEINSnow,
      "MAT_FG": INCOMINGDATAoutput.MAT_FGnow,
      "KUNNR": INCOMINGDATAoutput.KUNNRnow,
      "SORTL": INCOMINGDATAoutput.SORTLnow,
      "NAME1": INCOMINGDATAoutput.NAME1now,
      "CUST_LOT": INCOMINGDATAoutput.CUST_LOTnow,
      "PART_NM": INCOMINGDATAoutput.PART_NMnow,
      "PART_NO": INCOMINGDATAoutput.PART_NOnow,
      "PROCESS": INCOMINGDATAoutput.PROCESSnow,
      "OLDMAT_CP": INCOMINGDATAoutput.OLDMAT_CPnow,
      "STATUS": INCOMINGDATAoutput.STATUSnow,
      "UserNO": INCOMINGDATAoutput.UserNO,
      //
      "ITEM": INCOMINGDATAactive.ItemName,
      "ITEMstatus": "GOOD",
      "ITEMspecialAccStatus": 'SpecialAccept has approved',
      "ITEMspecialAccCOMMENT": '',
      "ITEMspecialAccPic": '',
      "ITEMspecialAccPic01": '',
      "ITEMspecialAccPic02": '',
      "ITEMspecialAccPic03": '',
      "ITEMspecialAccPic04": '',
      "ITEMspecialAccPic05": '',
      "ITEMsPiecesSelected": '',
    };

    //--------------------------------------------------
    final responseIN = await Dio().post(
      server + "updateDataIncommingGOOD_NA",
      data: bodyout,
    );

    final response = await Dio().post(
      server + "getINCOMING",
      data: {
        "MATNR": INCOMINGDATAoutput.MATNRnow,
        "CHARG": INCOMINGDATAoutput.CHARGnow
      },
    );

    List<INCOMINGmaster> output = [
      INCOMINGmaster(
        ITEMs: '-',
        ITEMsID: '-',
        RESULTFORMAT: '-',
        FREQUENCY: '-',
        PCS: '-',
      )
    ];

    if (response.statusCode == 200) {
      var databuff = response.data;

      for (int i = 0; i < databuff.length; i++) {
        //
        output.add(INCOMINGmaster(
          ITEMs: databuff[i]['ITEMsNAME'],
          ITEMsID: databuff[i]['ITEMs'],
          RESULTFORMAT: databuff[i]['RESULTFORMAT'],
          FREQUENCY: databuff[i]['FREQUENCY'],
          PCS: databuff[i]['PCS'],
          STATE: databuff[i]['STATE'],
        ));
      }
    } else {
      //
    }

    emit(output);
  }

  Future<void> _updateINCM_NOGOOD_NA(
      List<INCOMINGmaster> toAdd, Emitter<List<INCOMINGmaster>> emit) async {
    //--------------------------------------------------
    Object bodyout = {
      "MATNR": INCOMINGDATAoutput.MATNRnow,
      "CHARG": INCOMINGDATAoutput.CHARGnow,
      "MBLNR": INCOMINGDATAoutput.MBLNRnow,
      "BWART": INCOMINGDATAoutput.BWARTnow,
      "MENGE": INCOMINGDATAoutput.MENGEnow,
      "MEINS": INCOMINGDATAoutput.MEINSnow,
      "MAT_FG": INCOMINGDATAoutput.MAT_FGnow,
      "KUNNR": INCOMINGDATAoutput.KUNNRnow,
      "SORTL": INCOMINGDATAoutput.SORTLnow,
      "NAME1": INCOMINGDATAoutput.NAME1now,
      "CUST_LOT": INCOMINGDATAoutput.CUST_LOTnow,
      "PART_NM": INCOMINGDATAoutput.PART_NMnow,
      "PART_NO": INCOMINGDATAoutput.PART_NOnow,
      "PROCESS": INCOMINGDATAoutput.PROCESSnow,
      "OLDMAT_CP": INCOMINGDATAoutput.OLDMAT_CPnow,
      "STATUS": INCOMINGDATAoutput.STATUSnow,
      "UserNO": INCOMINGDATAoutput.UserNO,
      //
      "ITEM": INCOMINGDATAactive.ItemName,
      "ITEMstatus": "reject",
      "ITEMspecialAccStatus": '',
      "ITEMspecialAccCOMMENT": '',
      "ITEMspecialAccPic": '',
      "ITEMspecialAccPic01": '',
      "ITEMspecialAccPic02": '',
      "ITEMspecialAccPic03": '',
      "ITEMspecialAccPic04": '',
      "ITEMspecialAccPic05": '',
      "ITEMsPiecesSelected": '',
    };

    //--------------------------------------------------
    final responseIN = await Dio().post(
      server + "updateDataIncommingNOGOOD",
      data: bodyout,
    );

    final response = await Dio().post(
      server + "getINCOMING",
      data: {
        "MATNR": INCOMINGDATAoutput.MATNRnow,
        "CHARG": INCOMINGDATAoutput.CHARGnow
      },
    );

    List<INCOMINGmaster> output = [
      INCOMINGmaster(
        ITEMs: '-',
        ITEMsID: '-',
        RESULTFORMAT: '-',
        FREQUENCY: '-',
        PCS: '-',
      )
    ];

    if (response.statusCode == 200) {
      var databuff = response.data;

      for (int i = 0; i < databuff.length; i++) {
        //
        output.add(INCOMINGmaster(
          ITEMs: databuff[i]['ITEMsNAME'],
          ITEMsID: databuff[i]['ITEMs'],
          RESULTFORMAT: databuff[i]['RESULTFORMAT'],
          FREQUENCY: databuff[i]['FREQUENCY'],
          PCS: databuff[i]['PCS'],
          STATE: databuff[i]['STATE'],
        ));
      }
    } else {
      //
    }

    emit(output);
  }
}
