
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kart_demo/apk_integration.dart';
import 'package:kart_demo/bottomNavigationPage.dart';
import 'package:kart_demo/secondpage.dart';
import 'package:kart_demo/thirdPage.dart';
import 'firstPage.dart';

var h;
var w;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(homePage());
}

class homePage extends StatelessWidget {
  const homePage({super.key});



  @override
  Widget build(BuildContext context) {
    h=MediaQuery.of(context).size.height;
    w=MediaQuery.of(context).size.width;
    return MaterialApp(
      home: bottomNaviPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
