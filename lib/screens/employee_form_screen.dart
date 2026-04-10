import 'package:flutter/material.dart';
import '../model/employee.dart';
import 'package:flutter/services.dart';

class EmployeeFormScreen extends StatefulWidget {
  final Employee? employee; // null = Add, not null = Edit

  const EmployeeFormScreen({super.key, this.employee});

  @override
  State<EmployeeFormScreen> createState() => _EmployeeFormScreenState();
}

class _EmployeeFormScreenState extends State<EmployeeFormScreen> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController positionController;
  late TextEditingController departmentController;

  @override
  void initState() {
    super.initState();

    /// If edit → prefill data
    nameController = TextEditingController(text: widget.employee?.name ?? '');
    emailController = TextEditingController(text: widget.employee?.email ?? '');
    positionController =
        TextEditingController(text: widget.employee?.position ?? '');
    departmentController =
        TextEditingController(text: widget.employee?.department ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.employee == null ? "Add Employee" : "Edit Employee"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _input(nameController, "Name"),
              _input(emailController, "Email"),
              _input(positionController, "Position"),
              _input(departmentController, "Department"),
              const SizedBox(height: 20),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text("Cancel"),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFF6C63FF), Color(0xFF5A4BFF)],
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.pop(context);
                          }
                        },

                        // onPressed: () async {
                        //   if (_formKey.currentState!.validate()) {
                        //     final newEmployee = Employee(
                        //       id: 0, // JSON server will auto-generate
                        //       name: nameController.text,
                        //       email: emailController.text,
                        //       position: positionController.text,
                        //       department: departmentController.text,
                        //     );

                        //     await EmployeeService.addEmployee(newEmployee);

                        //     Navigator.pop(context, true); // return success
                        //   }
                        // },

                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                        ),
                        child: Text(widget.employee == null ? "Add" : "Update"),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              /// 🔹 COPY BUTTON (EDIT SCREEN)
              if (widget.employee != null)
                Align(
                  alignment: Alignment.centerLeft,
                  child: OutlinedButton.icon(
                    onPressed: _copyToClipboard,
                    icon: const Icon(Icons.copy),
                    label: const Text("Copy to Clipboard"),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      backgroundColor: const Color(0xFFF3F4F6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),

              /// 🔹 PASTE BUTTON (ADD SCREEN)
              if (widget.employee == null)
                Align(
                  alignment: Alignment.centerLeft,
                  child: OutlinedButton.icon(
                    onPressed: _pasteFromClipboard,
                    icon: const Icon(Icons.paste),
                    label: const Text("Paste from Clipboard"),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      backgroundColor: const Color(0xFFF3F4F6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _input(TextEditingController controller, String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(labelText: label),
        validator: (value) =>
            value == null || value.isEmpty ? "Required" : null,
      ),
    );
  }

  void _copyToClipboard() {
    final data = '''
Name: ${nameController.text}
Email: ${emailController.text}
Position: ${positionController.text}
Department: ${departmentController.text}
''';

    Clipboard.setData(ClipboardData(text: data));

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Copied to clipboard")),
    );
  }

  Future<void> _pasteFromClipboard() async {
    final clipboardData = await Clipboard.getData('text/plain');

    if (clipboardData == null || clipboardData.text == null) return;

    final text = clipboardData.text!;

    /// Basic parsing (simple approach)
    final lines = text.split('\n');

    for (var line in lines) {
      if (line.startsWith('Name:')) {
        nameController.text = line.replaceFirst('Name:', '').trim();
      } else if (line.startsWith('Email:')) {
        emailController.text = line.replaceFirst('Email:', '').trim();
      } else if (line.startsWith('Position:')) {
        positionController.text = line.replaceFirst('Position:', '').trim();
      } else if (line.startsWith('Department:')) {
        departmentController.text = line.replaceFirst('Department:', '').trim();
      }
    }
  }
}
