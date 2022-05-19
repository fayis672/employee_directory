import 'package:employe_directory/model/employee.dart';
import 'package:employe_directory/utils/dio_service.dart';

class EmployeeService {
  DioService dio = DioService();

  getEmployees(List<Employee> employees) async {
    final res = await dio.getData("5d565297300000680030a986");
    res
        .map((employeeJson) => employees.add(Employee.fromJson(employeeJson)))
        .toList();
  }
}
