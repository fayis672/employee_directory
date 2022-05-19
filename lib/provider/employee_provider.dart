import 'package:employe_directory/model/employee.dart';
import 'package:employe_directory/services/employee_service.dart';
import 'package:employe_directory/services/storage_service.dart';
import 'package:flutter/material.dart';

class EmployeeProvider with ChangeNotifier {
  EmployeeProvider() {
    getEmployees();
  }

  List<Employee> employees = [];
  bool loading = true;

  getEmployees() async {
    loading = true;
    await StorageService().loadEmployees(employees);
    if (employees.isEmpty) {
      await EmployeeService().getEmployees(employees);
      await StorageService().saveEmployees(employees);
    }
    loading = false;
    notifyListeners();
  }
}
