import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:biobuluyo_app/pages/home.dart';

import 'package:biobuluyo_app/utils/marker_manager.dart';
import 'package:biobuluyo_app/models/expense.dart';
import 'package:biobuluyo_app/utils/expense_list_manager.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (_) => ExpenseListManager(),
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
          primarySwatch: Colors.lightBlue,
          textTheme:
              const TextTheme(headline4: TextStyle(color: Colors.white))),
      debugShowCheckedModeBanner: false,
    );
  }
}
