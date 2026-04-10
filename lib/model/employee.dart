class Employee {
  final int id;
  final String name;
  final String email;
  final String position;
  final String department;

  Employee({
    required this.id,
    required this.name,
    required this.email,
    required this.position,
    required this.department,
  });

 factory Employee.fromJson(Map<String, dynamic> json) {
  return Employee(
    id: json['id'] is int
        ? json['id']
        : int.parse(json['id'].toString()),

    name: json['name'],
    email: json['email'],
    position: json['position'],
    department: json['department'],
  );
}
}