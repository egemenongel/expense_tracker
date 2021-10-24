import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:biobuluyo_app/pages/home.dart';

import 'package:biobuluyo_app/models/marker_manager.dart';
import 'package:biobuluyo_app/models/expense.dart';
import 'package:biobuluyo_app/models/expense_list.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (_) => ExpenseListModel(),
    ),
    ChangeNotifierProvider(
      create: (_) => ExpenseModel(),
    ),
    ChangeNotifierProvider(
      create: (_) => MarkerManager(),
    )
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      home: const HomePage(),
      title: 'BioBuluyo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
