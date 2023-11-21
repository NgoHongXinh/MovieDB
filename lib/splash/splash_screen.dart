import 'package:flutter/material.dart';

import '../core/public/until.dart';

class SplashScreen extends StatelessWidget {


  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // Future.delayed(const Duration(seconds: 3), () async {
    //   context.mounted ? Utils.goHome(context) : null;
    // });
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: Colors.orange
      ),
    );
  }
}
