// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hatonet_hcn/app/blocs/bloc_exports.dart';
import 'package:hatonet_hcn/app/blocs/bloc_job_postings/job_postings_bloc.dart';
import 'package:hatonet_hcn/app/provider/google_sign_in_provider.dart';
import 'package:hatonet_hcn/app/provider/internet_provider.dart';
import 'package:hatonet_hcn/app/services/app_router.dart';
import 'package:provider/provider.dart';
import 'app/view/home/spalsh_screen/hello.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:path_provider/path_provider.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());
  await Firebase.initializeApp();
  //await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  HydratedBlocOverrides.runZoned(
    () => runApp(
      MyApp(),
    ),
    storage: storage,
  );
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
        ),
      ),
    );
  }
}
