import 'dart:convert';

import 'package:employe_directory/model/employee.dart';
import 'package:hive/hive.dart';

class StorageService {
  var employeeBox = Hive.box("employee");

  saveEmployees(List<Employee> employees) {
    Map<String, dynamic> data = {
      "employees": employees.map((e) => e.toJson()).toList()
    };
    // employeeBox.put("employee", data);
  }

  loadEmployees(List<Employee> employees) {
    employees.clear();
    var data = employeeBox.get("employee");

    if (data != null) {
      List<dynamic> dt = data["employees"];
      dt.map((e) => Employee.fromJson(e));
      // dt.forEach((element) {
      //   Employee.fromJson(element);
      // });
    }
  }
}
