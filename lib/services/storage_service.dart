import 'package:employe_directory/model/employee.dart';
import 'package:hive/hive.dart';

class StorageService {
  var employeeBox = Hive.box("employee");

  saveEmployees(List<Employee> employees) {
    Map<String, dynamic> data = {
      "employees": employees.map((e) => e.toJson()).toList()
    };
    print(data);
    employeeBox.put("employee", data);
  }

  loadEmployees(List<Employee> employees) {
    employees.clear();
    // employeeBox.get("employee");
    var data = employeeBox.get("employee");
    if (data != null) {
      data["employees"]
          .forEach((employee) => employees.add(Employee.fromJson(employee)));
    }
  }
}
