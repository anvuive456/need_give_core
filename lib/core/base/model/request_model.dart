import 'package:needer/module/request/bloc/request_bloc.dart';

class RequestModel {
  final String id;
  final String name;
  final String description;
  final RequestStatus status;
  final CharityType

  RequestModel(
      {
        required this.id,
        required this.name, required this.description, required this.status});

  const RequestModel.empty({
    this.id = '',
    this.name = '',
    this.description = '',
    this.status = RequestStatus.pending,
  });

  RequestModel copyWith({
    String? id,
    String? name,
    String? description,
    RequestStatus? status,
  }) {
    return RequestModel(
      id: id?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      status: status ?? this.status,
    );
  }

  factory RequestModel.fromJson(Map<String, dynamic> json) {
    return RequestModel(
      id: json['id'],
        name: json['name'] ?? '',
        description: json['description'] ?? '',
        status: json['status'] ?? RequestStatus.pending);
  }


  Map<String,dynamic> get toJson => {
    'name':
  };
}

enum RequestStatus {
  pending,
  accepted,
  canceled,
  declined,
}
