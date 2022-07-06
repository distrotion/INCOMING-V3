import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/BlocEvent/01-getdata.dart';
import '../bloc/BlocEvent/04-flushfromsap.dart';
import '../model/model.dart';
import 'INCOMING/mainbody.dart';

//---------------------------------------------------------

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page1BlocBodyLUSHsap();
  }
}

class Page1BlocBodyLUSHsap extends StatelessWidget {
  /// {@macro counter_page}
  const Page1BlocBodyLUSHsap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => FLUSHsap_Bloc(),
        child: BlocBuilder<FLUSHsap_Bloc, int>(
          builder: (context, non) {
            return Page1BlocBody();
          },
        ));
  }
}

class Page1BlocBody extends StatelessWidget {
  /// {@macro counter_page}
  const Page1BlocBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => DataSetBloc(),
        child: BlocBuilder<DataSetBloc, List<dataset>>(
          builder: (context, data) {
            return Page1Body(
              data: data,
            );
          },
        ));
  }
}

class Page1Body extends StatelessWidget {
  Page1Body({Key? key, this.data}) : super(key: key);
  List<dataset>? data;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: MainTableBody(
        data: data,
      ),
    );
  }
}
