import 'dart:convert';
import 'dart:io' show File, Platform;
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'global.dart';

class Utils with ChangeNotifier {

  static Future<String?> getDeviceId() async {
    var deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      IosDeviceInfo iosDeviceInfo = await deviceInfo.iosInfo;
      Global.deviceInformation = iosDeviceInfo;
      return iosDeviceInfo.identifierForVendor; // unique ID on iOS
    } else {
      AndroidDeviceInfo androidDeviceInfo = await deviceInfo.androidInfo;
      Global.deviceInformation = androidDeviceInfo;
      return androidDeviceInfo.androidId; // unique ID on Android
    }
  }

  static Future<String?> getDeviceName() async {
    var deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      IosDeviceInfo iosDeviceInfo = await deviceInfo.iosInfo;
      Global.deviceInformation = iosDeviceInfo;
      return iosDeviceInfo.utsname.machine; // unique ID on iOS
    } else {
      AndroidDeviceInfo androidDeviceInfo = await deviceInfo.androidInfo;
      Global.deviceInformation = androidDeviceInfo;
      return androidDeviceInfo.model; // unique ID on Android
    }
  }

  static sha256Convert(String s) {
    return sha256.convert(utf8.encode(s)).toString();
  }


}
