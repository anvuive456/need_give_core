import 'package:need_give_core/core/model/base_model.dart';

abstract class BaseResponse<T extends BaseModel> {
  final T data;
  final String message;
  final int timeStamp;
  final int totalPage;
  final int page;
  final int statusCode;

  BaseResponse({
    required this.data,
    required this.message,
    required this.timeStamp,
    required this.totalPage,
    required this.page,
    required this.statusCode,
  });

  BaseResponse fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson();
}
