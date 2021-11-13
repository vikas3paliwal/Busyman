import 'package:busyman/provider/reminderprovider.dart';
import 'package:busyman/provider/taskprovider.dart';
import 'package:busyman/screens/login/loginscreen.dart';
import 'package:busyman/screens/tasks/alltasks.dart';
import 'package:busyman/services/notification_service.dart';
import 'package:busyman/services/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService().init();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => TaskProvider()),
        ChangeNotifierProvider(create: (ctx) => Reminderprovider())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/Alltasks',
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
