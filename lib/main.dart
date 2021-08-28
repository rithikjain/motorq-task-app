import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:vitclasses/presentation/screens/auth/auth_screen.dart';
import 'package:vitclasses/presentation/themes/theme.dart';
import 'package:vitclasses/services/di/init_bindings.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.light.copyWith(statusBarColor: Colors.transparent),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'VIT Classes',
      theme: theme,
      initialBinding: InitBindings(),
      home: AuthScreen(),
    );
  }
}
