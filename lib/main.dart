import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:bethel/home.dart';
import 'package:bethel/onboarding.dart';
import 'package:bethel/login.dart';
import 'package:bethel/register.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(App());
}

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);
  final box = GetStorage();
  @override
  Widget build(BuildContext context) {
    final loggedIn = box.read('loggedIn') ?? false;
    return GetMaterialApp(
      title: 'Music App',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      initialRoute: loggedIn ? '/home' : '/',
      routes: {
        '/': (context) => IntroScreen(),
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/home': (context) => HomeScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
