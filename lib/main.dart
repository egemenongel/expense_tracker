import 'package:biobuluyo_app/marker_manager.dart';
import 'package:biobuluyo_app/models/expense.dart';
import 'package:biobuluyo_app/models/expense_list.dart';
import 'package:biobuluyo_app/pages/add_marker.dart';
import 'package:biobuluyo_app/pages/form.dart';
import 'package:biobuluyo_app/pages/home.dart';
import 'package:biobuluyo_app/pages/map.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

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
      initialRoute: "/",
      routes: {
        "/": (context) => const HomePage(),
        "/MapPage": (context) => const MapPage(),
        "/FormPage": (context) => const FormPage(),
      },
      title: 'BioBuluyo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
