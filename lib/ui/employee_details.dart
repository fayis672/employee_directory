import 'package:cached_network_image/cached_network_image.dart';
import 'package:employe_directory/model/employee.dart';
import 'package:employe_directory/widget/details_card.dart';
import 'package:flutter/material.dart';

class EmployeeDetails extends StatelessWidget {
  final Employee employee;
  const EmployeeDetails({Key? key, required this.employee}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Employee Details")),
      body: Container(
        child: Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Hero(
                  tag: employee.id.toString(),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: CachedNetworkImage(
                      imageUrl: employee.profileImage ??
                          "https://randomuser.me/api/portraits/men/9.jpg",
                      errorWidget: (context, error, _) => const Icon(
                        Icons.account_circle,
                        size: 40,
                      ),
                      placeholder: (context, _) =>
                          const Icon(Icons.account_circle),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "${employee.name}",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                ),
                const SizedBox(
                  height: 20,
                ),
                DetailsCard(title: "User name", data: employee.username ?? ""),
                DetailsCard(
                    title: "Company name", data: employee.company?.name ?? ""),
                DetailsCard(title: "Email", data: employee.email ?? ""),
                DetailsCard(title: "Phone", data: employee.phone ?? ""),
                DetailsCard(title: "Website", data: employee.website ?? ""),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
