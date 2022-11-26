import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:need_give_core/core/base/app_exception.dart';
import 'package:path/path.dart';
import 'package:mime/mime.dart';
import 'package:http_parser/http_parser.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:convert';

import 'dio_http.dart';

class DioHttpProvider {

  static DioHttpProvider _instance =  DioHttpProvider.internal();

  DioHttpProvider.internal();

  factory DioHttpProvider() => _instance;

  String accessToken = '';

  Future<dynamic> dioGetRequest(String urlPath,
      {Map<String, dynamic>? params, Function(dynamic)? onError}) async {
    print("dioGetRequest $urlPath");
    var responseJson;

    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      "Authorization": accessToken.isEmpty
          ? ""
          : 'Bearer $accessToken',
    };

    try {
      var res = await dio.get(
        urlPath,
        options: Options(headers: headers),
        queryParameters: params,
      );

      debugPrint("DEBUG GET RESPONSE ${res.data}");

      responseJson = _returnResponse(res);
    } on DioError catch (_) {
      debugPrint('$urlPath HAVING ERROR');
      if(_.type == DioErrorType.connectTimeout) throw TimeOutException(message: 'Mất kết nối với internet');
        debugPrint('API ERRROR:${_.response!.data}');
      responseJson = _returnResponse(_.response!);
    }
    return responseJson;
  }

  Future<dynamic> dioPutRequest(String urlPath,
      {body, Map<String, dynamic>? params}) async {
    print("dioPutRequest $urlPath $body");
    var responseJson;

    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      "Authorization": accessToken.isEmpty
          ? ""
          : 'Bearer $accessToken',
    };

    try {
      Response res = await dio.put(
        urlPath,
        data: body,
        options: Options(headers: headers),
        queryParameters: params,
      );
      responseJson = _returnResponse(res);
    } on DioError catch (_) {
      // print("No internet");
      // throw FetchDataException(message: 'No Internet connection');
      debugPrint('API ERRROR:${_.response!.data}');
      responseJson = _returnResponse(_.response!);
    }

    return responseJson;
  }

  Future<dynamic> dioPatchRequest(String urlPath,
      {body, Map<String, dynamic>? params}) async {
    print("dioPatchRequest $urlPath $body $params");
    var responseJson;

    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      "Authorization": accessToken.isEmpty
          ? ""
          : 'Bearer $accessToken',
    };

    try {
      Response res = await dio.patch(
        urlPath,
        data: body,
        options: Options(headers: headers),
        queryParameters: params,
      );
      responseJson = _returnResponse(res);
    } on DioError catch (_) {
      // print("No internet");
      // throw FetchDataException(message: 'No Internet connection');

      debugPrint('$urlPath HAVING ERROR');
      debugPrint('API ERRROR:${_.response!.data}');
      responseJson = _returnResponse(_.response!);
    }

    return responseJson;
  }

  Future<dynamic> dioPostRequest(String urlPath,
      {body, Map<String, dynamic>? params}) async {
    print(
        "dioPostRequest $urlPath -> $body \n$accessToken");
    var responseJson;

    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      "Authorization": accessToken.isEmpty
          ? ""
          : 'Bearer $accessToken',
    };

    try {
      Response res = await dio.post(urlPath,
          data: body,
          queryParameters: params,
          options:
              Options(contentType: Headers.jsonContentType, headers: headers));

      debugPrint("DEBUG POST RESPONSE ${res.data}");

      responseJson = _returnResponse(res);
    } on DioError catch (_) {
      print(_.error);
      if(_.type == DioErrorType.connectTimeout) throw TimeOutException(message: 'Mất kết nối với internet');

      debugPrint('$urlPath HAVING ERROR');
      debugPrint('API ERRROR:${_.response!.data}');
      responseJson = _returnResponse(_.response!);
    }

    return responseJson;
  }

  Future<dynamic> dioDeleteRequest(String urlPath,
      {body, Map<String, dynamic>? params}) async {
    print(
        "dioDeleteRequest $urlPath -> ${JsonEncoder().convert(params)} \n$accessToken");
    var responseJson;

    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      "Authorization": accessToken.isEmpty
          ? ""
          : 'Bearer $accessToken',
    };

    try {
      Response res = await dio.delete(
        urlPath,
        data: body,
        options: Options(headers: headers),
        queryParameters: params,
      );
      responseJson = _returnResponse(res);
    } on DioError catch (_) {
      responseJson = _returnResponse(_.response!);
    }
    return responseJson;
  }

  Future<dynamic> dioUploadSingleFile(
      String urlPath, List<File?> files, VoidCallback onStop,
      {Map<String, dynamic>? params}) async {
    print('dioUploadSingleFile: ${basename(files[0]!.path)}');
    var responseJson;

    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      "Authorization": accessToken.isEmpty
          ? ""
          : 'Bearer $accessToken',
    };

    try {
      Response res = await dio.post(urlPath,
          options: Options(headers: headers),
          data: FormData.fromMap({
//            "filename": basename(files[0].path),
            "avatar": await MultipartFile.fromFile(files[0]!.path,
                filename: basename(files[0]!.path),
                contentType:
                    MediaType.parse(lookupMimeType(basename(files[0]!.path))!)),
          }),
//          queryParameters: params,
//          options: Options(
//            contentType: "multipart/form-data",
//          ),
          onSendProgress: (received, total) {
        if (received == total) {
          onStop();
        }
        if (total != -1) {
          // print('dioUploadSingleFile-/-onSendProgress: ' + (received / total * 100).toStringAsFixed(0) + "%");
        }
      });

      responseJson = _returnResponse(res);
    } on DioError catch (e) {
      print("dioUploadSingleFile ${e.message}");
      throw FetchDataException(message: 'No Internet connection');
    }

    return responseJson;
  }

  Future<dynamic> download(String urlPath, String fileName,
      {Map<String, dynamic>? params, Function(int)? progressCallback}) async {
    String dir = '';
    if (Platform.isIOS) {
      dir = (await getTemporaryDirectory()).path;
    } else {
      dir = '${(await getExternalStorageDirectory())!
              .parent
              .parent
              .parent
              .parent
              .path}/Download';
    }
    print('dioDownload: $dir/$fileName');

    var responseJson;

    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      "Authorization": accessToken.isEmpty
          ? ""
          : 'Bearer $accessToken',
    };

    try {
      String oldPercent = '0';
      Response res = await dio.download(urlPath, '$dir/$fileName',
          queryParameters: params, options: Options(headers: headers),
          onReceiveProgress: (received, total) {
        if (total != -1) {
          if (oldPercent != (received / total * 100).toStringAsFixed(0) &&
              int.parse((received / total * 100).toStringAsFixed(0)) % 10 ==
                  0) {
            oldPercent = (received / total * 100).toStringAsFixed(0);
            progressCallback!(int.parse(oldPercent));
          }
        }
      });
      responseJson = _downloadResponse(res);
    } on DioError catch (_) {
      print("No internet");
      throw FetchDataException(message: 'No Internet connection');
    }

    return responseJson;
  }

  dynamic _downloadResponse(Response response) {
    // if (response == null) {
    //   throw FetchDataException(message: "DOWNLOAD TIME OUT");
    // } else {
    switch (response.statusCode) {
      case 200:
        return response.data;
      default:
        throw FetchDataException(message: 'Download error');
    }
    // }
  }

  dynamic _returnResponse(Response response) {
    // print("_returnResponse $response");
    // if (response == null) {
    //   throw FetchDataException(message: "FETCH DATA TIME OUT");
    // } else {

    String detail ='';
    if(![200,201,202].contains(response.statusCode)){
      if(response.data !=null && response.data['message'] is String)
        detail = response.data['message'];
    }

    switch (response.statusCode) {
      case 200:
        return response.data;
      case 201:
        return response.data;
      case 202:
        return response.data;
      case 400:
        throw BadRequestException(errorCode: 400, message: detail);
      case 401:
        throw MissingTokenException(errorCode: 401, message: detail);
      case 403:
        throw ForbiddenException(errorCode: 403, message: detail);
      case 404:
        throw BadRequestException(errorCode: 404, message: detail);
      case 406:
        throw BadRequestException(errorCode: 406, message: detail);
      case 422:
        throw ValidationException(errorCode: 422, message: detail);
      case 500:
        throw InternalException(errorCode:500, message: detail);
      default:
        print("status code null");
        throw FetchDataException(
            message: 'Error occurred while Communication with Server');
    }
    // }
  }
}
