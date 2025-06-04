import 'package:device_preview/device_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'pages/auth/login_page.dart';
import 'services/auth_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AuthService.init();
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => LanguageLearningApp(),
    ),
  );
}

class LanguageLearningApp extends StatelessWidget {
  const LanguageLearningApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

