import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/employee.dart';


class EmployeeService {
  static const String baseUrl = "http://localhost:3000/employees";
 // static const String baseUrl = "http://192.168.0.214:3000/employees";

  static Future<List<Employee>> fetchEmployees() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        List data = jsonDecode(response.body);
        return data.map((e) => Employee.fromJson(e)).toList();
      } else {
        throw Exception("Failed to load employees");
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }
}