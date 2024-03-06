import 'package:employeeapp/presentation/employeeList/employee_list_screen.dart';
import 'package:employeeapp/presentation/employee_details/employee_details_screen.dart';
import 'package:employeeapp/presentation/employee_form/create_employee_form.dart';
import 'package:employeeapp/presentation/login/login_screen.dart';
import 'package:employeeapp/presentation/splash_screen/splash_screen.dart';
import 'package:employeeapp/routes/route_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Routes {
  static Map<String, Widget> routes() => {
        RouteList.initial: const SplashScreen(),
        RouteList.login: const LoginScreen(),
        RouteList.employeelist: const HomeScreen(),
        RouteList.employeedetails: const EmployeeDetailsScreen(),
        RouteList.addemployee: const CreateEmployeeForm()
      };

  static List<GetPage> getPages() {
    List<GetPage> pages = [];
    routes().forEach((key, value) {
      pages.add(GetPage(
        name: key,
        page: () => value,
      ));
    });

    return pages;
  }
}
