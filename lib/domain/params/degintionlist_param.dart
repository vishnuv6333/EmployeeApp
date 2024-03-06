import 'package:equatable/equatable.dart';

class DesignationListParams extends Equatable {
  final String page;
  final String size;

  const DesignationListParams({
    required this.page,
    required this.size,
  });

  Map<String, dynamic> toMap() {
    return {"size": size, "page": page};
  }

  @override
  List<Object?> get props => [];
}
