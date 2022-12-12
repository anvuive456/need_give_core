
abstract class BaseModel {
  const BaseModel.empty();
  BaseModel.fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson();
}
