import 'dart:html';

import 'package:employe_directory/model/employee.dart';
import 'package:flutter/material.dart';

class EmployeeCard extends StatelessWidget {
  final Employee employee;
  const EmployeeCard({Key? key, required this.employee}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Text(""),
        subtitle: Text("${employee.company?.name}"),
        title: Text("${employee.name}",
        
    
      )),

    );
  }
}
