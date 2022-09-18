// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations, prefer_adjacent_string_concatenation

import 'package:flutter/material.dart';
import 'package:hatonet_hcn/app/provider/google_sign_in_provider.dart';
import 'package:hatonet_hcn/app/utils/next_screen.dart';
import 'package:hatonet_hcn/app/view/sign_in/sign_in_page.dart';
import 'package:provider/provider.dart';


class HomeGoogleSignIn extends StatefulWidget {
  const HomeGoogleSignIn({Key? key}) : super(key: key);

  @override
  State<HomeGoogleSignIn> createState() => _HomeGoogleSignInState();
}

class _HomeGoogleSignInState extends State<HomeGoogleSignIn> {

  Future getData() async {
    final sp = context.read<SignInProvider>();
    sp.getDataFromSharedPreferences();
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    final sp = context.read<SignInProvider>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: NetworkImage('${sp.imageUrl}'),
                radius: 50,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Welcome ${sp.name}',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '${sp.email}',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '${sp.uid}',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("PROVIDER:"),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    '${sp.provider}'.toUpperCase(),
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  sp.userSignOut();
                  nextScreenReplace(context, SignInPage(showRegisterPage: (){}));
                },
                child: Text(
                  'SIGNOUT',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
