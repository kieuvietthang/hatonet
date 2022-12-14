// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_new, sort_child_properties_last

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hatonet_hcn/app/blocs/bloc_job_postings/job_postings_bloc.dart';
import 'package:hatonet_hcn/app/blocs/bloc_job_postings/job_postings_event.dart';
import 'package:hatonet_hcn/app/blocs/job_postings_exports.dart';
import 'package:hatonet_hcn/app/model/job_postings.dart';
import 'package:hatonet_hcn/app/services/guid_gen.dart';
import 'package:hatonet_hcn/app/view/home/create_news_request_page/customer_phone_list_viewmodel.dart';
import 'package:hatonet_hcn/app/view/home/job_postings_page/job_postings_page.dart';
import 'package:hatonet_hcn/app/viewmodel/base_viewmodel.dart';
import 'package:hatonet_hcn/app/widget/custom_page_route.dart';

class CustomerPhoneListPage extends PageProvideNode<CustomerPhoneListViewModel> {
  CustomerPhoneListPage({Key? key}) : super(key: key, params: []);

  @override
  Widget buildContent(BuildContext context) {
    return createNewsRequestPage(viewModel);
  }
}
class createNewsRequestPage extends StatefulWidget {
  CustomerPhoneListViewModel _customerListViewModel;

  createNewsRequestPage(this._customerListViewModel);

  @override
  State<createNewsRequestPage> createState() => _createNewsRequestPageState();
}

class _createNewsRequestPageState extends State<createNewsRequestPage> {
  CustomerPhoneListViewModel get customerListViewModel => widget._customerListViewModel;

  @override
  void initState() {
    applicationDeadlineController.text = "";
    super.initState();
  }

  _createNewsRequestPageState() {
    _workFormatValue = _workFormatList[0];
    _paymentTermValue = _paymentTermList[0];
    _contractTermValue = _contractTermList[0];
    _experienceValue = _experienceList[0];
    _unitPricevalue = _unitPriceList[0];
    _rankValue = _rankList[0];
    _academicLevelValue = _academicLevelList[0];
    _skillValue = _skillList[0];
    _areaValue = _areaList[0];
  }

  //H??nh th???c l??m vi???c
  final _workFormatList = ['Onite', 'Remote', 'Ch??a x??c minh'];
  String? _workFormatValue = '';

  //Th???i h???n thanh to??n
  final _paymentTermList = [
    'Sau 30 ng??y',
    'Sau 45 ng??y',
    'Sau 60 ng??y',
    'Th???a thu???n'
  ];
  String? _paymentTermValue = '';

  //Th???i h???n h???p ?????ng

  final _contractTermList = ['1 th??ng', '3 th??ng', '6 th??ng', ' 1 n??m'];
  String _contractTermValue = '';

  //Kinh nghi???m

  final _experienceList = [
    'D?????i 1 n??m',
    '2 n??m',
    '3 n??m',
    '4 n??m',
    't??? 5 n??m tr??? l??n'
  ];

  String? _experienceValue = '';

  //????n gi??

  final _unitPriceList = [
    '10 tri???u - 20 tri???u',
    '20 tri???u - 30 tri???u',
    '30 tri???u - 40 tri???u',
    '40 tri???u - 50 tri???u',
    '50 tri???u - 80 tri???u',
    'Tr??n 80 tri???u',
  ];

  String? _unitPricevalue = '';

  //C???p b???c

  final _rankList = [
    'Fresher',
    'Middle',
    'Junior',
    'Senior',
    'Architect',
    'Mid-Lever Manager',
    'Senior Leader'
  ];
  String? _rankValue = '';

  //Tr??nh ????? h???c v???n

  final _academicLevelList = [
    'Kh??ng c?? b???ng',
    'Cao ?????ng',
    '?????i h???c',
    'Cao h???c'
  ];
  String? _academicLevelValue = '';

  //K??? n??ng

  final _skillList = [
    'PHP',
    'NodeJS',
    'ASP.NET',
    'IOS',
    'Mobile Apps',
    'C++',
    'Android',
    'Laravel',
    'Codeigniter',
    'CakePHP',
    'Java',
    'Flutter',
    'JavaScirpt'
  ];
  String? _skillValue = '';

  //Khu v???c

  final _areaList = [
    'H?? N???i',
    'H??? Ch?? Minh',
    '???? N???ng',
    '???? L???t',
    'C???n Th??',
    'V??nh Ph??c'
  ];
  String _areaValue = '';

