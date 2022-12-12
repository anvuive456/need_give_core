import 'package:need_give_core/core/model/base_model.dart';

abstract class ListBaseResponse<T extends BaseModel> {
  final List<T> data;
  final String message;
  final int timeStamp;
  final int totalPage;
  final int page;
  final int statusCode;

  ListBaseResponse(
      {required this.data,
      required this.message,
      required this.timeStamp,
      required this.totalPage,
      required this.page,
      required this.statusCode});

  const ListBaseResponse.empty(
      {this.data = const [],
      this.message = '',
      this.timeStamp = -1,
      this.totalPage = 0,
      this.page = 1,
      this.statusCode = 0});

  ListBaseResponse fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson();
}
