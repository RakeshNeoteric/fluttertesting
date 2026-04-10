import 'package:flutter/material.dart';

import '../model/employee.dart';

class EditEmployeeScreen extends StatelessWidget {
  final Employee employee;

  const EditEmployeeScreen({super.key, required this.employee});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Employee")),
      body: Center(
        child: Text("Editing: ${employee.name}"),
      ),
    );
  }
}