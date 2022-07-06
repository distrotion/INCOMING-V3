import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/01-getdata.dart';
import '../../bloc/BlocEvent/04-flushfromsap.dart';
import '../../bloc/Cubit/Rebuild.dart';
import '../../data/Base64Img.dart';
import '../../model/model.dart';
import '../../widget/common/Loading.dart';

import 'CONSOLEbox/consolemain.dart';
import 'dummydata.dart';
import 'incomingvar.dart';

//------------------------------------

late BuildContext maintablecontext;
String _searchResult = '';

class MainTableBody extends StatelessWidget {
  /// {@macro counter_page}
  MainTableBody({Key? key, this.data}) : super(key: key);
  List<dataset>? data;
  @override
  Widget build(BuildContext context) {
    return TableBodyRebuild(
      data: data,
    );
  }
}

class TableBodyRebuild extends StatelessWidget {
  TableBodyRebuild({Key? key, this.data}) : super(key: key);
  List<dataset>? data;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<BlocPageRebuild>(
            create: (BuildContext context) =>
                BlocPageRebuild(), //For rebuild only page inside without app bar/left menu
          ),
        ],
        child: TableBody(
          data: data,
        ));
  }
}

class TableBody extends StatefulWidget {
  TableBody({Key? key, this.data, this.DD_INCM}) : super(key: key);
  List<dataset>? data;
  DropDownData_INCM? DD_INCM;

  @override
  _TableBodyState createState() => _TableBodyState();
}

