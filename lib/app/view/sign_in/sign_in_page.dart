// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hatonet_hcn/app/provider/google_sign_in_provider.dart';
import 'package:hatonet_hcn/app/provider/internet_provider.dart';
import 'package:hatonet_hcn/app/utils/next_screen.dart';
import 'package:hatonet_hcn/app/utils/snack_bar.dart';
import 'package:hatonet_hcn/app/view/home/bottom/bottom_bar.dart';
import 'package:hatonet_hcn/app/view/home/forgot_password/forgot_password_page.dart';
import 'package:hatonet_hcn/app/view/sign_up/sign_up_page.dart';
import 'package:hatonet_hcn/app/widget/custom_page_route.dart';
import 'package:provider/provider.dart';
import 'package:wc_form_validators/wc_form_validators.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class SignInPage extends StatefulWidget {
  final VoidCallback showRegisterPage;

  SignInPage({
    Key? key,
    required this.showRegisterPage,
  }) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String errorMessage = 'Tài khoản mật khẩu không chính xác';
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future signIn() async {
    // final isValid = formKey.currentState!.validate();
    if (formKey.currentState!.validate()) {
      showDialog(
          context: context,
          builder: (context) {
            return Center(
              child: CircularProgressIndicator(
                color: Color(0xFFFF6116),
              ),
            );
          });

      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );
        print(userCredential.toString());
        Navigator.of(context).pop();
        Navigator.of(context).pop();

        if (userCredential.user != null) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => BottomBarPage()));
        }
        errorMessage = 'tài khoản hoặc mật khẩu không chính xác';
      } on FirebaseAuthException catch (e) {
        Fluttertoast.showToast(msg: errorMessage, gravity: ToastGravity.TOP);
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
        }
      } catch (e) {
        print(e);
      }
    }

    // await FirebaseAuth.instance.signInWithEmailAndPassword(
    //       email: _emailController.text.trim(),
    //     password: _passwordController.text.trim());
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  bool _secureText = true;

  final RoundedLoadingButtonController googleController =
      RoundedLoadingButtonController();
  final RoundedLoadingButtonController facebookController =
      RoundedLoadingButtonController();

  final formKey = GlobalKey<FormState>();
  String name = '';

  String textError = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        body: Container(
            color: Colors.white,
            height: double.infinity,
            width: double.infinity,
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            height: 100,
                            width: double.infinity,
                            child: Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Center(
                                child: SvgPicture.asset(
                                  'assets/images/img_logo_hatonet.svg',
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Center(
                            child: Padding(
                              padding: EdgeInsets.only(left: 20, right: 20),
                              child: Text(
                                'Tiếp cận hàng ngàn nhân sự chất lượng từ các \ndoanh nghiệp ở khắp mọi nơi',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w300),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20, right: 20),
                            child: TextFormField(
                              //textInputAction: TextInputAction.next,
                              cursorColor: Color(0xFFFF6116),
                              controller: _emailController,
                              keyboardType: TextInputType.text,
                              maxLines: 1,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xFFFF6116), width: 2),
                                ),
                                contentPadding: EdgeInsets.all(13),
                                labelText: 'Email',
                                labelStyle: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFFFF6116),
                                    fontWeight: FontWeight.w300),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),

                              validator: (value) {
                                //a.aaba@aa1a_a.com
                                if (value!.isEmpty) {
                                  return 'Không được để trống';
                                } else if (!RegExp(
                                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                    .hasMatch(value)) {
                                  return 'Sai định dạng. Vui lòng thử lại.';
                                } else {
                                  return null;
                                }
                              },
                              inputFormatters: [
                                FilteringTextInputFormatter.deny(
                                    new RegExp(r"\s\b|\b\s"))
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20, right: 20),
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Không được để trống';
                                } else if (value.length < 6) {
                                  return 'Mật khẩu phải trên 6 kí tự';
                                } else {
                                  return null;
                                }
                              },
                              cursorColor: Color(0xFFFF6116),
                              controller: _passwordController,
                              keyboardType: TextInputType.multiline,
                              maxLines: 1,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xFFFF6116), width: 2),
                                ),
                                //    errorText: _passInvalid ? _passErr : null,
                                contentPadding: EdgeInsets.all(13),
                                labelText: 'Mật khẩu',
                                labelStyle: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFFFF6116),
                                    fontWeight: FontWeight.w300),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4)),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    Icons.remove_red_eye,
                                    color: Color(0xFFFF6116),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _secureText = !_secureText;
                                    });
                                  },
                                ),
                              ),
                              obscureText: _secureText,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20, right: 20),
                            child: GestureDetector(
                              onTap: signIn,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Color(0xFFFF6116),
                                    borderRadius: BorderRadius.circular(5)),
                                height: 45,
                                width: double.infinity,
                                child: Center(
                                  child: Text(
                                    'Đăng nhập',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 20, right: 20),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        height: 1,
                                        color: Color(0xFF455A64),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        child: Center(
                                          child: Text(
                                            'Hoặc',
                                            style: TextStyle(
                                                color: Color(0xFF455A64),
                                                fontSize: 18,
                                                fontWeight: FontWeight.normal),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        color: Color(0xFF455A64),
                                        height: 1,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/icons/ic_facebook.svg',
                                color: Color(0xFF1877F2),
                                height: 40,
                                width: 40,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              InkWell(
                                onTap: () {
                                  handleGoogleSignIn();
                                },
                                child: SvgPicture.asset(
                                  'assets/icons/ic_google.svg',
                                  height: 45,
                                  width: 45,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          InkWell(
                            onTap: () => Navigator.of(context).push(
                              CustomPageRoute(
                                  child: SignUpPage(
                                    showLoginPage: () {},
                                  ),
                                  direction: AxisDirection.left),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Đăng kí tài khoản mới',
                                    style: TextStyle(
                                        color: Color(0xFF455A64),
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(
                                    Icons.arrow_forward_outlined,
                                    color: Color(0xFF455A64),
                                    size: 18,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ForgotPasswordPage()));
                            },
                            child: Text(
                              'Quên mật khẩu',
                              style: TextStyle(
                                  color: Color(0xFF455A64),
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }

  //handling google sigin in

  Future handleGoogleSignIn() async {
    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: CircularProgressIndicator(
              color: Color(0xFFFF6116),
            ),
          );
        });
    final sp = context.read<SignInProvider>();
    final ip = context.read<InternetProvider>();
    await ip.checkInternetConnection();

    if (ip.hasInternet == false) {
      openSnackbar(context, "Check your Internet connection", Colors.red);
      googleController.reset();
    } else {
      await sp.signInWithGoogle().then(
        (value) {
          if (sp.hasError == true) {
            openSnackbar(context, sp.errorCode.toString(), Colors.red);
            googleController.reset();
          } else {
            // checking whether user exists or not
            sp.checkUserExists().then(
              (value) async {
                if (value == true) {
                  // user exists
                  await sp.getUserDataFromFirestore(sp.uid).then((value) => sp
                      .saveDataToSharedPreferences()
                      .then((value) => sp.setSignIn().then((value) {
                            googleController.success();
                            handleAfterSignIn();
                          })));
                } else {
                  //user does not exist
                  sp.saveDataToFirestore().then(
                        (value) => sp.saveDataToSharedPreferences().then(
                              (value) => sp.setSignIn().then(
                                (value) {
                                  googleController.success();
                                  handleAfterSignIn();
                                },
                              ),
                            ),
                      );
                }
              },
            );
          }
        },
      );
    }
    Navigator.of(context).pop();
    // internet provider should
  }

  handleAfterSignIn() async {
    Future.delayed(Duration(milliseconds: 1000)).then((value) {
      nextScreenReplace(context, BottomBarPage());
    });
  }
}