  TextEditingController titleController = TextEditingController();
  TextEditingController workingFormController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController applicationDeadlineController = TextEditingController();
  TextEditingController paymentTermController = TextEditingController();
  TextEditingController contractTermController = TextEditingController();
  TextEditingController experienceController = TextEditingController();
  TextEditingController unitPriceController = TextEditingController();
  TextEditingController rankController = TextEditingController();
  TextEditingController academicLevelController = TextEditingController();
  TextEditingController skillController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  TextEditingController jobDescriptionController = TextEditingController();
  TextEditingController skillRequirementsController = TextEditingController();
  TextEditingController culturalEnvironmentController = TextEditingController();

  void showSnackbar(BuildContext context) {
    final snackBar = SnackBar(
      content: Row(
        children: [
          Text('T???o g??i th??nh c??ng'),
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

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xFFECECEC),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                height: 60,
                width: double.infinity,
                color: Color(0xFFEEF5F5),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                CustomPageRoute(
                                    child: JobPostingsPage(),
                                    direction: AxisDirection.right),
                              );
                            },
                            child: SvgPicture.asset(
                              'assets/icons/ic_angle_left.svg',
                              height: 24,
                              width: 24,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      flex: 2,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'T???o y??u c???u',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              flex: 9,
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 5, right: 5),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 5, right: 10, top: 10),
                                  child: Container(
                                    height: 50.0,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(4),
                                      ),
                                    ),
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Kh??ng ???????c b??? tr???ng';
                                        } else
                                          null;
                                      },
                                      controller: titleController,
                                      keyboardType: TextInputType.text,
                                      maxLines: 1,
                                      decoration: InputDecoration(
                                          fillColor: Colors.white,
                                          contentPadding: EdgeInsets.all(13),
                                          hintText: 'Ti??u ?????',
                                          hintStyle: TextStyle(fontSize: 12),
                                          labelStyle: TextStyle(fontSize: 12),
                                          border: InputBorder.none),
                                    ),
                                  ),
                                ),
                              ),
                              //H??nh th???c l??m vi???c
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 5, right: 10, top: 10),
                                  child: Container(
                                    padding: EdgeInsets.only(left: 2),
                                    height: 50.0,
                                    decoration: new BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: new BorderRadius.all(
                                        new Radius.circular(4),
                                      ),
                                    ),
                                    child: DropdownButtonFormField<String>(
                                      hint: Text('th???ng'),
                                      value: _workFormatValue,
                                      items: _workFormatList
                                          .map((e) => DropdownMenuItem(
                                                child: Text(
                                                  e,
                                                  style:
                                                      TextStyle(fontSize: 14),
                                                ),
                                                value: e,
                                              ))
                                          .toList(),
                                      onChanged: (val) {
                                        setState(() {
                                          _workFormatValue = val as String;
                                        });
                                      },
                                      icon: Icon(
                                        Icons.arrow_drop_down,
                                        color: Colors.black.withOpacity(0.5),
                                      ),
                                      dropdownColor: Colors.white,
                                      decoration: InputDecoration(
                                        fillColor: Colors.white,
                                        contentPadding: EdgeInsets.all(13),
                                        hintText: 'H??nh th???c l??m vi???c',
                                        enabledBorder: InputBorder.none,
                                        // floatingLabelBehavior: FloatingLabelBehavior.auto,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              //S??? l?????ng
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 5, right: 10, top: 10),
                                  child: Container(
                                    height: 50.0,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(4),
                                      ),
                                    ),
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Kh??ng ???????c b??? tr???ng';
                                        } else
                                          null;
                                      },
                                      controller: amountController,
                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      decoration: InputDecoration(
                                        fillColor: Colors.white,
                                        contentPadding: EdgeInsets.all(13),
                                        hintText: 'S??? l?????ng',
                                        hintStyle: TextStyle(fontSize: 12),
                                        labelStyle: TextStyle(fontSize: 12),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              //H???n ???ng tuy???n
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 5, right: 10, top: 10),
                                  child: Container(
                                    height: 50.0,
                                    decoration: new BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: new BorderRadius.all(
                                        new Radius.circular(4),
                                      ),
                                    ),
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Kh??ng ???????c b??? tr???ng';
                                        } else
                                          null;
                                      },
                                      controller: applicationDeadlineController,
                                      keyboardType: TextInputType.text,
                                      maxLines: 2,
                                      decoration: InputDecoration(
                                        fillColor: Colors.white,
                                        contentPadding:
                                            EdgeInsets.only(left: 15, top: 15),
                                        hintText: 'H???n ???ng tuy???n',
                                        hintStyle: TextStyle(fontSize: 12),
                                        labelStyle: TextStyle(fontSize: 12),
                                        border: InputBorder.none,
                                        suffixIcon: IconButton(
                                          icon: Icon(Icons.calendar_month),
                                          onPressed: () async {
                                            DateTime? pickedDate =
                                                await showDatePicker(
                                                    context: context,
                                                    initialDate: DateTime.now(),
                                                    firstDate: DateTime(2000),
                                                    //DateTime.now() - not to allow to choose before today.
                                                    lastDate: DateTime(2101));

                                            if (pickedDate != null) {
                                              print(
                                                  pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                              String formattedDate =
                                                  DateFormat('yyyy-MM-dd')
                                                      .format(pickedDate);
                                              print(
                                                  formattedDate); //formatted date output using intl package =>  2021-03-16
                                              //you can implement different kind of Date Format here according to your requirement

                                              setState(() {
                                                applicationDeadlineController
                                                        .text =
                                                    formattedDate; //set output date to TextField value.
                                              });
                                            } else {
                                              print("Date is not selected");
                                            }
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              //Th???i h???n thanh to??n
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 5, right: 10, top: 10),
                                  child: Container(
                                    padding: EdgeInsets.only(left: 2),
                                    height: 50.0,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(4),
                                      ),
                                    ),
                                    child: DropdownButtonFormField(
                                      value: _paymentTermValue,
                                      items: _paymentTermList
                                          .map((e) => DropdownMenuItem(
                                                child: Text(
                                                  e,
                                                  style:
                                                      TextStyle(fontSize: 14),
                                                ),
                                                value: e,
                                              ))
                                          .toList(),
                                      onChanged: (val) {
                                        setState(() {
                                          _paymentTermValue = val as String;
                                        });
                                      },
                                      icon: Icon(
                                        Icons.arrow_drop_down,
                                        color: Colors.black.withOpacity(0.5),
                                      ),
                                      dropdownColor: Colors.white,
                                      decoration: InputDecoration(
                                        fillColor: Colors.white,
                                        contentPadding: EdgeInsets.all(13),
                                        hintText: 'Th???i h???n thanh to??n',
                                        enabledBorder: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              //Th???i h???n h???p ?????ng
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 5, right: 10, top: 10),
                                  child: Container(
                                    padding: EdgeInsets.only(left: 2),
                                    height: 50.0,
                                    decoration: new BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: new BorderRadius.all(
                                        new Radius.circular(4),
                                      ),
                                    ),
                                    child: DropdownButtonFormField(
                                      value: _contractTermValue,
                                      items: _contractTermList
                                          .map((e) => DropdownMenuItem(
                                                child: Text(
                                                  e,
                                                  style:
                                                      TextStyle(fontSize: 14),
                                                ),
                                                value: e,
                                              ))
                                          .toList(),
                                      onChanged: (val) {
                                        setState(() {
                                          _contractTermValue = val as String;
                                        });
                                      },
                                      icon: Icon(
                                        Icons.arrow_drop_down,
                                        color: Colors.black.withOpacity(0.5),
                                      ),
                                      dropdownColor: Colors.white,
                                      decoration: InputDecoration(
                                        fillColor: Colors.white,
                                        contentPadding: EdgeInsets.all(13),
                                        hintText: 'Th???i h???n h???p ?????ng',
                                        enabledBorder: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              //kinh nghi???m
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 5, right: 10, top: 10),
                                  child: Container(
                                    padding: EdgeInsets.only(left: 2),
                                    height: 50.0,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(4),
                                      ),
                                    ),
                                    child: DropdownButtonFormField(
                                      value: _experienceValue,
                                      items: _experienceList
                                          .map((e) => DropdownMenuItem(
                                                child: Text(
                                                  e,
                                                  style:
                                                      TextStyle(fontSize: 14),
                                                ),
                                                value: e,
                                              ))
                                          .toList(),
                                      onChanged: (val) {
                                        setState(() {
                                          _experienceValue = val as String;
                                        });
                                      },
                                      icon: Icon(
                                        Icons.arrow_drop_down,
                                        color: Colors.black.withOpacity(0.5),
                                      ),
                                      dropdownColor: Colors.white,
                                      decoration: InputDecoration(
                                        fillColor: Colors.white,
                                        contentPadding: EdgeInsets.all(13),
                                        hintText: 'kinh nghi???m',
                                        enabledBorder: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              //????n gi??
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 5, right: 10, top: 10),
                                  child: Container(
                                    padding: EdgeInsets.only(left: 2),
                                    height: 50.0,
                                    decoration: new BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: new BorderRadius.all(
                                        new Radius.circular(4),
                                      ),
                                    ),
                                    child: DropdownButtonFormField(
                                      value: _unitPricevalue,
                                      items: _unitPriceList
                                          .map((e) => DropdownMenuItem(
                                                child: Text(
                                                  e,
                                                  style:
                                                      TextStyle(fontSize: 14),
                                                ),
                                                value: e,
                                              ))
                                          .toList(),
                                      onChanged: (val) {
                                        setState(() {
                                          _unitPricevalue = val as String;
                                        });
                                      },
                                      icon: Icon(
                                        Icons.arrow_drop_down,
                                        color: Colors.black.withOpacity(0.5),
                                      ),
                                      dropdownColor: Colors.white,
                                      decoration: InputDecoration(
                                        fillColor: Colors.white,
                                        contentPadding: EdgeInsets.all(13),
                                        hintText: '????n gi??',
                                        enabledBorder: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              //C???p b???c
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 5, right: 10, top: 10),
                                  child: Container(
                                    padding: EdgeInsets.only(left: 2),
                                    height: 50.0,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(4),
                                      ),
                                    ),
                                    child: DropdownButtonFormField(
                                      value: _rankValue,
                                      items: _rankList
                                          .map((e) => DropdownMenuItem(
                                                child: Text(
                                                  e,
                                                  style:
                                                      TextStyle(fontSize: 14),
                                                ),
                                                value: e,
                                              ))
                                          .toList(),
                                      onChanged: (val) {
                                        setState(() {
                                          _rankValue = val as String;
                                        });
                                      },
                                      icon: Icon(
                                        Icons.arrow_drop_down,
                                        color: Colors.black.withOpacity(0.5),
                                      ),
                                      dropdownColor: Colors.white,
                                      decoration: InputDecoration(
                                        fillColor: Colors.white,
                                        contentPadding: EdgeInsets.all(13),
                                        hintText: 'C???p b???c',
                                        enabledBorder: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              //Tr??nh ????? h???c v???n
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 5, right: 10, top: 10),
                                  child: Container(
                                    padding: EdgeInsets.only(left: 2),
                                    height: 50.0,
                                    decoration: new BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: new BorderRadius.all(
                                        new Radius.circular(4),
                                      ),
                                    ),
                                    child: DropdownButtonFormField(
                                      value: _academicLevelValue,
                                      items: _academicLevelList
                                          .map((e) => DropdownMenuItem(
                                                child: Text(
                                                  e,
                                                  style:
                                                      TextStyle(fontSize: 14),
                                                ),
                                                value: e,
                                              ))
                                          .toList(),
                                      onChanged: (val) {
                                        setState(() {
                                          _academicLevelValue = val as String;
                                        });
                                      },
                                      icon: Icon(
                                        Icons.arrow_drop_down,
                                        color: Colors.black.withOpacity(0.5),
                                      ),
                                      dropdownColor: Colors.white,
                                      decoration: InputDecoration(
                                        fillColor: Colors.white,
                                        contentPadding: EdgeInsets.all(13),
                                        hintText: 'Tr??nh ????? h???c v???n',
                                        enabledBorder: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              //K??? n??ng
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 5, right: 10, top: 10),
                                  child: Container(
                                    padding: EdgeInsets.only(left: 2),
                                    height: 50.0,
                                    decoration: new BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: new BorderRadius.all(
                                        new Radius.circular(4),
                                      ),
                                    ),
                                    child: DropdownButtonFormField(
                                      value: _skillValue,
                                      items: _skillList
                                          .map((e) => DropdownMenuItem(
                                                child: Text(
                                                  e,
                                                  style:
                                                      TextStyle(fontSize: 14),
                                                ),
                                                value: e,
                                              ))
                                          .toList(),
                                      onChanged: (val) {
                                        setState(() {
                                          _skillValue = val as String;
                                        });
                                      },
                                      icon: Icon(
                                        Icons.arrow_drop_down,
                                        color: Colors.black.withOpacity(0.5),
                                      ),
                                      dropdownColor: Colors.white,
                                      decoration: InputDecoration(
                                        fillColor: Colors.white,
                                        contentPadding: EdgeInsets.all(13),
                                        hintText: 'K??? n??ng',
                                        enabledBorder: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              //Khu v???c
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 5, right: 10, top: 10),
                                  child: Container(
                                    padding: EdgeInsets.only(left: 2),
                                    height: 50.0,
                                    decoration: new BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: new BorderRadius.all(
                                        new Radius.circular(4),
                                      ),
                                    ),
                                    child: DropdownButtonFormField(
                                      value: _areaValue,
                                      items: _areaList
                                          .map((e) => DropdownMenuItem(
                                                child: Text(
                                                  e,
                                                  style:
                                                      TextStyle(fontSize: 14),
                                                ),
                                                value: e,
                                              ))
                                          .toList(),
                                      onChanged: (val) {
                                        setState(() {
                                          _areaValue = val as String;
                                        });
                                      },
                                      icon: Icon(
                                        Icons.arrow_drop_down,
                                        color: Colors.black.withOpacity(0.5),
                                      ),
                                      dropdownColor: Colors.white,
                                      decoration: InputDecoration(
                                        fillColor: Colors.white,
                                        contentPadding: EdgeInsets.all(13),
                                        hintText: 'Khu v???c',
                                        enabledBorder: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(left: 5, right: 10, top: 10),
                            child: Container(
                              height: 80.0,
                              decoration: new BoxDecoration(
                                color: Colors.white,
                                borderRadius: new BorderRadius.all(
                                  new Radius.circular(4),
                                ),
                              ),
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Kh??ng ???????c b??? tr???ng';
                                  } else
                                    null;
                                },
                                keyboardType: TextInputType.text,
                                maxLines: 1,
                                controller: jobDescriptionController,
                                decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    contentPadding: EdgeInsets.all(13),
                                    hintText: 'M?? t??? c??ng vi???c',
                                    hintStyle: TextStyle(fontSize: 12),
                                    labelStyle: TextStyle(fontSize: 12),
                                    border: InputBorder.none),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(left: 5, right: 10, top: 10),
                            child: Container(
                              height: 80.0,
                              decoration: new BoxDecoration(
                                color: Colors.white,
                                borderRadius: new BorderRadius.all(
                                  new Radius.circular(4),
                                ),
                              ),
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Kh??ng ???????c b??? tr???ng';
                                  } else
                                    null;
                                },
                                keyboardType: TextInputType.text,
                                maxLines: 1,
                                controller: skillRequirementsController,
                                decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    contentPadding: EdgeInsets.all(13),
                                    hintText: 'K??? n??ng y??u c???u',
                                    hintStyle: TextStyle(fontSize: 12),
                                    labelStyle: TextStyle(fontSize: 12),
                                    border: InputBorder.none),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(left: 5, right: 10, top: 10),
                            child: Container(
                              height: 80.0,
                              decoration: new BoxDecoration(
                                color: Colors.white,
                                borderRadius: new BorderRadius.all(
                                  new Radius.circular(4),
                                ),
                              ),
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Kh??ng ???????c b??? tr???ng';
                                  } else
                                    null;
                                },
                                keyboardType: TextInputType.text,
                                maxLines: 1,
                                controller: culturalEnvironmentController,
                                decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    contentPadding: EdgeInsets.all(13),
                                    hintText: 'M??i tr?????ng v??n h??a',
                                    hintStyle: TextStyle(fontSize: 12),
                                    labelStyle: TextStyle(fontSize: 12),
                                    border: InputBorder.none),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.only(left: 10, right: 10, bottom: 15),
                child: GestureDetector(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      var jobPostings = JobPostings(
                        title: titleController.text,
                        applicationDeadline: applicationDeadlineController.text,
                        experience: experienceController.text,
                        workingForm: _workFormatValue ?? '',
                        academicLevel: academicLevelController.text,
                        contractTerm: _contractTermValue,
                        unitPrice: _unitPricevalue ?? '',
                        rank: rankController.text,
                        skill: _skillValue ?? '',
                        amount: amountController.text,
                        paymentTerm: _paymentTermValue ?? '',
                        area: _areaValue,
                        id: GUIDGen.generate(),
                        isFavorite: false,
                        jobDescription: jobDescriptionController.text,
                        skillRequirements: skillRequirementsController.text,
                        culturalEnvironment: culturalEnvironmentController.text,
                      );
                      context.read<JobPostingsBloc>().add(
                            AddJobPostings(
                              jobPostings: jobPostings,
                            ),
                          );
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
                        'Ti???p t???c',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
