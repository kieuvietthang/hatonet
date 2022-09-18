// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hatonet_hcn/app/view/home/background/backgroud_image.dart';
import 'package:hatonet_hcn/app/view/home/notification/notification_page.dart';

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
  const CompanyInformation({Key? key}) : super(key: key);

  @override
  State<CompanyInformation> createState() => _CompanyInformationState();
}

class _CompanyInformationState extends State<CompanyInformation>
    with TickerProviderStateMixin {
  bool _secureText = true;
  bool _secureNewPass = true;
  bool _secureRetypePass = true;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  FocusNode searchFocusNode = FocusNode();
  FocusNode textFieldFocusNode = FocusNode();

  late SingleValueDropDownController _cnt;
  late MultiValueDropDownController _cntMulti;

  @override
  void initState() {
    _cnt = SingleValueDropDownController();
    _cntMulti = MultiValueDropDownController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);
    return DefaultTabController(
      length: 3,
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
                  onTap: (){
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>NotificationPage()));
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
                    child: SvgPicture.asset(
                      'assets/icons/ic_pen.svg',
                      height: 24,
                      width: 24,
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
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
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
                              ]),
                          padding:
                              EdgeInsets.symmetric(horizontal: 1, vertical: 1),
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
                                  padding: EdgeInsets.only(left: 10, right: 10),
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
                                      child: TextField(
                                        //    controller: phoneController,
                                        keyboardType: TextInputType.text,
                                        maxLines: 1,
                                        decoration: InputDecoration(
                                            contentPadding: EdgeInsets.all(13),
                                            labelText: 'Tên Công ty',
                                            labelStyle: TextStyle(fontSize: 12),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5))),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: 10, right: 10, top: 10),
                                      child: TextField(
                                        //    controller: phoneController,
                                        keyboardType: TextInputType.text,
                                        maxLines: 1,
                                        decoration: InputDecoration(
                                            contentPadding: EdgeInsets.all(13),
                                            labelText: 'Tên viết tắt',
                                            labelStyle: TextStyle(fontSize: 12),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5))),
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
                                      child: TextField(
                                        //    controller: phoneController,
                                        keyboardType: TextInputType.number,
                                        maxLines: 1,
                                        decoration: InputDecoration(
                                            contentPadding: EdgeInsets.all(13),
                                            labelText: 'Mã số thuế',
                                            labelStyle: TextStyle(fontSize: 12),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5))),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: 10, right: 10, top: 10),
                                      child: TextField(
                                        //    controller: phoneController,
                                        keyboardType: TextInputType.number,
                                        maxLines: 1,
                                        decoration: InputDecoration(
                                            contentPadding: EdgeInsets.all(13),
                                            labelText: 'Quy mô',
                                            labelStyle: TextStyle(fontSize: 12),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            suffixIcon: PopupMenu(
                                                menulist: [
                                                  PopupMenuItem(
                                                    child: ListTile(
                                                      title: Text('1-100'),
                                                    ),
                                                  ),
                                                  PopupMenuItem(
                                                    child: ListTile(
                                                      title: Text('100-300'),
                                                    ),
                                                  ),
                                                  PopupMenuItem(
                                                    child: ListTile(
                                                      title: Text('300-500'),
                                                    ),
                                                  ),
                                                  PopupMenuItem(
                                                    child: ListTile(
                                                      title: Text('500-1000'),
                                                    ),
                                                  ),
                                                  PopupMenuItem(
                                                    child: ListTile(
                                                      title: Text('Trên 1000'),
                                                    ),
                                                  ),
                                                ],
                                                icon: SvgPicture.asset(
                                                  'assets/icons/ic_chevron_down.svg',
                                                  height: 18,
                                                  width: 18,
                                                ))),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 10, right: 10, top: 10),
                                child: TextField(
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
                                child: TextField(
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
                                child: TextField(
                                  //    controller: phoneController,
                                  keyboardType: TextInputType.text,
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
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 10, right: 10, top: 10),
                                child: DropDownTextField.multiSelection(
                                  multiController: _cntMulti,
                                  textFieldDecoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 15, horizontal: 10),
                                    hintStyle: TextStyle(fontSize: 12),
                                    hintText: 'Lĩnh vực hoạt động',
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4)),
                                  ),
                                  dropDownList: const [
                                    DropDownValueModel(
                                        name: 'Product', value: "value1"),
                                    DropDownValueModel(
                                        name: 'Outsourcing',
                                        value: "value2",
                                        toolTipMsg:
                                        "DropDownButton is a widget that we can use to select one unique value from a set of values"),
                                    DropDownValueModel(
                                        name: 'Solution', value: "value3"),
                                    DropDownValueModel(
                                        name: 'Consultant',
                                        value: "value4",
                                        toolTipMsg:
                                        "DropDownButton is a widget that we can use to select one unique value from a set of values"),
                                    DropDownValueModel(
                                        name: 'Service', value: "value5"),
                                    DropDownValueModel(
                                        name: 'Human', value: "value6"),
                                  ],
                                  onChanged: (val) {
                                    setState(() {});
                                  },
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 10, right: 10, top: 10),
                                child: DropDownTextField(
                                  singleController: _cnt,
                                  clearOption: false,
                                  textFieldDecoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 15, horizontal: 10),
                                    hintStyle: TextStyle(fontSize: 12),
                                    hintText: 'Tỉnh/Thành phố',
                                    border: OutlineInputBorder(),
                                  ),
                                  enableSearch: true,
                                  validator: (value) {
                                    if (value == null) {
                                      return "Required field";
                                    } else {
                                      return null;
                                    }
                                  },
                                  dropDownItemCount: 6,
                                  dropDownList: const [
                                    DropDownValueModel(
                                        name: 'Hà Nội', value: "value1"),
                                    DropDownValueModel(
                                        name: 'Hồ Chí Minh',
                                        value: "value2",
                                        toolTipMsg:
                                            "DropDownButton is a widget that we can use to select one unique value from a set of values"),
                                    DropDownValueModel(
                                        name: 'Vĩnh Phúc', value: "value3"),
                                    DropDownValueModel(
                                        name: 'Ninh Bình',
                                        value: "value4",
                                        toolTipMsg:
                                            "DropDownButton is a widget that we can use to select one unique value from a set of values"),
                                    DropDownValueModel(
                                        name: 'Cà Mau', value: "value5"),
                                    DropDownValueModel(
                                        name: 'Nghệ An', value: "value6"),
                                    DropDownValueModel(
                                        name: 'Vĩnh Long', value: "value7"),
                                    DropDownValueModel(
                                        name: 'Quảng Bình', value: "value8"),
                                    DropDownValueModel(
                                        name: 'Hải Phòng', value: "value9"),
                                    DropDownValueModel(
                                        name: 'Đồng Tháp', value: "value10"),
                                    DropDownValueModel(
                                        name: 'Lai Châu', value: "value11"),
                                  ],
                                  onChanged: (val) {},
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 10, right: 10, top: 10),
                                child: DropDownTextField(
                                  singleController: _cnt,
                                  clearOption: false,
                                  textFieldDecoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 15, horizontal: 10),
                                    hintStyle: TextStyle(fontSize: 12),
                                    hintText: 'Quận/Huyện',
                                    border: OutlineInputBorder(),
                                  ),
                                  enableSearch: true,
                                  validator: (value) {
                                    if (value == null) {
                                      return "Required field";
                                    } else {
                                      return null;
                                    }
                                  },
                                  dropDownItemCount: 6,
                                  dropDownList: const [
                                    DropDownValueModel(
                                        name: 'Hà Nội', value: "value1"),
                                    DropDownValueModel(
                                        name: 'Hồ Chí Minh',
                                        value: "value2",
                                        toolTipMsg:
                                        "DropDownButton is a widget that we can use to select one unique value from a set of values"),
                                    DropDownValueModel(
                                        name: 'Vĩnh Phúc', value: "value3"),
                                    DropDownValueModel(
                                        name: 'Ninh Bình',
                                        value: "value4",
                                        toolTipMsg:
                                        "DropDownButton is a widget that we can use to select one unique value from a set of values"),
                                    DropDownValueModel(
                                        name: 'Cà Mau', value: "value5"),
                                    DropDownValueModel(
                                        name: 'Nghệ An', value: "value6"),
                                    DropDownValueModel(
                                        name: 'Vĩnh Long', value: "value7"),
                                    DropDownValueModel(
                                        name: 'Quảng Bình', value: "value8"),
                                    DropDownValueModel(
                                        name: 'Hải Phòng', value: "value9"),
                                    DropDownValueModel(
                                        name: 'Đồng Tháp', value: "value10"),
                                    DropDownValueModel(
                                        name: 'Lai Châu', value: "value11"),
                                  ],
                                  onChanged: (val) {},
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 10, right: 10, top: 10),
                                child: TextField(
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
                                child: TextField(
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

                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 10, right: 10),
                                child: GestureDetector(
                                  onTap: () {},
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
                                height: 10,
                              )
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 10, right: 10, top: 10),
                              child: TextField(
                                keyboardType: TextInputType.multiline,
                                maxLines: 1,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(13),
                                  labelText: 'Mật khẩu hiện tại',
                                  labelStyle: TextStyle(fontSize: 12),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
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
                              child: TextField(
                                keyboardType: TextInputType.multiline,
                                maxLines: 1,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(13),
                                  labelText: 'Mật khẩu mới',
                                  labelStyle: TextStyle(fontSize: 12),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
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
                              child: TextField(
                                keyboardType: TextInputType.multiline,
                                maxLines: 1,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(13),
                                  labelText: 'Nhập lại mật khẩu',
                                  labelStyle: TextStyle(fontSize: 12),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
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
                            Spacer(),
                            Padding(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              child: GestureDetector(
                                onTap: () {},
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
                              height: 10,
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 10, right: 10, top: 10),
                              child: TextField(
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
                              child: TextField(
                                keyboardType: TextInputType.text,
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
                              child: TextField(
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
                            Spacer(),
                            Padding(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              child: GestureDetector(
                                onTap: () {},
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
                              height: 10,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
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
