import 'package:calculator_app/cubit/history_cubit.dart';
import 'package:calculator_app/views/calculator_view.dart';
import 'package:flutter/material.dart';
import 'const.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'models/calculator_model.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(CalculatorModelAdapter());

  await Hive.openBox<CalculatorModel>('history_box');
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HistoryCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(scaffoldBackgroundColor: Color(kBackgroundColor)),
        home: CalculatorView(),
      ),
    );
  }

  // This widget is the root of your application.
}
