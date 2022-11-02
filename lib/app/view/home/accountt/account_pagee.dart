// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields, unnecessar sort_child_properties_last, unnecessary_new

import 'dart:convert';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hatonet_hcn/app/model/info.dart';
import 'package:hatonet_hcn/app/view/home/background/backgroud_image.dart';
import 'package:hatonet_hcn/app/view/home/bottom/bottom_bar.dart';
import 'package:hatonet_hcn/app/view/home/details/details_page.dart';
import 'package:hatonet_hcn/app/widget/custom_page_route.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

class AccountPagee extends StatefulWidget {
  const AccountPagee({Key? key}) : super(key: key);

  @override
  State<AccountPagee> createState() => _AccountPageeState();
}

class _AccountPageeState extends State<AccountPagee> {
  static const String _title = 'Hachinet';

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: _title,
        home: Scaffold(
          body: Stack(
            children: [
              BackGround(),
              CompanyInformation(),
            ],
          ),
        ),
      ),
    );
  }
}

class CompanyInformation extends StatefulWidget {
  CompanyInformation({
    Key? key,
  }) : super(key: key);

  @override
  State<CompanyInformation> createState() => _CompanyInformationState();
}

class _CompanyInformationState extends State<CompanyInformation>
    with TickerProviderStateMixin {
  //
  String? scales;
  String? field;
  String? city;
  String? homeTown;
  SharedPreferences? prefs;
  final _key = 'cur_r';
  final _keyfield = '_keyfield';
  final _keycity = '_keycity';
  final _keyhomeTown = '_keyhomeTown';

  _read() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      scales = prefs!.getString(_key) ?? '1-100';
      field = prefs!.getString(_keyfield) ?? 'Product';
      city = prefs!.getString(_keycity) ?? 'Hà Nội';
      homeTown = prefs!.getString(_keyhomeTown) ?? 'Yên Lạc';
    });
  }

  //
  bool _secureText = true;
  bool _secureNewPass = true;
  bool _secureRetypePass = true;

  //final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  FocusNode searchFocusNode = FocusNode();
  FocusNode textFieldFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    initialGetSaved();
    _read();

    this.citys.add({'id': 1, 'name': 'Hà Nội'});
    this.citys.add({'id': 2, 'name': 'Hà Giang'});

    this.statesMasters = [
      {'ID': 1, 'Name': 'Ba Đình', 'ParentId': 1},
      {'ID': 2, 'Name': 'Hoàn Kiếm', 'ParentId': 1},
      {'ID': 3, 'Name': 'Tây Hồ', 'ParentId': 1},
      {'ID': 4, 'Name': 'Long Biên', 'ParentId': 1},
      {'ID': 5, 'Name': 'Cầu Giấy', 'ParentId': 1},
      {'ID': 6, 'Name': 'Đống Đa', 'ParentId': 1},
      {'ID': 1, 'Name': 'Đồng Văn', 'ParentId': 2},
      {'ID': 2, 'Name': 'Mèo Vạc', 'ParentId': 2},
      {'ID': 3, 'Name': 'Yên Minh', 'ParentId': 2},
      {'ID': 4, 'Name': 'Quản Bạ', 'ParentId': 2},
      {'ID': 5, 'Name': 'Vị Xuyên', 'ParentId': 2},
      {'ID': 6, 'Name': 'Bắc Mê', 'ParentId': 2},
    ];
  }

  //get data info
  void initialGetSaved() async {
    sharedPreferences = await SharedPreferences.getInstance();

    Map<String, dynamic> jsondatais =
        jsonDecode(sharedPreferences.getString('infodata')!);

    var info = Info.fromJson(jsondatais);

    if (jsondatais.isNotEmpty) {
      _phoneController.value = TextEditingValue(text: info.phone);
      _companyNameController.value = TextEditingValue(text: info.companyName);
      _abbreviationsController.value =
          TextEditingValue(text: info.abbreviations);
      _taxController.value = TextEditingValue(text: info.tax);
      _emailController.value = TextEditingValue(text: info.email);
      _hotlineController.value = TextEditingValue(text: info.hotline);
      _passwordController.value = TextEditingValue(text: info.password);
      _websiteController.value = TextEditingValue(text: info.website);
      _detailController.value = TextEditingValue(text: info.detail);
      _introduceController.value = TextEditingValue(text: info.introduce);
      _contactController.value = TextEditingValue(text: info.contact);
      _contactEmailController.value = TextEditingValue(text: info.contactEmail);
    }
  }

  void showSnackbar(BuildContext context) {
    final snackBar = SnackBar(
      content: Row(
        children: [
          Text('Cập nhật thành công'),
          SizedBox(
            width: 5,
          ),
          SvgPicture.asset(
            'assets/icons/ic_circle_check_solid.svg',
            height: 18,
            width: 18,
            color: Colors.green,
          ),
        ],
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  //save data info

  void storeInfoData() {
    Info info1 = new Info(
      _phoneController.text,
      _companyNameController.text,
      _abbreviationsController.text,
      _taxController.text,
      _hotlineController.text,
      _emailController.text,
      _passwordController.text,
      _websiteController.text,
      _detailController.text,
      _introduceController.text,
      _contactController.text,
      _contactEmailController.text,
    );
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DetailsPage(
                info: Info(
                    _phoneController.text,
                    _companyNameController.text,
                    _abbreviationsController.text,
                    _taxController.text,
                    _hotlineController.text,
                    _emailController.text,
                    _passwordController.text,
                    _websiteController.text,
                    _detailController.text,
                    _introduceController.text,
                    _contactController.text,
                    _contactEmailController.text),
                onClick: () {
                  Navigator.pop(context);
                })));

    String info = jsonEncode(info1);
    print(info);
    sharedPreferences.setString('infodata', info);
  }

  late SharedPreferences sharedPreferences;

  TextEditingController _phoneController = TextEditingController();
  TextEditingController _companyNameController = TextEditingController();
  TextEditingController _abbreviationsController = TextEditingController();
  TextEditingController _taxController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _hotlineController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _websiteController = TextEditingController();
  TextEditingController _detailController = TextEditingController();
  TextEditingController _introduceController = TextEditingController();
  TextEditingController _contactController = TextEditingController();
  TextEditingController _contactEmailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  List<dynamic> citys = [];
  List<dynamic> statesMasters = [];
  List<dynamic> states = [];

  String? cityId;
  String? stateId;

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);

    return DefaultTabController(
        length: 3,
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          CustomPageRoute(
                              child: BottomBarPage(),
                              direction: AxisDirection.right),
                        );
                      },
                      child: Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: SvgPicture.asset(
                            'assets/icons/ic_angle_left.svg',
                            height: 24,
                            width: 24,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                          onTap: () {
                            _phoneController.value = TextEditingValue(text: '');
                            _companyNameController.value =
                                TextEditingValue(text: '');
                            _abbreviationsController.value =
                                TextEditingValue(text: '');
                            _taxController.value = TextEditingValue(text: '');
                            _hotlineController.value =
                                TextEditingValue(text: '');
                            _emailController.value = TextEditingValue(text: '');
                            _passwordController.value =
                                TextEditingValue(text: '');
                            _websiteController.value =
                                TextEditingValue(text: '');
                            _detailController.value =
                                TextEditingValue(text: '');
                            _introduceController.value =
                                TextEditingValue(text: '');
                            _contactController.value =
                                TextEditingValue(text: '');
                            _contactEmailController.value =
                                TextEditingValue(text: '');
                            sharedPreferences.remove('infodata');
                          },
                          child: SvgPicture.asset(
                            'assets/icons/ic_pen.svg',
                            height: 24,
                            width: 24,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Image.asset(
                'assets/images/logo_hatonet_small.png',
                height: 120,
                width: 120,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'NỀN TẢNG KẾT NỐI NHÂN SỰ ONSITE SỐ 1',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              SizedBox(
                height: 70,
              ),
              Expanded(
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(25),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      spreadRadius: 1,
                                      blurRadius: 1,
                                      offset: Offset(2.0, 1.0))
                                ],
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 1, vertical: 1),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(25)),
                                child: TabBar(
                                  indicator: BoxDecoration(
                                      color: Color(0xFFFF6116),
                                      borderRadius: BorderRadius.circular(25)),
                                  indicatorColor: Color(0xFFFF6116),
                                  controller: tabController,
                                  isScrollable: true,
                                  labelPadding:
                                      EdgeInsets.symmetric(horizontal: 10),
                                  tabs: [
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: 10, right: 10),
                                      child: Tab(
                                        child: Text(
                                          "Công ty",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ),
                                    Tab(
                                      child: Text(
                                        "Bảo mật",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                    Tab(
                                      child: Text(
                                        "Liên hệ",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Expanded(
                        child: TabBarView(
                          physics: NeverScrollableScrollPhysics(),
                          controller: tabController,
                          children: [
                            SingleChildScrollView(
                              physics: BouncingScrollPhysics(),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              left: 10, right: 5, top: 10),
                                          child: TextFormField(
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Không được bỏ trống';
                                              } else
                                                null;
                                            },
                                            controller: _companyNameController,
                                            keyboardType: TextInputType.text,
                                            maxLines: 1,
                                            decoration: InputDecoration(
                                                contentPadding:
                                                    EdgeInsets.all(13),
                                                labelText: 'Tên Công ty',
                                                labelStyle:
                                                    TextStyle(fontSize: 12),
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5))),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              left: 10, right: 10, top: 10),
                                          child: TextFormField(
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Không được bỏ trống';
                                              } else
                                                null;
                                            },
                                            controller:
                                                _abbreviationsController,
                                            keyboardType: TextInputType.text,
                                            maxLines: 1,
                                            decoration: InputDecoration(
                                                contentPadding:
                                                    EdgeInsets.all(13),
                                                labelText: 'Tên viết tắt',
                                                labelStyle:
                                                    TextStyle(fontSize: 12),
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5))),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              left: 10, right: 5, top: 10),
                                          child: TextFormField(
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Không được bỏ trống';
                                              } else
                                                null;
                                            },
                                            controller: _taxController,
                                            keyboardType: TextInputType.number,
                                            maxLines: 1,
                                            decoration: InputDecoration(
                                                contentPadding:
                                                    EdgeInsets.all(13),
                                                labelText: 'Mã số thuế',
                                                labelStyle:
                                                    TextStyle(fontSize: 12),
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5))),
                                          ),
                                        ),
                                      ),

                                      //Quy mô
                                      Expanded(
                                        flex: 1,
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              left: 10, right: 10, top: 10),
                                          child:
                                              DropdownButtonFormField<String>(
                                            value: scales,
                                            onChanged: (String? newValue) {
                                              setState(() {
                                                scales = newValue;
                                              });
                                              prefs!.setString(_key,
                                                  scales!); // save value to SharedPreference
                                            },
                                            items: [
                                              '1-100',
                                              '100-300',
                                              '300-500',
                                              '500-1000',
                                              'trên 1000'
                                            ].map<DropdownMenuItem<String>>(
                                                (String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value),
                                              );
                                            }).toList(),
                                            dropdownColor: Colors.white,
                                            decoration: InputDecoration(
                                              contentPadding:
                                                  EdgeInsets.all(13),
                                              hintText: 'Quy mô',
                                              //enabledBorder: InputBorder.none,
                                              border: OutlineInputBorder(),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 10, right: 10, top: 10),
                                    child: TextFormField(
                                      validator: (value) {
                                        //a.aaba@aa1a_a.com
                                        if (value!.isEmpty ||
                                            !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}')
                                                .hasMatch(value)) {
                                          return 'Không đúng định dạng';
                                        } else {
                                          return null;
                                        }
                                      },
                                      controller: _emailController,
                                      keyboardType: TextInputType.text,
                                      maxLines: 1,
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.all(13),
                                          labelText: 'Email',
                                          labelStyle: TextStyle(fontSize: 12),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5))),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 10, right: 10, top: 10),
                                    child: TextFormField(
                                      controller: _websiteController,
                                      validator: (value) {
                                        //http://hjhf.com
                                        if (value!.isEmpty ||
                                            !RegExp(r'^[\http://-\:]+([\w-]+\.)+[\w]{2,4}')
                                                .hasMatch(value)) {
                                          return 'Không đúng định dạng';
                                        } else {
                                          return null;
                                        }
                                      },
                                      keyboardType: TextInputType.text,
                                      maxLines: 1,
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.all(13),
                                          labelText: 'Website',
                                          labelStyle: TextStyle(fontSize: 12),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5))),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 10, right: 10, top: 10),
                                    child: TextFormField(
                                      validator: (value) =>
                                          value != null && value.length < 12
                                              ? 'Không đúng định dạng'
                                              : null,
                                      controller: _hotlineController,
                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.all(13),
                                          labelText: 'Hotline',
                                          labelStyle: TextStyle(fontSize: 12),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5))),
                                    ),
                                  ),
                                  // Lĩnh vực hoạt động
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 10, right: 10, top: 10),
                                    child: DropdownButtonFormField<String>(
                                      value: field,
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          field = newValue;
                                        });
                                        prefs!.setString(_keyfield,
                                            field!); // save value to SharedPreference
                                      },
                                      items: [
                                        'Product',
                                        'Outsourcing',
                                        'Solution',
                                        'Consultant',
                                        'Service',
                                        'Human'
                                      ].map<DropdownMenuItem<String>>(
                                          (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                      dropdownColor: Colors.white,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(13),
                                        hintText: 'Lĩnh vực hoạt động',
                                        //enabledBorder: InputBorder.none,
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                  ),

                                  // // Tỉnh/thành phố
                                  Padding(
                                    padding: EdgeInsets.only(top: 10),
                                    child: FormHelper.dropDownWidget(
                                      context,
                                      'Tỉnh/Thành phố',
                                      this.cityId,
                                      this.citys,
                                      (onChangedVal) {
                                        this.cityId = onChangedVal;
                                        print(
                                            'Selected Country: $onChangedVal');
                                        this.states = this
                                            .statesMasters
                                            .where(
                                              (stateItem) =>
                                                  stateItem['ParentId']
                                                      .toString() ==
                                                  onChangedVal.toString(),
                                            )
                                            .toList();
                                        this.stateId = null;
                                        setState(() {});
                                      },
                                      (onValidateVal) {
                                        if (onValidateVal == null) {
                                          return 'Không được bỏ trống';
                                        }
                                        return null;
                                      },
                                      borderColor:
                                          Theme.of(context).primaryColor,
                                      borderFocusColor: Colors.black26,
                                      borderRadius: 4,
                                      // optionValue: 'val',
                                      // optionLabel: 'name',
                                    ),
                                  ),
                                  // //Quê quán
                                  Padding(
                                    padding: EdgeInsets.only(top: 10),
                                    child: Container(
                                      width: double.infinity,
                                      child: FormHelper.dropDownWidget(
                                        context,
                                        'Quận/Huyện',
                                        this.stateId,
                                        this.states,
                                        (onChangedVal) {
                                          this.stateId = onChangedVal;
                                          print('Selected State: $onChangedVal');
                                        },
                                        (onValidate) {
                                          return null;
                                        },
                                        borderColor:
                                        Theme.of(context).primaryColor,
                                        borderFocusColor: Colors.black26,
                                        borderRadius: 4,
                                        optionValue: 'ID',
                                        optionLabel: 'Name',

                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 10, right: 10, top: 10),
                                    child: TextFormField(
                                      controller: _detailController,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Không được bỏ trống';
                                        } else
                                          null;
                                      },
                                      keyboardType: TextInputType.text,
                                      maxLines: 1,
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.all(13),
                                          labelText: 'Chi tiết',
                                          labelStyle: TextStyle(fontSize: 12),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5))),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 10, right: 10, top: 10),
                                    child: TextFormField(
                                      controller: _introduceController,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Không được bỏ trống';
                                        } else
                                          null;
                                      },
                                      keyboardType: TextInputType.text,
                                      maxLines: 3,
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.all(13),
                                          labelText: 'Giới thiệu',
                                          labelStyle: TextStyle(fontSize: 12),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5))),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SingleChildScrollView(
                              physics: BouncingScrollPhysics(),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 10, right: 10, top: 10),
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Không được bỏ trống';
                                        } else
                                          null;
                                      },
                                      keyboardType: TextInputType.multiline,
                                      maxLines: 1,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(13),
                                        labelText: 'Mật khẩu hiện tại',
                                        labelStyle: TextStyle(fontSize: 12),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        suffixIcon: IconButton(
                                          icon: Icon(Icons.remove_red_eye),
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
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 10, right: 10, top: 10),
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Không được bỏ trống';
                                        } else
                                          null;
                                      },
                                      keyboardType: TextInputType.multiline,
                                      maxLines: 1,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(13),
                                        labelText: 'Mật khẩu mới',
                                        labelStyle: TextStyle(fontSize: 12),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        suffixIcon: IconButton(
                                          icon: Icon(Icons.remove_red_eye),
                                          onPressed: () {
                                            setState(() {
                                              _secureNewPass = !_secureNewPass;
                                            });
                                          },
                                        ),
                                      ),
                                      obscureText: _secureNewPass,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 10, right: 10, top: 10),
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Không được bỏ trống';
                                        } else
                                          null;
                                      },
                                      controller: _passwordController,
                                      keyboardType: TextInputType.multiline,
                                      maxLines: 1,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(13),
                                        labelText: 'Nhập lại mật khẩu',
                                        labelStyle: TextStyle(fontSize: 12),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        suffixIcon: IconButton(
                                          icon: Icon(Icons.remove_red_eye),
                                          onPressed: () {
                                            setState(() {
                                              _secureRetypePass =
                                                  !_secureRetypePass;
                                            });
                                          },
                                        ),
                                      ),
                                      obscureText: _secureRetypePass,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SingleChildScrollView(
                              physics: BouncingScrollPhysics(),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 10, right: 10, top: 10),
                                    child: TextFormField(
                                      controller: _contactController,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Không được bỏ trống';
                                        } else
                                          null;
                                      },
                                      keyboardType: TextInputType.text,
                                      maxLines: 1,
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.all(13),
                                          labelText: 'Người liên hệ',
                                          labelStyle: TextStyle(fontSize: 12),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5))),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 10, right: 10, top: 10),
                                    child: TextFormField(
                                      validator: (value) =>
                                          value != null && value.length < 12
                                              ? 'Không đúng định dạng'
                                              : null,
                                      controller: _phoneController,
                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.all(13),
                                          labelText: 'Số điện thoại',
                                          labelStyle: TextStyle(fontSize: 12),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5))),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 10, right: 10, top: 10),
                                    child: TextFormField(
                                      controller: _contactEmailController,
                                      validator: (value) {
                                        //a.aaba@aa1a_a.com
                                        if (value!.isEmpty ||
                                            !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}')
                                                .hasMatch(value)) {
                                          return 'Không đúng định dạng';
                                        } else {
                                          return null;
                                        }
                                      },
                                      keyboardType: TextInputType.text,
                                      maxLines: 1,
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.all(13),
                                          labelText: 'Email liên hệ',
                                          labelStyle: TextStyle(fontSize: 12),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5))),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: GestureDetector(
                          onTap: () async {
                            if (_formKey.currentState!.validate()) {
                              storeInfoData();
                              showSnackbar(context);
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color(0xFFFF6116),
                                borderRadius: BorderRadius.circular(4)),
                            height: 45,
                            width: double.infinity,
                            child: Center(
                              child: Text(
                                'Cập nhật',
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
                        height: 5,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class PopupMenu extends StatelessWidget {
  final List<PopupMenuEntry> menulist;
  final Widget? icon;

  const PopupMenu({Key? key, required this.menulist, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      itemBuilder: ((context) => menulist),
      icon: icon,
    );
  }
}
