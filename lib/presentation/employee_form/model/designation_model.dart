// To parse this JSON data, do
//
//     final designationListModel = designationListModelFromJson(jsonString);

import 'dart:convert';

DesignationListModel designationListModelFromJson(String str) => DesignationListModel.fromJson(json.decode(str));

String designationListModelToJson(DesignationListModel data) => json.encode(data.toJson());

class DesignationListModel {
    final Data data;

    DesignationListModel({
        required this.data,
    });

    factory DesignationListModel.fromJson(Map<String, dynamic> json) => DesignationListModel(
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
    final String name;
    final dynamic deletedAt;
    final DateTime createdAt;
    final DateTime updatedAt;

    Datum({
        required this.id,
        required this.name,
        required this.deletedAt,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        deletedAt: json["deleted_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "deleted_at": deletedAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}

class Link {
    final String url;
    final String label;
    final bool active;

    Link({
        required this.url,
        required this.label,
        required this.active,
    });

    factory Link.fromJson(Map<String, dynamic> json) => Link(
        url: json["url"]??"",
        label: json["label"],
        active: json["active"],
    );

    Map<String, dynamic> toJson() => {
        "url": url,
        "label": label,
        "active": active,
    };
}
