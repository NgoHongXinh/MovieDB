import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import '../public/global.dart';
import 'base_service.dart';

class ApiDio {
  ApiDio(BuildContext context, [bool? haveAuth]) {
    final BaseOptions options = BaseOptions(
      baseUrl: Global.baseUrl,
      connectTimeout: Global.timeOutApi,
      receiveTimeout: Global.timeOutApi,
    );
    final Dio dio = Dio(options);
    // ignore: avoid_single_cascade_in_expression_statements, cascade_invocations
    // dio..interceptors.add(AuthInterceptor(context, haveAuth));

    // ignore: avoid_single_cascade_in_expression_statements
    dio
      ..interceptors.add(LogInterceptor(
        responseBody: true,
        requestBody: true,
      ));
    baseService = BaseService(dio);
  }

  static ApiDio? instance;
  static BaseService? baseService;

  static BaseService? getInstance(BuildContext context, [bool? haveAuth]) {
    instance = ApiDio(context, haveAuth);
    return _getBaseService();
  }

  static BaseService? _getBaseService() {
    return baseService;
  }

  static Future<dynamic> loadAsset(String linkFile) async {
    return jsonDecode(await rootBundle.loadString(linkFile));
  }
}
//
// class AuthInterceptor extends Interceptor {
//   BuildContext context;
//   bool? haveAuth;
//
//   AuthInterceptor(this.context, this.haveAuth);
//
//   @override
//   onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
//     Map<String, String> headers = {};
//     headers['content-type'] = 'application/json';
//     await SharePreferUtils.getAccessToken().then((String? token) async {
//       if (token != null)
//         // ignore: always_specify_types
//           {
//         String language = await Localizations.localeOf(context).toString();
//         if (haveAuth != false)
//           await SharePreferUtils.getUserInfo().then((value) => {
//             headers['Authorization'] =
//             '${Utils.getCurrentTimeStringRequest()}|${value!.userId}|${value.corpId}|${language}|X-AUTH-TOKEN $token'
//           });
//       }
//     });
//     headers['Connection'] = 'keep-alive';
//     headers['Accept'] = '*/*';
//     headers['Accept-Encoding'] = 'gzip, deflate, br';
//     options.headers = headers;
//     return super.onRequest(options, handler);
//   }
// }