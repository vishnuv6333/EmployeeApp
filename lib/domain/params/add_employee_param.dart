import 'dart:io';

import 'package:equatable/equatable.dart';

class AddNewEmployeeParams extends Equatable {
  final String firstname;
  final String lastname;
  final String joiningDate;
  final String dateofBirth;
  final String destinationId;
  final String gender;
  final String email;
  final String mobile;
  final String landline;
  final String presentAddress;
  final String permenentaddress;
  final String status;
  final Map<String, File>? profileImage;
  final Map<String, File>? resume;

  const AddNewEmployeeParams({
    required this.firstname,
    required this.landline,
    required this.lastname,
    required this.joiningDate,
    required this.mobile,
    required this.gender,
    required this.status,
    required this.presentAddress,
    required this.destinationId,
    required this.dateofBirth,
    required this.email,
    required this.permenentaddress,
    required this.profileImage,
    required this.resume
  });

  Map<String, dynamic> toMap() {
    return {
      "first_name": firstname,
      "last_name": lastname,
      "join_date": joiningDate,
      "date_of_birth": dateofBirth,
      "designation_id": destinationId,
      "gender": gender,
      "email": email,
      "mobile": mobile,
      "landline": landline,
      "present_address": presentAddress,
      "permanent_address": permenentaddress,
      "status": status
    };
  }

  @override
  List<Object?> get props => [];
}
