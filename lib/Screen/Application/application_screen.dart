import 'dart:async';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:untitled/model/movie_playing_model.dart';

import '../../core/routers.dart';
import '../../splash/splash_screen.dart';
import '../MoviePlaying/movie_playing_screen.dart';
import 'application_notifier.dart';

class ApplicationScreen extends StatefulWidget {
  // final Iterable<Locale> supportedLocales;
  // final Iterable<LocalizationsDelegate<dynamic>> localizationsDelegates;
  // final Locale locale;

  const ApplicationScreen(
      {Key? key,}) : super(key: key);

  @override
  _ApplicationScreenState createState() => _ApplicationScreenState();
}

class _ApplicationScreenState extends State<ApplicationScreen> {
  Timer _timer = Timer.periodic(Duration.zero, (_) {});
  Key key = UniqueKey();

  @override
  void initState() {
    super.initState();
  }

  void _logOutUser() {
    try {} catch (e) {
      print(e);
    }
    setState(() {
      key = UniqueKey();
    });
    _timer.cancel();
  }

  void _initializeTimer() {
    _timer = Timer.periodic(
        const Duration(milliseconds: 300000), (_) {
      _logOutUser();
    });
  }

  void _handleUserInteraction() {
    _timer.cancel();
    _initializeTimer();
  }

  @override
  Widget build(BuildContext context) {
    final appNotifier = Provider.of<ApplicationNotifier>(context);
    return  Listener(
        onPointerDown: (_) {
          _handleUserInteraction();
        },
        child: ScreenUtilInit(
            builder: (_,context) => KeyboardDismisser(
              child: MaterialApp(
                navigatorKey: appNotifier.materialKey,
                builder: (context, child) {
                  return MediaQuery(
                    child: child!,
                    data: MediaQuery.of(context)
                        .copyWith(textScaleFactor: 1.0),
                  );
                },
                // supportedLocales: widget.supportedLocales,
                // localizationsDelegates: widget.localizationsDelegates,
                // locale: widget.locale,
                theme: appNotifier.themeDefaultData,
                debugShowCheckedModeBanner: false,
                onGenerateRoute: Routers.generateRoute,
                initialRoute: MoviePage.routeName,
              ),
            )));
  }
}
