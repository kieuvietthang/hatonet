import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hatonet_hcn/app/view/home/list_job_page/box_list_job/box_list_job_page.dart';
import 'package:hatonet_hcn/app/view/home/list_job_page/fake_data_list_job.dart';

class HelpAndSupportPage extends StatefulWidget {
  HelpAndSupportPage({Key? key}) : super(key: key);

  @override
  State<HelpAndSupportPage> createState() => _HelpAndSupportPageState();
}

int toggle = 0;
class _HelpAndSupportPageState extends State<HelpAndSupportPage> with SingleTickerProviderStateMixin {
  late AnimationController _con;
  bool isLoading = false;

  late List<String> autoCompleteData;

  late TextEditingController controller;
  Future fetchAutoCompleteData() async {
    setState(() {
      isLoading = true;
    });

    final String stringData = await rootBundle.loadString("assets/data.json");

    final List<dynamic> json = jsonDecode(stringData);

    final List<String> jsonStringData = json.cast<String>();

    setState(() {
      isLoading = false;
      autoCompleteData = jsonStringData;
    });
  }
  late TextEditingController _textEditingController;
  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
    fetchAutoCompleteData();
    _con = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 375),
    );
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFF5F5F5),
        body:
        // isLoading
        //     ? Center(
        //   child: CircularProgressIndicator(),
        // )
        //     :
        Padding(
          padding: EdgeInsets.all(9.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  // logo công ty
                  Image.asset('assets/images/hatonetlogi.png', height: 30,width: 65),
                  Spacer(flex: 1,),
                  // thanh tìm kiếm
                  Container(
                    height: 40,
                    color: Color(0xffF2F3F7),
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 375),
                      height: 20.0,
                      width: (toggle == 0) ? 40.0 : 250.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            spreadRadius: -10.0,
                            blurRadius: 5.0,
                            offset: Offset(0.0, 5.0),
                          ),
                        ],
                      ),
                      child: Stack(
                        children: [
                          AnimatedPositioned(
                            duration: Duration(milliseconds: 375),
                            top: 6.0,
                            right: 7.0,
                            child: AnimatedOpacity(
                              opacity: (toggle == 0) ? 0.0 : 1.0,
                              duration: Duration(milliseconds: 200),
                              child: Container(
                                padding: EdgeInsets.all(4.0),
                                decoration: BoxDecoration(
                                  color: Color(0xffF2F3F7),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: AnimatedBuilder(
                                  child: Icon(
                                    Icons.chevron_right_rounded,
                                    size: 20.0,
                                  ),
                                  builder: (context, widget) {
                                    return Transform.rotate(
                                      angle: _con.value * 2.0 * pi,
                                      child: widget,
                                    );
                                  },
                                  animation: _con,
                                ),
                              ),
                            ),
                          ),
                          AnimatedPositioned(
                            duration: Duration(milliseconds: 375),
                            left: (toggle == 0) ? 10.0 : 40.0,
                            top: 9.0,
                            child: AnimatedOpacity(
                              opacity: (toggle == 0) ? 0.0 : 1.0,
                              duration: Duration(milliseconds: 200),
                              child: Container(
                                height: 23.0,
                                width: 170,
                                child:  Autocomplete(
                                  optionsBuilder: (TextEditingValue textEditingValue) {
                                    if (textEditingValue.text.isEmpty) {
                                      return const Iterable<String>.empty();
                                    } else {
                                      return autoCompleteData.where((word) => word
                                          .toLowerCase()
                                          .contains(textEditingValue.text.toLowerCase()));
                                    }
                                  },
                                  fieldViewBuilder:
                                      (context, controller, focusNode, onEditingComplete) {
                                    this.controller = controller;
                                    return  TextField(
                                      controller: controller,
                                      focusNode: focusNode,
                                      cursorRadius: Radius.circular(40.0),
                                      onEditingComplete: onEditingComplete,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(vertical: 1),
                                        floatingLabelBehavior: FloatingLabelBehavior.never,
                                        labelText: 'Search...',
                                        labelStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(50.0),
                                          borderSide: BorderSide.none,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            splashRadius: 19.0,
                            icon: Icon(FontAwesomeIcons.search,size: 14,),
                            onPressed: () {
                              setState(
                                    () {
                                  if (toggle == 0) {
                                    toggle = 1;
                                    _con.forward();
                                  } else {
                                    toggle = 0;
                                    _textEditingController.clear();
                                    _con.reverse();
                                  }
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  ],
              ),
              // danh sách công việc
            InkWell(
                onTap: (){

                },
                child: Text('Giới thiệu',textAlign: TextAlign.left,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w300,color: Color(0xFFFF5A09)),)),
              SizedBox(height: 3,),
              Container(height: 1,color: Colors.grey,),
            Text('Hướng dẫn',textAlign: TextAlign.left,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w300,color: Color(0xFFFF5A09)),),
              SizedBox(height: 3,),
              Container(height: 1,color: Colors.grey,),
              SizedBox(height: 5,),
              Text('Các câu hỏi thường gặp',textAlign: TextAlign.left,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400,),),
              SizedBox(height: 5,),
              Text('Tìm kiếm các câu hỏi thường gặp theo danh mục',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w300,),),
              SizedBox(height: 10,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 70,
                    width: 115,
                    color: Color(0xFFFFF2EE),
                    child:Padding(
                      padding: EdgeInsets.only(top:10),
                      child: Column(
                        children: [
                        Icon(Icons.verified_user_outlined,color: Color(0xFFFF5A09),size: 30,),
                          SizedBox(height: 3,),
                          Text('Bảo mật',style: TextStyle(fontWeight: FontWeight.w300,fontSize:20),),
                        ],
                      ),
                    )
                  ),
                  SizedBox(width: 10,),
                  Container(
                      height: 70,
                      width: 115,
                      color: Color(0xFFFFF2EE),
                    child:Padding(
                      padding: EdgeInsets.only(top:10),
                      child: Column(
                        children: [
                          Icon(FontAwesomeIcons.file,color: Color(0xFFFF5A09),size: 30,),
                          SizedBox(height: 3,),
                          Text('Giấy phép',style: TextStyle(fontWeight: FontWeight.w300,fontSize:20),),
                        ],
                      ),
                    )
                  ),
                  SizedBox(width: 10,),
                  Container(
                      height: 70,
                      width: 115,
                   color: Color(0xFFFFF2EE),
                    child:Padding(
                      padding: EdgeInsets.only(top:10),
                      child: Column(
                        children: [
                        Icon(Icons.cases_outlined, color: Color(0xFFFF5A09),size: 30,),
                          SizedBox(height: 3,),
                          Text('Việc làm',style: TextStyle(fontWeight: FontWeight.w300,fontSize:20),),
                        ],
                      ),
                    )
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      height: 70,
                      width: 115,
                   color: Color(0xFFFFF2EE),
                    child:Padding(
                      padding: EdgeInsets.only(top:10),
                      child: Column(
                        children: [
                        Icon(Icons.work_outline_outlined,color: Color(0xFFFF5A09),size: 30,),
                          SizedBox(height: 3,),
                          Text('Hỗ trợ',style: TextStyle(fontWeight: FontWeight.w300,fontSize:20),),
                        ],
                      ),
                    )
                  ),
                  SizedBox(width: 10,),
                  Container(
                      height: 70,
                      width: 115,
                   color: Color(0xFFFFF2EE),
                    child:Padding(
                      padding: EdgeInsets.only(top:10),
                      child: Column(
                        children: [
                        Icon(Icons.message_outlined,color: Color(0xFFFF5A09),size: 30,),
                          SizedBox(height: 3,),
                          Text('Thanh toán',style: TextStyle(fontWeight: FontWeight.w300,fontSize:20),),
                        ],
                      ),
                    )
                  ),
                  SizedBox(width: 10,),
                  Container(
                      height: 70,
                      width: 115,
                   color: Color(0xFFFFF2EE),
                    child:Padding(
                      padding: EdgeInsets.only(top:10),
                      child: Column(
                        children: [
                          Icon(Icons.local_atm_outlined,color: Color(0xFFFF5A09),size: 30,),
                          SizedBox(height: 3,),
                          Text('Điểm thưởng',style: TextStyle(fontWeight: FontWeight.w300,fontSize:20),),
                        ],
                      ),
                    )
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
