import 'package:flutter/material.dart';

import 'package:myapp/shared/consts/DisableBottonBar.dart';
import 'package:myapp/shared/Routes/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  disableBottomBarAndTopBar();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My App",
      routes: routes,
      initialRoute: '/loginPage',
      debugShowCheckedModeBanner: false,
    );
  }
}
