import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark
      ),
    );
    return MaterialApp(
      title: "Todo App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
        backgroundColor: Colors.white,
      ),
      home: Container(),
    );
  }
}




