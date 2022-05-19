import 'package:employe_directory/provider/employee_provider.dart';
import 'package:employe_directory/widget/employ_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Consumer<EmployeeProvider>(
          builder: (context, provider, child) {
            return provider.loading
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: provider.employees.length,
                    itemBuilder: (context, index) =>
                        EmployeeCard(employee: provider.employees[index]));
          },
        ),
      ),
    );
  }
}
