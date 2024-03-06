import 'package:equatable/equatable.dart';

class EmployeeListParams extends Equatable {
  final String page;
  final String size;

  const EmployeeListParams({
    required this.page,
    required this.size,
  });

  Map<String, dynamic> toMap() {
    return {"size": size, "page": page};
  }

  @override
  List<Object?> get props => [];
}
