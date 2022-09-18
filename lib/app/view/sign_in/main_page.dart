import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hatonet_hcn/app/view/home/auth/auth_page.dart';
import 'package:hatonet_hcn/app/view/home/bottom/bottom_bar.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          if(snapshot.hasData){
            return BottomBarPage();
          }else{
            return AuthPage();
          }
        },
      ),

    );
  }
}
