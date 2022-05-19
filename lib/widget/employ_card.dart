import 'package:cached_network_image/cached_network_image.dart';
import 'package:employe_directory/model/employee.dart';
import 'package:employe_directory/ui/employee_details.dart';
import 'package:flutter/material.dart';

class EmployeeCard extends StatelessWidget {
  final Employee employee;
  const EmployeeCard({Key? key, required this.employee}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => EmployeeDetails(employee: employee))),
          leading: Hero(
            tag:employee.id.toString(),
            child: CachedNetworkImage(
              imageUrl: employee.profileImage ??
                  "https://randomuser.me/api/portraits/men/9.jpg",
              errorWidget: (context, error, _) => const Icon(
                Icons.account_circle,
                size: 40,
              ),
              placeholder: (context, _) => const Icon(Icons.account_circle),
            ),
          ),
          subtitle: Text("${employee.company?.name}"),
          title: Text(
            "${employee.name}",
          )),
    );
  }
}
