// To parse this JSON data, do
//
//     final employeeListModel = employeeListModelFromJson(jsonString);

import 'dart:convert';

EmployeeListModel employeeListModelFromJson(String str) => EmployeeListModel.fromJson(json.decode(str));

String employeeListModelToJson(EmployeeListModel data) => json.encode(data.toJson());

class EmployeeListModel {
    final Data data;

    EmployeeListModel({
        required this.data,
    });

    factory EmployeeListModel.fromJson(Map<String, dynamic> json) => EmployeeListModel(
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
    };
}

class Data {
    final int currentPage;
    final List<Datum> data;
    final String firstPageUrl;
    final int from;
    final int lastPage;
    final String lastPageUrl;
    final String nextPageUrl;
    final String path;
    final int perPage;
    final String prevPageUrl;
    final int to;
    final int total;

    Data({
        required this.currentPage,
        required this.data,
        required this.firstPageUrl,
        required this.from,
        required this.lastPage,
        required this.lastPageUrl,
        required this.nextPageUrl,
        required this.path,
        required this.perPage,
        required this.prevPageUrl,
        required this.to,
        required this.total,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        currentPage: json["current_page"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        nextPageUrl: json["next_page_url"]??"",
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"]??"",
        to: json["to"],
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "first_page_url": firstPageUrl,
        "from": from,
        "last_page": lastPage,
        "last_page_url": lastPageUrl,
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
        "total": total,
    };
}

class Datum {
    final int id;
    final String firstName;
    final String lastName;
    final DateTime joinDate;
    final DateTime dateOfBirth;
    final int designationId;
    final String gender;
    final int mobile;
    final int landline;
    final String email;
    final String presentAddress;
    final String permanentAddress;
    final String profilePicture;
    final String resume;
    final DateTime createdAt;
    final DateTime updatedAt;
    final String status;
    final String profileImage;

    Datum({
        required this.id,
        required this.firstName,
        required this.lastName,
        required this.joinDate,
        required this.dateOfBirth,
        required this.designationId,
        required this.gender,
        required this.mobile,
        required this.landline,
        required this.email,
        required this.presentAddress,
        required this.permanentAddress,
        required this.profilePicture,
        required this.resume,
        required this.createdAt,
        required this.updatedAt,
        required this.status,
        required this.profileImage,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        firstName:json["first_name"]??"",
        lastName: json["last_name"],
        joinDate: DateTime.parse(json["join_date"]),
        dateOfBirth: DateTime.parse(json["date_of_birth"]),
        designationId: json["designation_id"],
        gender: json["gender"],
        mobile: json["mobile"],
        landline: json["landline"],
        email: json["email"],
        presentAddress: json["present_address"]??"",
        permanentAddress: json["permanent_address"]??'',
        profilePicture: json["profile_picture"],
        resume: json["resume"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        status: json["status"]??'',
        profileImage: json["profile_image"]??"",
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "join_date": joinDate.toIso8601String(),
        "date_of_birth": dateOfBirth.toIso8601String(),
        "designation_id": designationId,
        "gender": gender,
        "mobile": mobile,
        "landline": landline,
        "email": email,
        "present_address": presentAddress,
        "permanent_address":permanentAddress,
        "profile_picture": profilePicture,
        "resume": resume,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "status": status,
        "profile_image": profileImage,
    };
}
