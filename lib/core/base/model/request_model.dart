
import 'package:need_give_core/core/enums/charity_type.dart';
import 'package:need_give_core/core/enums/request_status.dart';



class RequestModel {
  final String id;
  final String name;
  final String description;
  final RequestStatus status;
  final CharityType charityType;

  RequestModel({this.charityType = CharityType.unknown,
    required this.id,
    required this.name, required this.description, required this.status});

  const RequestModel.empty({
    this.charityType = CharityType.unknown,
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
    CharityType? charityType,
  }) {
    return RequestModel(
      charityType: charityType?? this.charityType,
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      status: status ?? this.status,
    );
  }

  factory RequestModel.fromJson(Map<String, dynamic> json) {
    return RequestModel(
        id: json['id']??'',
        charityType: json['type']?? CharityType.unknown,
        name: json['name'] ?? '',
        description: json['description'] ?? '',
        status: json['status'] ?? RequestStatus.pending);
  }


  Map<String, dynamic> get toJson =>
      {
        'name': this.name,
        'type': this.charityType.value,
        'description':this.description,
        'status':this.status.name
      };
}

