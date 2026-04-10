import 'package:flutter/material.dart';
import 'package:fluttertesting/screens/employee_list_screen.dart';
import 'package:fluttertesting/screens/home_screen.dart';
import 'package:fluttertesting/screens/panchang_screen.dart';

void main() {
  runApp(const MyApp());
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: PanchangScreen(),
//     );
//   }
// }


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Employee Management',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/employees': (context) => const EmployeeListScreen(),
      },
    );
  }
}