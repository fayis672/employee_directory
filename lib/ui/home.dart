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
                : Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          child: TextField(
                            onChanged: provider.filterSearchResults,
                            autofocus: false,
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(left: 30),
                                hintText: "Search name..."),
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                            itemCount: provider.employees.length,
                            itemBuilder: (context, index) => EmployeeCard(
                                employee: provider.employees[index])),
                      ),
                    ],
                  );
          },
        ),
      ),
    );
  }
}
