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
    return Column(
      children: [
        PopupMenu(
          menulist: [
            PopupMenuItem(
              child: ListTile(
                title: Text('Thông tin'),
              ),
            ),
            PopupMenuItem(
              child:
              ElevatedButton(
                onPressed: () {
                  sp.userSignOut();
                  nextScreenReplace(context, SignInPage(showRegisterPage: () {}));
                },
                child: Text(
                  'SIGNOUT',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
          icon: CircleAvatar(
            backgroundColor: Colors.blue,
            backgroundImage: NetworkImage('${sp.imageUrl}'),
            radius: 15,
          ),
        ),

      ],
    );
  }
}

class PopupMenu extends StatelessWidget {
  final List<PopupMenuEntry> menulist;
  final Widget? icon;

  PopupMenu({Key? key, required this.menulist, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      itemBuilder: ((context) => menulist),
      icon: icon,
    );
  }
}
