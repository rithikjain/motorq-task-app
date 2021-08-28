import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vitclasses/presentation/screens/auth/auth_screen.dart';
import 'package:vitclasses/presentation/screens/base/base_screen.dart';
import 'package:vitclasses/presentation/themes/theme.dart';
import 'package:vitclasses/services/di/init_bindings.dart';
import 'package:vitclasses/services/utils/shared_prefs.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.light.copyWith(statusBarColor: Colors.transparent),
  );
  await GetStorage.init();
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
      home: (SharedPrefs.getLoggedInStatus() ?? false)
          ? BaseScreen()
          : AuthScreen(),
    );
  }
}
