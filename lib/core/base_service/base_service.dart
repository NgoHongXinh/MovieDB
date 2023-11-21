import 'dart:developer';

import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';



class BaseService {
  BaseService(this.dio);

  Dio dio;


  Future<dynamic> createGet(
      String subUri, {
        bool showLoading = true,
        dynamic body,
        required BuildContext context,
      }) async {
    Dio dio = Dio();
    dio
      ..interceptors.add(LogInterceptor(
        responseBody: true,
        requestBody: true,
      ));
    if (body.runtimeType == String) {
      body = body;
    }

    ///internet check
    final ConnectivityResult connectivityResult =
    await Connectivity().checkConnectivity();
    switch (connectivityResult) {
      case ConnectivityResult.none:
        Fluttertoast.showToast(msg: 'no_internet');
        break;
      default:
        break;
    }
    if (showLoading == true) {
      // DialogAlert.showLoading(context);
    }
    try {
      dio.options.headers["Authorization"] =
      "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlNjQ3ZDI3OTFkNWQzNjA5YTA3MGZhYmMzNTNkNjVlZSIsInN1YiI6IjY1NDg1MzQ0OTI0Y2U2MDBjNjFmMTU5ZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.9cjGnsG0uIwK32MxdHLwl6qXJYR_xO1PfM_h8c_Glhg";
      dio.options.headers["accept"] = "application/json";
      final Response<dynamic> response = await dio.get(subUri);
      // DialogAlert.dismissLoading(context);
      return response;
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString().substring(0, 60));
      // DialogAlert.dismissLoading(context);
      // log(e.toString().substring(0, 60));
    }
  }

  Future<dynamic> createPostMovie(
      String subUri, {
        bool showLoading = true,
        dynamic body,
        required BuildContext context,
      })async {
    Dio dio = Dio();
    dio
      ..interceptors.add(LogInterceptor(
        responseBody: true,
        requestBody: true,
      ));

    if (body.runtimeType == String) {
      body = body;
    }

    ///internet check
    final ConnectivityResult connectivityResult =
    await Connectivity().checkConnectivity();
    switch (connectivityResult) {
      case ConnectivityResult.none:
        // Fluttertoast.showToast(msg: Translate.text("no_internet"));
        // showLoading == true ? DialogAlert.dismissLoading(context) : null;
        // Utils.goHome(context);
        break;
      default:
        break;
    }
    if (showLoading == true) {
      // DialogAlert.showLoading(context);
    }
    try {
      dio.options.headers["Authorization"] =
      "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlNjQ3ZDI3OTFkNWQzNjA5YTA3MGZhYmMzNTNkNjVlZSIsInN1YiI6IjY1NDg1MzQ0OTI0Y2U2MDBjNjFmMTU5ZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.9cjGnsG0uIwK32MxdHLwl6qXJYR_xO1PfM_h8c_Glhg";
      dio.options.headers["accept"] = "application/json";
      final Response<dynamic> response =
      await dio.post<dynamic>(subUri, data: body ?? {});
      // if (showLoading == true) {
      //   DialogAlert.dismissLoading(context);
      // }

      return response;
    } catch (e) {
      // showLoading == true ? DialogAlert.dismissLoading(context) : null;
      // Utils.showSmartOTPDialog(
      //     context: context, content: Translate.text("SMNR"));
      log(e.toString().substring(0, 60));
    }
  }
}