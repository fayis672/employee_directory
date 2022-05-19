import 'package:employe_directory/model/employee.dart';
import 'package:employe_directory/services/employee_service.dart';
import 'package:employe_directory/services/storage_service.dart';
import 'package:flutter/material.dart';

class EmployeeProvider with ChangeNotifier {
  EmployeeProvider() {
    getEmployees();
  }

  List<Employee> employees = [];
  List<Employee> employeesDuplicate = [];
  bool loading = true;

  getEmployees() async {
    loading = true;
    await StorageService().loadEmployees(employees);
    if (employees.isEmpty) {
      await EmployeeService().getEmployees(employees);
      await StorageService().saveEmployees(employees);
    }
    loading = false;
    employeesDuplicate.addAll(employees);
    notifyListeners();
  }

  filterSearchResults(String query) async {
    if (query.isNotEmpty) {
      List<Employee> dummyListData = [];
      employeesDuplicate.forEach((item) {
        if (item.name != null) {
          if (item.name!.toLowerCase().contains(query.toLowerCase())) {
            dummyListData.add(item);
          }
        }
      });
      employees.clear();
      employees.addAll(dummyListData);
      notifyListeners();
    } else {
      employees.clear();
      employees.addAll(employeesDuplicate);
      notifyListeners();
    }
  }
}
