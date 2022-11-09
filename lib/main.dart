// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hatonet_hcn/app/blocs/bloc_exports.dart';
import 'package:hatonet_hcn/app/blocs/bloc_job_postings/job_postings_bloc.dart';
import 'package:hatonet_hcn/app/provider/google_sign_in_provider.dart';
import 'package:hatonet_hcn/app/provider/internet_provider.dart';
import 'package:hatonet_hcn/app/view/home/bottom/bottom_bar.dart';
import 'package:hatonet_hcn/app/view/sign_in/sign_in_page.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app/view/home/spalsh_screen/hello.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:path_provider/path_provider.dart';



main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());
  await Firebase.initializeApp();
  try {} catch (e) {
    print('Init failed' + e.toString());
  }
  HydratedBlocOverrides.runZoned(
    () => runApp(
      MyApp(),
    ),
    storage: storage,
  );
  _init();
}

_init() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final token = prefs.getString("user");
  if (token != null) {
    print('Token: $token');
    Get.offAll(BottomBarPage());
  } else {
    Get.offAll(SignInPage(showRegisterPage: (){}));
  }
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ServicesBloc(),
        ),
        BlocProvider(
          create: (context) => JobPostingsBloc(),
        ),
      ],
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => SignInProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => InternetProvider(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title:'Hatonet',
          theme: ThemeData(
            scaffoldBackgroundColor: Color(0xFFE65C00),
          ),
          home: HelloPage(),
          // home: OnBoarding(),
          routes: {
            '/SignInPage': (context) =>  SignInPage(showRegisterPage: (){}),
          },
        ),
      ),
    );
  }
}