class _TableBodyState extends State<TableBody> {
  int _sortColumnIndex = 5;
  bool _sortAscending = true;

  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<DataSetBloc>().add(GetDataPressed());
    // context.read<DropDownData_INCM_Bloc>().add(DropDownData_INCM_Pressed());
  }

  @override
  Widget build(BuildContext context) {
    maintablecontext = context;

    List<dataset> datain = widget.data ?? [];

    // if (_searchResult != '') {
    //   List<dataset> _data_exp = [];

    //   for (int i = 0; i < datain.length; i++) {
    //     if (datain[i].f01.toLowerCase().contains(_searchResult) ||
    //         datain[i].f02.toLowerCase().contains(_searchResult) ||
    //         datain[i].f03.toLowerCase().contains(_searchResult) ||
    //         datain[i].f04.toLowerCase().contains(_searchResult) ||
    //         datain[i].f05.toLowerCase().contains(_searchResult) ||
    //         datain[i].f06.toLowerCase().contains(_searchResult)) {
    //       _data_exp.add(datain[i]);
    //     }
    //   }

    //   datain = _data_exp;
    // }

    DropDownData_INCM _DD_INCM = widget.DD_INCM ?? zeroDropDownData_MR;
    MyData _data = MyData(context, datain, _DD_INCM.list01);

    void _sort<T>(Comparable<T> Function(dataset d) getField, int columnIndex,
        bool ascending) {
      _data._sort<T>(getField, ascending);
      setState(() {
        _sortColumnIndex = columnIndex;
        _sortAscending = ascending;
      });
    }

    // print('------->' + '${_DD_INCM.list01}');

    return Center(
      child: SingleChildScrollView(
        child: SizedBox(
          width: 1200,
          child: Column(
            children: [
              Card(
                child: ListTile(
                  leading: const Icon(Icons.search),
                  title: TextField(
                      controller: controller,
                      decoration: const InputDecoration(
                          hintText: 'Search', border: InputBorder.none),
                      onChanged: (value) {
                        _searchResult = value;
                        BlocProvider.of<BlocPageRebuild>(context).rebuildPage();
                      }),
                  trailing: IconButton(
                    icon: const Icon(Icons.cancel),
                    onPressed: () {
                      controller.clear();
                      _searchResult = '';
                      BlocProvider.of<BlocPageRebuild>(context).rebuildPage();
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: SizedBox(
                  width: 1200,
                  child: PaginatedDataTable(
                    source: _data,
                    header: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('INCOMING LIST'),
                        Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                context
                                    .read<FLUSHsap_Bloc>()
                                    .add(FLUSHsap_Pressed_01());
                                BlocProvider.of<BlocPageRebuild>(context)
                                    .rebuildPage();
                                // onLoadingType02(context, () {});
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.red),
                              ),
                              child: const Text("FLUSH"),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                context
                                    .read<DataSetBloc>()
                                    .add(GetDataPressed());
                                BlocProvider.of<BlocPageRebuild>(context)
                                    .rebuildPage();
                                // onLoadingType02(context, () {});
                              },
                              child: const Icon(
                                Icons.refresh,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    columns: [
                      DataColumn(
                          label: Text('ID'),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<num>(
                                  (dataset d) => d.id, columnIndex, ascending)),
                      DataColumn(
                          label: Text('MATCP'),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((dataset d) => d.f01, columnIndex,
                                  ascending)),
                      DataColumn(
                          label: Text('CUST NAME'),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((dataset d) => d.f02, columnIndex,
                                  ascending)),
                      DataColumn(
                          label: Text('PART NAME'),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((dataset d) => d.f03, columnIndex,
                                  ascending)),
                      DataColumn(
                          label: Text('PART NO'),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((dataset d) => d.f04, columnIndex,
                                  ascending)),
                      DataColumn(
                          label: Text('CHARG'),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((dataset d) => d.f05, columnIndex,
                                  ascending)),
                      DataColumn(
                          label: Text('CUST LOT'),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((dataset d) => d.f06, columnIndex,
                                  ascending)),
                      DataColumn(
                          label: Text('QTY'),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((dataset d) => d.f13, columnIndex,
                                  ascending)),
                    ],
                    columnSpacing: 25,
                    horizontalMargin: 10,
                    rowsPerPage: 10,
                    sortColumnIndex: _sortColumnIndex,
                    sortAscending: _sortAscending,
                    showCheckboxColumn: false,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// The "soruce" of the table
class MyData extends DataTableSource {
  // Generate some made-up data
  final BuildContext context;
  late List<dataset> _data;
  late List<dataset> input;
  late List list01;
  late List _list01;
  List<dataset> _data_exp = [];

  int _selectedCount = 0;
  MyData.empty(this.context) {
    _data = [];
  }
  MyData(this.context, this.input, this.list01) {
    _data = input;
    _list01 = list01;
    // _data_exp = [];

    // _data = _data_exp;
  }

  void _sort<T>(Comparable<T> Function(dataset d) getField, bool ascending) {
    _data.sort((dataset a, dataset b) {
      final Comparable<T> aValue = getField(a);
      final Comparable<T> bValue = getField(b);
      return ascending
          ? Comparable.compare(aValue, bValue)
          : Comparable.compare(bValue, aValue);
    });
    notifyListeners();
  }

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => _data.length;
  @override
  int get selectedRowCount => 0;
  @override
  DataRow getRow(int index) {
    final dataset data = _data[index];
    String for_Rust = data.f25;
    String for_Scratch = data.f26;
    return DataRow.byIndex(
        index: index,
        selected: for_Rust != '-' || for_Scratch != '-',
        color: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.selected) &&
              for_Rust == 'GOOD' &&
              for_Scratch == 'GOOD') {
            return Colors.green;
          } else if (states.contains(MaterialState.selected) &&
              (for_Rust == 'reject' || for_Scratch == 'reject')) {
            return Colors.red;
          } else if (states.contains(MaterialState.selected) &&
              (for_Rust == 'WAIT' || for_Scratch == 'WAIT')) {
            return Colors.orange;
          }

          return null; // Use the default value.
        }),
        onSelectChanged: (value) {
          // if (data.selected != value) {
          //   _selectedCount += value! ? 1 : -1;
          //   assert(_selectedCount >= 0);
          //   data.selected = value;
          // }
          // data.selected = true;
          //-----------
          // confirmPass = false;

          // print(data.f01);

          // if (data.f01 == '24000001') {
          //   data.selected = true;
          // }

          //-----------

          INCOMINGDATAactive.ItemNow = 0;
          INCOMINGDATAactive.modeNOGOOD = false;
          INCOMINGDATAactive.ItemName = '';
          INCOMINGDATAactive.statusNow = '';
          INCOMINGDATAactive.specialAccStatusNow = '';
          INCOMINGDATAactive.specialAccCOMMENTNow = '';
          INCOMINGDATAactive.specialAccPicNow = '';
          INCOMINGDATAactive.confirmPass = '';
          INCOMINGDATAactive.wait = '';
          INCOMINGDATAactive.PassText = '';

          NOGOODcon.NoGoodPage = 1;
          NOGOODcon.PiecesDropdownSelected = '1';
          NOGOODcon.yesno = 0;
          NOGOODcon.undercontrol = false;
          NOGOODcon.SpacialAccText = '';
          NOGOODcon.attper = 0;
          NOGOODcon.base64pic01 = imgw;
          NOGOODcon.base64pic02 = imgw;
          NOGOODcon.base64pic03 = imgw;
          NOGOODcon.base64pic04 = imgw;
          NOGOODcon.base64pic05 = imgw;

          //-----------
          // _selectedCount += value! ? 1 : -1;
          // assert(_selectedCount >= 0);
          // data.selected = value;
          // print(index);
          // print(data.f01);
          // print(data.f03);

          // onLoadingType01(context, () {}, () {}
          //     // context
          //     //     .read<DropDownData_INCM_Bloc>()
          //     //     .add(DropDownData_INCM_Pressed()),
          //     // ConsoleBox(data, _list01),
          //     );

          ConsoleBoxBODY(data, _list01);
          notifyListeners();
        },
        cells: [
          DataCell(Text(
            data.id.toString(),
          )),
          DataCell(Text(data.f01)),
          DataCell(Text(data.f02)),
          DataCell(Text(data.f03)),
          DataCell(Text(data.f04)),
          DataCell(Text(data.f05)),
          DataCell(Text(data.f06)),
          DataCell(Text(data.f13)),
        ]);
  }
}
