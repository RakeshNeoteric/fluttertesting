import 'package:flutter/material.dart';

class Employee {
  final String name;
  final String email;
  final String position;
  final String department;

  const Employee({
    required this.name,
    required this.email,
    required this.position,
    required this.department,
  });
}

class EmployeeListScreen extends StatelessWidget {
  const EmployeeListScreen({super.key});

  final List<Employee> employees = const [
    Employee(
      name: 'John Doe',
      email: 'john.doe@company.com',
      position: 'Software Engineer',
      department: 'Engineering',
    ),
    Employee(
      name: 'Jane Smith',
      email: 'jane.smith@company.com',
      position: 'Product Manager',
      department: 'Product',
    ),
    Employee(
      name: 'Mike Johnson',
      email: 'mike.johnson@company.com',
      position: 'UX Designer',
      department: 'Design',
    ),
  ];

@override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: const Color(0xFFF5F7FB),

    body: Column(
      children: [
        /// ✅ FIXED HEADER (TOP BAR)
        _buildTopHeader(),

        /// ✅ BODY CONTENT
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const SizedBox(height: 10),

                /// TABLE
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                      )
                    ],
                  ),
                  child: Column(
                    children: [
                      _buildHeader(),
                      ...employees.map((e) => _buildRow(e)).toList(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

  /// 🔹 HEADER
  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey),
        ),
      ),
      child: Row(
        children: const [
          Expanded(child: Text("NAME")),
          Expanded(child: Text("EMAIL")),
          Expanded(child: Text("POSITION")),
          Expanded(child: Text("DEPARTMENT")),
          SizedBox(width: 100, child: Text("ACTIONS")),
        ],
      ),
    );
  }

  /// 🔹 ROW
  Widget _buildRow(Employee e) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Color(0xFFE0E0E0)),
        ),
      ),
      child: Row(
        children: [
          Expanded(child: Text(e.name)),
          Expanded(child: Text(e.email)),
          Expanded(child: Text(e.position)),
          Expanded(child: Text(e.department)),

          /// ACTIONS
          SizedBox(
            width: 100,
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.edit, color: Colors.blue),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.delete, color: Colors.red),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildTopHeader() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
    decoration: BoxDecoration(
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.08),
          blurRadius: 8,
          offset: const Offset(0, 2),
        )
      ],
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: const [
            Icon(Icons.home_outlined, color: Colors.black54),
            SizedBox(width: 12),
            Text(
              "Employee Management",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ],
        ),

        /// BUTTON (Styled like image)
        Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF6C63FF), Color(0xFF5A4BFF)],
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.add, color: Colors.white),
            label: const Text("Add Employee"),
            style: ElevatedButton.styleFrom(
              elevation: 0,
              foregroundColor: Colors.white,
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              padding: const EdgeInsets.symmetric(
                  horizontal: 20, vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}