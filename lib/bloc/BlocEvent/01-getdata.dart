import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import '../../data/global.dart';
import '../../model/model.dart';
import '../../page/INCOMING/mainbody.dart';
import '../../widget/common/Loading.dart';

// String server = 'http://localhost:10000/';
String server = Gmainserver;
//172.23.10.39

/// Event being processed by [CounterBloc].
abstract class DataSetEvent {}

/// Notifies bloc to increment state.
class GetDataPressed extends DataSetEvent {}

class FlushITDataPressed extends DataSetEvent {}

class CounterValue extends DataSetBloc {
  final int value;
  CounterValue(this.value);
}

class DataSetBloc extends Bloc<DataSetEvent, List<dataset>> {
  /// {@macro counter_bloc}
  DataSetBloc() : super(<dataset>[]) {
    on<GetDataPressed>((event, emit) {
      return _getdata([], emit);
    });
  }
  Future<void> _getdata(
      List<dataset> toAdd, Emitter<List<dataset>> emit) async {
    FreeLoading(maintablecontext);
    final response = await Dio().post(
      server + "tblSAPGoodReceive_get",
      data: {"MATNR": "", "CHARG": ""},
    );

    var data_input = [];
    List<dataset> stateoutput = [];
    if (response.statusCode == 200) {
      Navigator.pop(maintablecontext);
      // var databuff = jsonDecode(response.body);
      var databuff = response.data;
      data_input = databuff[0]['output'];
      for (var i = 0; i < data_input.length; i++) {
        stateoutput.add(dataset(
          id: i + 1,
          f01: data_input[i]['MATNR'].toString(),
          f02: data_input[i]['NAME1'].toString(),
          f03: data_input[i]['PART_NM'].toString(),
          f04: data_input[i]['PART_NO'].toString(),
          f05: data_input[i]['CHARG'].toString(),
          f06: data_input[i]['CUST_LOT'].toString(),
          f07: data_input[i]['STATUS'].toString(),
          f08: "",
          f09: data_input[i]['MATNR'].toString(),
          f10: data_input[i]['CHARG'].toString(),
          f11: data_input[i]['MBLNR'].toString(),
          f12: data_input[i]['BWART'].toString(),
          f13: data_input[i]['MENGE'].toString(),
          f14: data_input[i]['MEINS'].toString(),
          f15: data_input[i]['MAT_FG'].toString(),
          f16: data_input[i]['KUNNR'].toString(),
          f17: data_input[i]['SORTL'].toString(),
          f18: data_input[i]['NAME1'].toString(),
          f19: data_input[i]['CUST_LOT'].toString(),
          f20: data_input[i]['PART_NM'].toString(),
          f21: data_input[i]['PART_NO'].toString(),
          f22: data_input[i]['PROCESS'].toString(),
          f23: data_input[i]['OLDMAT_CP'].toString(),
          f24: data_input[i]['STATUS'].toString(),
          f25: data_input[i]['Appearance for rust_status'].toString(),
          f26: data_input[i]['Appearance for scratch_status'].toString(),
        ));
      }
      //stateoutput = data_test
      emit(stateoutput);
    } else {
      Navigator.pop(maintablecontext);
      print("where is my server");
      //stateoutput = data_test
      stateoutput = [];
      emit(stateoutput);
    }
  }

  Future<void> _PostData01(int toAdd, Emitter<int> emit) async {}
}
