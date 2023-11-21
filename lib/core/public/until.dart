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
  // List<InputModel> listInput = [];
  // static const String KEY_CHECK = "KEY_CHECK";
  // static const String KEY_CHECK_BACKFROUND = "KEY_CHECK_BACKFROUND";

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

//   static String getCurrentTimeStringRequest() {
//     final DateTime nowDate = DateTime.now();
//     return nowDate.year.toString() +
//         format2Digit(nowDate.month) +
//         format2Digit(nowDate.day) +
//         format2Digit(nowDate.hour) +
//         format2Digit(nowDate.minute) +
//         format2Digit(nowDate.second);
//   }
//
//   /// sample: 2 => 02 */
//   static String format2Digit(int n) {
//     if (n < 10) {
//       return '0' + n.toString();
//     } else {
//       return n.toString();
//     }
//   }
//
//   static Future<DateTime> checkDateTimeGlobal(BuildContext context) async {
//     DateTime dateTime = DateTime.now();
//     Dio dio = Dio();
//     DialogAlert.showLoading(context);
//     Response response = await dio.get<dynamic>(Constants.GET_WORLD_TIME_API);
//
//     DialogAlert.dismissLoading(context);
//     Map data = jsonDecode(response.toString());
//     print("$data");
//     String dateTimeRaw = data['datetime'];
//     dateTime = DateTime.parse(dateTimeRaw);
//     return dateTime;
//   }
//
//   static Future<String> getCheckToPreferences() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     return prefs.getString(KEY_CHECK) ?? "";
//   }
//
//   static Future<String> getCheckToPreferencesBackGround() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     return prefs.getString(KEY_CHECK_BACKFROUND) ?? "";
//   }
//
//   static Future<void> showDialogChangePassSuccess(
//       {required String message, required BuildContext context}) async {
//     await showDialog(
//         context: context,
//         // barrierDismissible: false,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             insetPadding: EdgeInsets.all(width_16),
//             shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(12.0))),
//             contentPadding: EdgeInsets.zero,
//             actionsPadding: EdgeInsets.zero,
//             buttonPadding: EdgeInsets.zero,
//             backgroundColor: Colors.white,
//             content: Container(
//               width: MediaQuery.of(context).size.width,
//               // height: MediaQuery.of(context).size.height * 0.6,
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Image.asset(
//                     "assets/png/change_pass_success.png",
//                     width: MediaQuery.of(context).size.width,
//                     height: MediaQuery.of(context).size.height * 0.3,
//                   ),
//                   Container(
//                     child: Text(
//                       Translate.text("Đổi mật khẩu thành công"),
//                       style: TextStyle(
//                           fontSize: fontSize_20,
//                           fontWeight: FontWeight.w800,
//                           color: secondary_0072BC),
//                     ),
//                   ),
//                   Container(
//                     margin: EdgeInsets.only(top: height_12),
//                     child: Text(
//                       Translate.text("Vui lòng đăng nhập bằng mật khẩu mới"),
//                       style: TextStyle(
//                           fontSize: fontSize_13, color: Color(0xFF82869E)),
//                     ),
//                   ),
//                   // Spacer(),
//                   ButtonCommon(
//                       buttonModel: ButtonModel(
//                           width: MediaQuery.of(context).size.width,
//                           title: Translate.text("Về đăng nhập"),
//                           textColor: Colors.black,
//                           margin: EdgeInsets.only(
//                               left: width_16,
//                               bottom: height_16,
//                               right: width_16,
//                               top: height_24),
//                           onPressed: () {
//                             Utils.goHome(context);
//                           },
//                           color: primary_FFC709)),
//                 ],
//               ),
//             ),
//           );
//         });
//   }
//
//   static Future<String> showDialogCustom(
//       {bool? isNum,
//         bool? isSmartOTP,
//         bool? cancelEnable,
//         bool? isBtnFullWidth,
//         bool? isReject,
//         String? title,
//         String? textFucn,
//         String? titleBold,
//         String? urlImg,
//         String? textBackBtn,
//         required String message,
//         List<String>? messageChild,
//         dynamic onpress,
//         Future<void>? againFunc,
//         Function()? updateFunc,
//         required BuildContext context}) async {
//     TextEditingController popup_val = TextEditingController();
//     String resultText = '';
//     await showDialog<String>(
//       barrierDismissible: false,
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           shape:RoundedRectangleBorder(
//             borderRadius:BorderRadius.all(Radius.circular(width_12)),
//           ),
//           title: Center(
//             child: Text(
//               title == '' ? "" : (title != null)
//                   ? Translate.text("${title}")
//                   : Translate.text("notice"),
//               style: PrimaryFont.bold(fontSize_18).copyWith(color: Color(0xFF0072BC)),
//             ),
//           ),
//           content: SingleChildScrollView(
//             child: ListBody(
//               children: <Widget>[
//                 (isReject == true)
//                     ? InputCommon(
//                   inputModel: InputModel(
//                       title: Translate.text("reason_description_request"),
//                       controller: popup_val),
//                 )
//                     : (isSmartOTP == true)
//                     ? Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       Container(
//                         width: width_24,
//                         height: width_24,
//                         decoration: BoxDecoration(
//                             color: Colors.grey.withOpacity(0.1),
//                             borderRadius: BorderRadius.circular(8)),
//                         child: Center(
//                           child: Text(
//                             message[0],
//                             style: TextStyle(
//                                 fontSize: fontSize_14,
//                                 color: Colors.black),
//                           ),
//                         ),
//                       ),
//                       Container(
//                         width: width_24,
//                         height: width_24,
//                         decoration: BoxDecoration(
//                             color: Colors.grey.withOpacity(0.1),
//                             borderRadius: BorderRadius.circular(8)),
//                         child: Center(
//                           child: Text(
//                             message[1],
//                             style: TextStyle(
//                                 fontSize: fontSize_14,
//                                 color: Colors.black),
//                           ),
//                         ),
//                       ),
//                       Container(
//                         width: width_24,
//                         height: width_24,
//                         decoration: BoxDecoration(
//                             color: Colors.grey.withOpacity(0.1),
//                             borderRadius: BorderRadius.circular(8)),
//                         child: Center(
//                           child: Text(
//                             message[2],
//                             style: TextStyle(
//                                 fontSize: fontSize_14,
//                                 color: Colors.black),
//                           ),
//                         ),
//                       ),
//                       Container(
//                         width: width_24,
//                         height: width_24,
//                         decoration: BoxDecoration(
//                             color: Colors.grey.withOpacity(0.1),
//                             borderRadius: BorderRadius.circular(8)),
//                         child: Center(
//                           child: Text(
//                             message[3],
//                             style: TextStyle(
//                                 fontSize: fontSize_14,
//                                 color: Colors.black),
//                           ),
//                         ),
//                       ),
//                       Container(
//                         width: width_24,
//                         height: width_24,
//                         decoration: BoxDecoration(
//                             color: Colors.grey.withOpacity(0.1),
//                             borderRadius: BorderRadius.circular(8)),
//                         child: Center(
//                           child: Text(
//                             message[4],
//                             style: TextStyle(
//                                 fontSize: fontSize_14,
//                                 color: Colors.black),
//                           ),
//                         ),
//                       ),
//                       Container(
//                         width: width_24,
//                         height: width_24,
//                         decoration: BoxDecoration(
//                             color: Colors.grey.withOpacity(0.1),
//                             borderRadius: BorderRadius.circular(8)),
//                         child: Center(
//                           child: Text(
//                             message[5],
//                             style: TextStyle(
//                                 fontSize: fontSize_14,
//                                 color: Colors.black),
//                           ),
//                         ),
//                       ),
//                     ])
//                     : Container(
//                   child: Column(
//                     children: [
//                       urlImg != null ?
//                       Column(
//                         children: [
//                           // SvgPicture.asset(
//                           //   'assets/svg/passwordsucc.svg',
//                           //   // width: width_20,
//                           //   // height: width_20,
//                           //   fit:BoxFit.contain,
//                           // ),
//                           Image(image: AssetImage('assets/png/Password.png'), fit: BoxFit.cover),
//                           SizedBox(
//                             height: width_4,
//                           ),
//                         ],
//                       )
//                           :
//                       Container(),
//                       titleBold != null ?
//                       Column(
//                         children: [
//                           Text(Translate.text("${titleBold}"),
//                               style: PrimaryFont.medium(fontSize_18)
//                                   .copyWith(color: Color(0xFF0072BC))),
//                           SizedBox(
//                             height: width_4,
//                           ),
//                         ],
//                       )
//                           :
//                       Container(),
//                       Container(
//                         alignment: Alignment.center,
//                         child: RichText(
//                           textAlign: TextAlign.center,
//                           text: TextSpan(
//
//                               text: Translate.text("${message}"),
//                               style: TextStyle(fontWeight: FontWeight.w400, color: black_000000, fontSize: fontSize_12,),
//                               children:
//                               messageChild != null
//                                   ?
//                               <TextSpan>[
//                                 TextSpan(text: " ${Translate.text("${messageChild[0]}")} ", style: TextStyle(fontWeight: FontWeight.w400, color: Color(0xFF0072BC), fontSize: fontSize_12)),
//                                 TextSpan(text: Translate.text("${messageChild[1]}"), style: TextStyle(fontWeight: FontWeight.w400, color: black_000000, fontSize: fontSize_12)),
//                               ]
//                                   :
//                               <TextSpan>[
//                                 TextSpan(text: ""),
//                               ]
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           actions: <Widget>[
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 (cancelEnable != null && cancelEnable == true)
//                     ? TextButton(
//                   onPressed: () {
//                     resultText = 'NO';
//                     Navigator.of(context).pop(resultText);
//                   },
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: Colors.transparent,
//                       border: Border.all(width: width_1, color: colorBGCardWidget10),
//                       borderRadius: BorderRadius.all(Radius.circular(8)),
//                     ),
//                     child: Container(
//                       width: MediaQuery. of(context). size. width * .3,
//                       padding: EdgeInsets.symmetric(vertical: height_16, horizontal: width_8),
//                       alignment: Alignment.center,
//                       child: textBackBtn != null
//                           ?
//                       Text(Translate.text("${textBackBtn}"),
//                           style: PrimaryFont.medium(fontSize_13)
//                               .copyWith(color: Color(0xFF1B1D29)))
//                           :
//                       Text(Translate.text("close"),
//                           style: PrimaryFont.medium(fontSize_13)
//                               .copyWith(color: Color(0xFF1B1D29))),
//                     ),
//                   ),
//                 )
//                     : Container(),
//
//                 TextButton(
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: Color(0xFFFFC709),
//                       // border: Border.all(width: width_1, color: colorBGCardWidget10),
//                       borderRadius: BorderRadius.all(Radius.circular(8)),
//                     ),
//                     child: Container(
//                       alignment: Alignment.center,
//                       width: (isBtnFullWidth != null && isBtnFullWidth == true) ? MediaQuery. of(context). size. width * .65 : MediaQuery. of(context). size. width * .3,
//                       padding: EdgeInsets.symmetric(vertical: height_18, horizontal: width_8),
//                       child: Text(
//                         (textFucn != null)
//                             ? Translate.text("${textFucn}")
//                             : Translate.text("common.ok"),
//                         style: PrimaryFont.medium(fontSize_13).copyWith(color: Color(0xFF1B1D29)),
//                       ),
//                     ),
//                   ),
//                   onPressed: updateFunc ?? () {
//                     // resultText = 'YES';
//                     if (popup_val.text.isEmpty && isReject == true) {
//                       showDialog(
//                           context: context,
//                           builder: (BuildContext context) {
//                             return AlertDialog(
//                               title: Text(Translate.text("error")),
//                               content: Text(
//                                   Translate.text("reason_description_request")),
//                               actions: [
//                                 TextButton(
//                                     onPressed: () => Navigator.pop(context),
//                                     child: Text(
//                                       Translate.text('common.ok'),
//                                       style: TextStyle(fontSize: fontSize_14),
//                                     )),
//                               ],
//                             );
//                           });
//                     } else {
//                       againFunc == null
//                           ? Navigator.of(context, rootNavigator: true)
//                           .pop(popup_val.text)
//                           : againFunc;
//                     }
//                   },
//                 ),
//               ],
//             )
//           ],
//         );
//       },
//     ).then((result) => resultText = result.toString());
//     return resultText;
//   }
//
//   static Future<String> showForgotPINDialog(BuildContext context) async {
//     String result = '';
//     await showDialog(
//       barrierDismissible: true,
//       context: context,
//       builder: (context) => AlertDialog(
//         contentPadding: EdgeInsets.all(width_16),
//         shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.all(Radius.circular(8.0))),
//         title: Container(
//           child: Center(
//               child: Text(Translate.text("pin_forget"),
//                   style: TextStyle(fontSize: fontSize_18,fontWeight: FontWeight.w700))),
//         ),
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             // Container(
//             //   margin: EdgeInsets.only(bottom: height_16),
//             //   child: RichText(
//             //     textAlign: TextAlign.center,
//             //     text: TextSpan(
//             //       text: '',
//             //       children: <TextSpan>[
//             //         TextSpan(
//             //           text: Translate.text("please_call_hotline"),
//             //           style: TextStyle(
//             //             fontSize: fontSize_14,
//             //             color: black_000000,
//             //           ),
//             //         ),
//             //         TextSpan(
//             //             text: Translate.text('hotline_number'),
//             //             recognizer: TapGestureRecognizer()..onTap = () {},
//             //             style: TextStyle(
//             //               color: Colors.blue,
//             //               fontSize: fontSize_14,
//             //             )),
//             //         TextSpan(
//             //           text: Translate.text(
//             //             'support_message',
//             //           ),
//             //           style: TextStyle(
//             //             color: black_000000,
//             //             fontSize: fontSize_14,
//             //           ),
//             //         ),
//             //       ],
//             //     ),
//             //   ),
//             // ),
//             Container(
//               margin: EdgeInsets.only(bottom: height_16),
//               child: Text(Translate.text("please_contact"),style: TextStyle(
//                 fontSize: fontSize_13,
//                 color: Colors.black,
//               ),textAlign: TextAlign.center,),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Container(
//                   decoration: BoxDecoration(
//                       border: Border.all(color: Colors.grey),
//                       borderRadius: BorderRadius.circular(8)),
//                   child: GestureDetector(
//                     onTap: () => launchUrl(
//                         Uri.parse('https://www.pvcombank.com.vn/mang-luoi')),
//                     child: CustomButton(
//                       context: context,
//                       color: white_FFFFFF,
//                       width: MediaQuery.of(context).size.width * 0.32,
//                       displayText: Translate.text("find_pvbank"),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.only(right: 8),
//                   child: GestureDetector(
//                     onTap: () => launchUrl(Uri.parse("tel:1900555592")),
//                     child: CustomButton(
//                         context: context,
//                         color: primary_FEB900,
//                         // icon: SvgPicture.asset('assets/svg/call.svg'),
//                         displayText: Translate.text("hotline_call"),
//                         width:  MediaQuery.of(context).size.width * 0.32),
//                   ),
//                 ),
//               ],
//             ),
//             Center(
//               child: Container(
//                 margin: EdgeInsets.only(top: height_16),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     // SvgPicture.asset("assets/svg/map.svg"),
//                     // Padding(padding: EdgeInsets.only(right: width_8)),
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//     return result;
//   }
//
//   static Future<String> showSmartOTPDialog({
//     required BuildContext context,
//     String? title,
//     bool isBtnFullWidth = false,
//     String? content,
//     String? buttonContent,
//     String? buttonContentfirst,
//     String? buttonContentSecond,
//     Color? colorButton,
//     Function()? evenModalfirst,
//     Function()? evenModalSecond,
//     bool isErrorPass = false,
//     bool isShowBtn = true,
//     bool isDoubleBtn = false,
//     List<String>? listContent,
//     SvgPicture? iconBtnSecond,
//     String? countLoginFail,
//   }) async {
//     await showDialog(
//       barrierDismissible: false,
//       context: context,
//       builder: (context) => AlertDialog(
//         shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.all(Radius.circular(8.0))),
//         title: Container(
//           child: Center(
//               child: Text(title ?? Translate.text("notice"),
//                   textAlign: TextAlign.center,
//                   style: TextStyle(fontSize: fontSize_18, color: Color(0xFF0072BC), fontWeight: FontWeight.w700))),
//         ),
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             isErrorPass
//                 ?
//             Container(
//               width:MediaQuery. of(context). size. width ,
//               child: Column(
//                 children: [
//                   Text(Translate.text("err_pass_smart"),
//                       textAlign: TextAlign.center,
//                       style: TextStyle(fontSize: fontSize_13, color: Color(0xFF313442), fontWeight: FontWeight.w400)),
//                   SizedBox(
//                     height: height_14,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text("${Translate.text("remaining_times")}: ",
//                           textAlign: TextAlign.center,
//                           style: TextStyle(fontSize: fontSize_13, color: Color(0xFF313442), fontWeight: FontWeight.w400)),
//                       Text("${countLoginFail}",
//                           textAlign: TextAlign.center,
//                           style: TextStyle(fontSize: fontSize_13, color: Colors.red, fontWeight: FontWeight.w400)),
//                     ],
//                   ),
//                   SizedBox(
//                     height: height_16,
//                   ),
//                 ],
//               ),
//             )
//                 :
//             listContent != null ?
//             Column(
//               children: [
//                 Container(
//                   alignment: Alignment.center,
//                   child: RichText(
//                     textAlign: TextAlign.center,
//                     text: TextSpan(
//                         children:
//                         <TextSpan>[
//                           TextSpan(text: " ${Translate.text("${listContent[0]}")}", style: TextStyle(fontWeight: FontWeight.w400, color: Color(0xFF313442), fontSize: fontSize_13, height: height_1_5)),
//                           TextSpan(text: " ${Translate.text("${listContent[1]}")} ", style: TextStyle(fontWeight: FontWeight.w400, color: Color(0xFF0072BC), fontSize: fontSize_13,)),
//                           TextSpan(text: Translate.text("${listContent[2]}"), style: TextStyle(fontWeight: FontWeight.w400, color: Color(0xFF313442), fontSize: fontSize_13)),
//                         ]
//
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: height_16,
//                 ),
//               ],
//             )
//                 :
//             Container(
//               margin: EdgeInsets.only(bottom: height_24),
//               child: Text(content ?? Translate.text("content"),
//                   textAlign: TextAlign.center,
//                   style: TextStyle(fontSize: fontSize_14)),
//             ),
//             isShowBtn
//                 ? Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 isDoubleBtn == true ?
//                 GestureDetector(
//                   onTap:  evenModalfirst ?? () { Navigator.pop(context);},
//                   child: CustomButton(
//                     context: context,
//                     color:  Colors.transparent,
//                     displayText: buttonContentfirst != null ? buttonContentfirst :  buttonContent ?? Translate.text("forgot_pass"),
//                     width: (isBtnFullWidth == false && isDoubleBtn == true) ? MediaQuery. of(context). size. width * .32 :  MediaQuery. of(context). size. width * .65 ,
//                   ),
//                 )
//                     :
//                 Container(),
//                 GestureDetector(
//                   onTap:  evenModalSecond ?? () => Navigator.pop(context),
//                   child: CustomButton(
//                     icon: iconBtnSecond != null ? iconBtnSecond : null,
//                     context: context,
//                     color:  primary_FEB900,
//                     displayText: buttonContentSecond != null ? buttonContentSecond :  buttonContent ?? Translate.text("common.ok"),
//                     width: (isBtnFullWidth == false && isDoubleBtn == true) ? MediaQuery. of(context). size. width * .32 :  MediaQuery. of(context). size. width * .65 ,
//                   ),
//                 ),
//               ],
//             )
//                 : Container(),
//           ],
//         ),
//       ),
//     );
//     return '';
//   }
//
//   static void goHome(BuildContext context) {
//     Navigator.pushNamedAndRemoveUntil(
//         context, LoginScreen.routeName, (route) => false);
//   }
//
//   static Future<dynamic> showBottomSheet(
//       {required BuildContext context,
//         List<dynamic>? valueList,
//         int? defaultPosition,
//         bool isDismissible = true,
//         String? listTitle,
//         Widget? child,
//         bool? enableDrag,
//         required bool hasSearch}) async {
//     // FocusScope.of(context).requestFocus(FocusNode());
//     dynamic result = null;
//     result = await showModalBottomSheet<dynamic>(
//       isScrollControlled: true,
//       isDismissible: isDismissible,
//       enableDrag: isDismissible,
//       context: context,
//       backgroundColor: Colors.transparent,
//       builder: (BuildContext context) =>
//       child ??
//           BottomSheetSelectWidget(
//             posSelected: defaultPosition ?? -1,
//             list: valueList ?? [],
//             title: listTitle ?? '',
//             hasSearch: hasSearch,
//           ),
//     );
//     return result;
//   }
//
//   static Future<TransLimitModel> inquiryTransLimit(
//       String moduleId, String serviceType, BuildContext context) async {
//     TransLimitModel resutlTransLitmi = TransLimitModel();
//     try {
//       final res = await ApiDio.getInstance(context)!
//           .createPost(Global.baseUrl + UrlStatic.API_TRANS_LIMIT,
//           showLoading: true,
//           body: {
//             "moduleId": moduleId,
//             "serviceType": serviceType,
//           },
//           context: context);
//       Map jsonRes = jsonDecode(res.toString());
//       if (jsonRes["responseCode"] == "TRLM00") {
//         resutlTransLitmi =
//             TransLimitModel.fromJson(jsonDecode(jsonRes["object"]));
//       }
//       return resutlTransLitmi;
//     } catch (e) {
//       return resutlTransLitmi;
//     }
//   }
//
//   static formatText(data) {
//     var str = data;
//     str = str.replaceAll(RegExp(r"(\à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ)"), 'a');
//     str = str.replaceAll(RegExp(r"(\À|Á|Ạ|Ả|Ã|Â|Ầ|Ấ|Ậ|Ẩ|Ẫ|Ă|Ằ|Ắ|Ặ|Ẳ|Ẵ)"), 'A');
//     str = str.replaceAll(RegExp(r"(\è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ)"), 'e');
//     str = str.replaceAll(RegExp(r"(\ì|í|ị|ỉ|ĩ)"), 'i');
//     str = str.replaceAll(RegExp(r"(\ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ)"), 'o');
//     str = str.replaceAll(RegExp(r"(\ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ)"), 'u');
//     str = str.replaceAll(RegExp(r"(\ỳ|ý|ỵ|ỷ|ỹ)"), 'y');
//     str = str.replaceAll(RegExp(r"(\đ)"), 'd');
//     str = str.replaceAll(RegExp(r"(\È|É|Ẹ|Ẻ|Ẽ|Ê|Ề|Ế|Ệ|Ể|Ễ)"), 'E');
//     str = str.replaceAll(RegExp(r"(\Ì|Í|Ị|Ỉ|Ĩ)"), 'I');
//     str = str.replaceAll(RegExp(r"(\Ò|Ó|Ọ|Ỏ|Õ|Ô|Ồ|Ố|Ộ|Ổ|Ỗ|Ơ|Ờ|Ớ|Ợ|Ở|Ỡ)"), 'O');
//     str = str.replaceAll(RegExp(r"(\Ù|Ú|Ụ|Ủ|Ũ|Ư|Ừ|Ứ|Ự|Ử|Ữ)"), 'U');
//     str = str.replaceAll(RegExp(r"(\Ỳ|Ý|Ỵ|Ỷ|Ỹ)"), 'Y');
//     str = str.replaceAll(RegExp(r"(\Đ)"), 'D');
//     return str;
//   }
//
//   static String generateMd5(String input) {
//     return md5.convert(utf8.encode(input)).toString();
//   }
//
//   static String aesEncrypt(String plainTextInput){
//     final plainText = plainTextInput;
//     final key = encrypt.Key.fromUtf8('1234567891234567');
//     final iv = encrypt.IV.fromLength(16);
//
//     final encrypter = encrypt.Encrypter(encrypt.AES(key, mode: encrypt.AESMode.cbc));
//
//     final encrypted = encrypter.encrypt(plainText, iv: iv);
//
//     String encryptedString = base64.encode(encrypted.bytes);
//
//     return encryptedString;
//   }
//
//   static String moneyFormat(String price) {
//     if (price.length > 2) {
//       var value = price;
//       value = value.replaceAll(RegExp(r'\D'), '');
//       value = value.replaceAll(RegExp(r'\B(?=(\d{3})+(?!\d))'), ',');
//       return value;
//     } else {
//       return price;
//     }
//   }
//
//   static fomartMoneyCurrency(String price, String curruncy) {
//     String textPrice = moneyFormat(price) + "/" + curruncy;
//
//     return textPrice; // 10,000 VND
//   }
//
//   static String getWithoutSpacesFirstAndLast(String s) {
//     String tmp = s;
//     while (tmp.startsWith(' ')) {
//       tmp = tmp.substring(1);
//     }
//     while (tmp.endsWith(' ')) {
//       tmp = tmp.substring(0, tmp.length - 1);
//     }
//
//     return tmp;
//   }
//
//   static String getCurrentTimeConvertString(nowDate) {
//     // final DateTime nowDate = DateTime.now();
//     return nowDate.year.toString() +
//         format2Digit(nowDate.month) +
//         format2Digit(nowDate.day) +
//         format2Digit(nowDate.hour) +
//         format2Digit(nowDate.minute) +
//         format2Digit(nowDate.second);
//   }
//
//   static String enCry(String userName, String pass) {
//     int start = int.parse(userName.substring(5, 6));
//     int end = int.parse(userName.substring(userName.length - 1));
//     if (start == end && (end == 0 || end == '0')) {
//       start = 5;
//       end = 8;
//     }
//     return randomString(end) + pass + randomString(start);
//   }
//
// // "f4fc8a416f8be148db91d57412cc34a0"
//   static String randomString(int numbers) {
//     String text = "";
//     const String possible =
//         'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
//
//     for (var i = 0; i < numbers; i++) {
//       // text +=
//       //     charAt(possible, (Random().nextDouble() * possible.length).round());
//       var dom = Random().nextDouble();
//       var random = dom * possible.length;
//
//       var flo = random.floor();
//       text += charAt(possible, flo);
//     }
//     return text;
//   }
//
//   static String charAt(String subject, int position) {
//     if (subject is! String ||
//         subject.length <= position ||
//         subject.length + position < 0) {
//       return '';
//     }
//     final int _realPosition =
//     position < 0 ? subject.length + position : position;
//     return subject[_realPosition];
//   }
//
//   static dynamic convertStringToJson(String data) {
//     return jsonDecode(data);
//   }
//
//   static String trimText(String text) {
//     String textStr;
//     textStr = text.trim();
//     return textStr;
//   }
//
//   static String formatCurrency(String text) {
//     if (text != '') {
//       bool hasSub = text[0] == "-";
//       if (text.contains(".")) {
//         text = text.substring(0, text.indexOf("."));
//       }
//       if (text.length > 2) {
//         if (text[0] == "0") {
//           text = text.substring(1, text.length);
//         }
//         var value = text;
//         value = value.replaceAll(RegExp(r'\D'), '');
//         value = value.replaceAll(RegExp(r'\B(?=(\d{3})+(?!\d))'), ',');
//         if (hasSub) {
//           return "- " + value;
//         } else {
//           return value;
//         }
//       }
//       if (hasSub) {
//         return "-" +
//             text.replaceAll(
//                 RegExp(r'\D'), ''); // nhập không phải là số thì xóa hết
//       } else {
//         return text.replaceAll(
//             RegExp(r'\D'), ''); // nhập không phải là số thì xóa hết
//       }
//     } else {
//       return '';
//     }
//
//     /// Check xem có dấu trừ ở trươc không để trả về cả dấu "-"
//   }
//
//   static String formatCurrencyTonNumberString(String text) {
//     return text.replaceAll(RegExp(r'\D'), '');
//   }
//
//   static String formatStringBalanceSplit(String text) {
//     String balance = text.split("/")[0];
//     if (balance != null) {
//       return balance;
//     }
//     return "0";
//   }
//
//   static String generateConvertDevice(String dataIn, signature) {
//     var encodedKey = utf8.encode(signature); // signature=encryption key
//     var hmacSha256 = new Hmac(sha256, encodedKey); // HMAC-SHA256 with key
//     var bytesDataIn = utf8.encode(dataIn); // encode the data to Unicode.
//     var digest = hmacSha256.convert(bytesDataIn); // encrypt target data
//     String singedValue = digest.toString();
//     return singedValue;
//   }
//
// // * mauld start
// // kiểm tra chuỗi có phải là số hay không
//   static bool isNumeric(String s) {
//     try {
//       if (s == null || s == '') {
//         return false;
//       }
//       return double.parse(s) != null;
//     } catch (e) {
//       return false;
//     }
//   }
//
//   // format số tiền có chứa phần thập phân
//   static formatDecimalCurrency(String valueStr, bool isAllowZero) {
//     try {
//       String val = valueStr;
//       String firstVal;
//       String secordVal;
//       if (val.toString().indexOf('.') > 0) {
//         firstVal =
//             valueStr.substring(0, val.indexOf('.')).replaceAll('/\D/g', '');
//         secordVal =
//             val.substring(val.indexOf('.'), val.length).replaceAll('/\D/g', '');
//         if (secordVal.length > 2) {
//           if (secordVal.length >= 3) {
//             secordVal = secordVal.substring(0, 3);
//           } else {
//             secordVal = secordVal.substring(0, 2);
//           }
//         }
//         if (isAllowZero && secordVal.length == 2 && secordVal.contains('0')) {
//           secordVal = '';
//         }
//         val = formatCurrency(firstVal) + secordVal;
//       } else {
//         val = formatCurrency(valueStr.toString().replaceAll('/\D/g', ''));
//       }
//       return val;
//     } catch (e) {
//       throw e;
//     }
//   }
//
//   formatComma(String s) {
//     String valueStr = s.toString().replaceAll('/\$|\,/g', '');
//     if (!isNumeric(valueStr)) {
//       return valueStr = "";
//     }
//     int number = int.parse(valueStr);
//     number = (number * 100 + 0.50000000001).floor();
//     number = (number / 100).floor();
//     valueStr = number.toString();
//     for (var i = 0; i < ((valueStr.length - (1 + i)).floor() / 3); i++)
//       valueStr = valueStr.substring(0, valueStr.length - (4 * i + 3)) +
//           ',' +
//           valueStr.substring(valueStr.length - (4 * i + 3));
//     return valueStr;
//   }
//
//   static bool isAfterByDay(DateTime start, DateTime end) {
//     // so sánh năm
//     if (start.year > end.year) {
//       return true;
//     }
//     if (start.year < end.year) {
//       return false;
//     }
//     // so sánh tháng
//     if (start.month > end.month) {
//       return true;
//     }
//     if (start.month < end.month) {
//       return false;
//     }
//     // so sánh ngày
//     if (start.day > end.day) {
//       return true;
//     }
//     if (start.day < end.day) {
//       return false;
//     }
//     return false;
//   }
//
//   static bool isSameByDay(DateTime start, DateTime end) {
//     // so sánh năm
//     if (start.year == end.year &&
//         start.month == end.month &&
//         start.day == end.day) {
//       return true;
//     }
//     return false;
//   }
//
//   // Tổng số ngày
//   static bool checkMaxDateInYear(String startDate, String endDate) {
//     print("vaoday");
//     DateTime start = new DateFormat("dd/MM/yyyy").parse(startDate);
//     DateTime end = new DateFormat("dd/MM/yyyy").parse(endDate);
//     Duration duration = end.difference(start);
//     int totalDays = duration.inDays;
//     print("totalDays ${totalDays}");
//     int yearDays = isLeapYear(end.year) ? 366 : 365;
//     print(totalDays);
//     return totalDays > yearDays ? true : false;
//   }
//
//   //check năm nhuận
//   static bool isLeapYear(int year) {
//     return (year % 4 == 0) && (year % 100 != 0 || year % 400 == 0);
//   }
//
//   static formatDateSelect(dynamic valueDate) {
//     return DateFormat('dd/MM/yyyy').format(valueDate);
//   }
//
//   static String formatDateConjoined(String valueDate) {
//     String outputDate = valueDate;
//     List<String> splitDate = valueDate.split("");
//     switch(splitDate.length) {
//       case 6: {
//         outputDate = splitDate[0] + splitDate[1] + "/" + splitDate[2] + splitDate[3] + splitDate[4] + splitDate[5];
//       }
//       return outputDate;
//
//       case 8: {
//         outputDate = splitDate[0] + splitDate[1] + "/" + splitDate[2] + splitDate[3] + "/" + splitDate[4] + splitDate[5] + splitDate[6] + splitDate[7];
//       }
//       return outputDate;
//
//       default: {
//       }
//       return outputDate;
//     }
//   }
//
//   static int diffInDays(DateTime date1, DateTime date2) {
//     return ((date1.difference(date2) -
//         Duration(hours: date1.hour) +
//         Duration(hours: date2.hour))
//         .inHours /
//         24)
//         .round();
//   }
//
//   static bool isInteger(num value) =>
//       value is int || value == value.roundToDouble();
//
//   /* tính tuổi theo năm */
//   static int calculateAge(DateTime startDate, DateTime endDate) {
//     int age = endDate.year - startDate.year;
//     int month1 = endDate.month;
//     int month2 = startDate.month;
//     if (month2 > month1) {
//       age--;
//     } else if (month1 == month2) {
//       int day1 = endDate.day;
//       int day2 = startDate.day;
//       if (day2 > day1) {
//         age--;
//       }
//     }
//     return age;
//   }
//
// //* mauld end
//
//   static timeStampDate() {
//     return DateTime.now().millisecondsSinceEpoch.toString();
//   }
//
//
//   static String maskString(String strText, int start, int end, String maskChar){
//     if(strText.isEmpty || strText == ""){
//       return "";
//     }
//     if(start < 0){
//       start = 0;
//     }
//     if(end > strText.length){
//       end = strText.length;
//     }
//     if(start > end){
//       return strText;
//     }
//     int maskLength = end - start;
//
//     if(maskLength == 0){
//       return strText;
//     }
//     String strMaskString = strText.replaceRange(start, end, maskChar);
//     return strMaskString;
//   }
//
//   static String formatDatebyTypeDate(int dateType){
//     final DateTime changeToDate = DateTime.fromMillisecondsSinceEpoch(dateType);
//     String dateFormat = DateFormat('dd/MM/yyyy - HH:mm').format(changeToDate).toString();
//     return dateFormat;
//   }
//
//
//   static Future<void> viewPDFFile(BuildContext context, String path, String filename) async {
//     final data = await rootBundle.load(path);
//     final bytes = data.buffer.asUint8List();
//     final dir = await getApplicationDocumentsDirectory();
//     File file = File('${dir.path}/$filename');
//     await file.writeAsBytes(bytes, flush: true);
//     Navigator.of(context).push(
//         MaterialPageRoute(builder: (context) => PDFViewerPage(file: file)));
//   }
//
//   static String addSpacesToCardNumber(String cardNumber) {
//     // Lấy các phần tử trong chuỗi
//     String firstPart = cardNumber.substring(0, 6);
//     String middlePart = cardNumber.substring(6, cardNumber.length - 4);
//     String lastPart = cardNumber.substring(cardNumber.length - 4);
//     String formattedCardNumber = '$firstPart $middlePart $lastPart';
//     return formattedCardNumber.trim();
//   }
//
//   // example parse dd/MM/yyyy - hh:mm
//   static DateTime parseDateTime(String createTime) {
//     var parts = createTime.split(" - ");
//     var dateParts = parts[0].split("/");
//     var timeParts = parts[1].split(":");
//     return DateTime( int.parse(dateParts[2]), int.parse(dateParts[1]), int.parse(dateParts[0]), int.parse(timeParts[0]),int.parse(timeParts[1]),
//     );
//   }
//
//   static DateTime parseDateToSort(String dateString) {
//     try {
//       final dateA = DateFormat('dd/MM/yyyy - HH:mm');
//       final dateB = DateFormat('dd/MM/yyyy HH:mm');
//
//       DateTime parsedDate;
//
//       if (dateString.contains('-')) {
//         parsedDate = dateA.parse(dateString);
//       } else {
//         parsedDate = dateB.parse(dateString);
//       }
//       return parsedDate;
//     } catch (e) {
//       return DateTime.now();
//     }
//   }

}
