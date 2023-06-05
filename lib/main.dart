import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grow_simplee/constants/constants.dart';

void main() async {
  
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: Constants().routes,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true)
          .copyWith(primaryColor: Colors.blue.shade100),
      // home: const RiderLists(),
    );
  }
}
