import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hatonet_hcn/app/view/home/list_job_page/skill_list_data_job/fake_data_skill_list_job.dart';
import 'package:hatonet_hcn/app/view/home/list_job_page/skill_list_data_job/skill_list_data_job.dart';
class PageOne extends StatefulWidget {
  PageOne({Key? key}) : super(key: key);

  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  bool _expanded = true;
  bool _expande = true;
  bool _expand = true;
  bool _expan = true;
  bool _isBluetoothOn = false;
  bool _isBluetoothhOn = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // header về công ty
        Padding(
          padding: const EdgeInsets.only(left: 10,right: 10),
          child: Column(
            children: <Widget>[
              Row(
                children: [
                  // logo công ty
                  Padding(
                    padding: const EdgeInsets.only(top: 13),
                    child: Container(
                      height: 70,
                      width: 70,
                      child: Material(
                          elevation: 3,
                          shadowColor:Color(0xFFFF5400).withAlpha(35),
                          child: Image.asset('assets/images/logo hatonet-06.png',height: 84,width:70,)
                      ),
                    ),
                  ),
                  SizedBox(width: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 15,),
                      // text việc cần ứng tuyển
                      Row(
                        children: [
                          Text(
                            'Senior Android Engineer (Java - Kotlin)',
                            style: TextStyle(color: Color(0xFF000000), fontSize: 13,fontWeight:FontWeight.w300, ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 5),
                            child: Container(
                              width: 24,
                              height: 11,
                              child: Padding(
                                padding: EdgeInsets.only(left: 2),
                                child: Text('HOT', style: TextStyle(color: Colors.white, fontSize: 10,fontWeight:FontWeight.w300,),),
                              ),
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(15),),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5,),
                      Row(
                        children: [
                          //icon kinh nghiệm
                          SvgPicture.asset(
                            'assets/icons/ic_simple_calendar.svg',
                            height: 13.18,
                            width: 13.25,
                            color: Colors.black,
                          ),
                          //text kinh nghiệm
                          RichText(
                            text: TextSpan(
                              text: ' Kinh nghiệm: ',
                              style: TextStyle(color: Color(0xFF000000), fontSize: 12,fontWeight:FontWeight.w300, ),
                              children: <TextSpan>[
                                TextSpan(text: '2', style: TextStyle(color: Color(0xFF000000), fontSize: 12,fontWeight:FontWeight.w300, ),),
                                TextSpan(text:' năm', style: TextStyle(color: Color(0xFF000000), fontSize: 12,fontWeight:FontWeight.w300, ),),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5,),
                      Row(
                        children: [
                          //icon công ty
                          SvgPicture.asset(
                            'assets/icons/ic_building_line.svg',
                            height: 13.18,
                            width: 13.25,
                            color: Colors.black,
                          ),
                          //text công ty
                          Text(
                            ' Hachinet JSC',
                            style: TextStyle(color: Colors.black, fontSize: 12,fontWeight:FontWeight.w300,),
                          ),
                          SizedBox(width: 10,),
                          //icon địa điểm
                          SvgPicture.asset(
                            'assets/icons/ic_location.svg',
                            height: 13.18,
                            width: 13.25,
                            color: Colors.black,
                          ),
                          // text địa điểm
                          Text(' Hà Nội',
                            style: TextStyle(color: Colors.black, fontSize: 12,fontWeight:FontWeight.w300,),
                          ),
                        ],
                      ),
                      SizedBox(height: 5,),
                      Row(
                        children: [
                          // icon nộp hồ sơ
                          SvgPicture.asset(
                            'assets/icons/ic_circle_tick.svg',
                            height: 12,
                            width: 12,
                          ),
                          // text  Đã kiểm tra
                          Text(' Đã kiểm tra', style: TextStyle(fontSize: 12.0, color: Colors.black,fontWeight:FontWeight.w300),),
                        ],
                      ),
                    ],
                  ),
                  Spacer(flex: 1,),
                  Column(
                    children: [
                      SizedBox(height: 7,),
                      Padding(
                        padding: EdgeInsets.only(left: 25),
                        child: GestureDetector(
                            onTap: (){Navigator.pop(context);},
                            child: Icon(Icons.arrow_back_sharp,size: 21,)),
                      ),
                      SizedBox(height: 29,),
                      // icon tải về
                      Row(
                        children: [
                          InkWell(
                            onTap: (){
                              setState(() {
                                _isBluetoothOn = !_isBluetoothOn;
                              });
                            },
                            child: Icon(
                              _isBluetoothOn ?  Icons.download : Icons.download_outlined,
                              color: Color(0xE4FF4600),
                              size: 25,
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              setState(() {
                                _isBluetoothhOn = !_isBluetoothhOn;
                              });
                            },
                            child: Icon(
                              _isBluetoothhOn ? Icons.turned_in_not : Icons.turned_in_sharp,
                              color: Colors.yellow,
                              size: 25,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        // text lương
        Padding(
          padding: const EdgeInsets.only(left:8),
          child: RichText(
            text: TextSpan(
              text: 'Đơn giá:',
              style: TextStyle(color: Color(0xFF000000), fontSize: 15,fontWeight:FontWeight.w300, ),
              children: <TextSpan>[
                TextSpan(text:' 50 - 80', style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w500,color: Color(0xE4FF4600)),),
                TextSpan(text:' triệu đồng / ứng viên - tháng', style: TextStyle(color: Color(0xFF000000), fontSize: 14,fontWeight:FontWeight.w300, ),),
              ],
            ),
          ),
        ),
        // text Kỹ năng
        // Padding(
        //   padding: const EdgeInsets.only(left:8),
        //   child: Text('Kỹ năng:', style: TextStyle(color: Color(0xFF000000), fontSize: 15,fontWeight:FontWeight.w300, ),),
        // ),
        SizedBox(height: 5,),
        // danh sách kĩ năng
        Padding(
          padding: const EdgeInsets.only(left:8),
          child: Container(
            width: double.infinity,
            height: 30,
            child: Expanded(
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: FAKE_SKILL_LIST_JOB.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) => SkillItemListJob(item: FAKE_SKILL_LIST_JOB[index], onClickItem: (){})),
            ),
          ),
        ),
        SizedBox(height: 10,),
        Expanded(
          flex: 1,
          child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // Thông tin chi tiết
                    Theme(
                      data: ThemeData(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                      ),
                      child: ExpansionPanelList(
                        animationDuration: Duration(milliseconds: 1000),
                        elevation: 1,
                        children: [
                          ExpansionPanel(
                            headerBuilder: (context, isExpanded) {
                              return ListTile(
                                title: Text('Thông tin chi tiết', style: TextStyle(color: Colors.black ),),
                              );
                            },
                            body: Column(
                              children: [
                                ListTile(
                                  title: Row(
                                    children: [
                                      Padding(
                                        padding:EdgeInsets.only(bottom: 5),
                                        child: Icon(FontAwesomeIcons.calendar,size: 18,),
                                      ),
                                      Text(' Kinh nghiệm: 2 năm',style: TextStyle(color: Colors.black)),
                                    ],
                                  ),
                                ),
                                ListTile(
                                  title: Row(
                                    children: [
                                      Icon(FontAwesomeIcons.book,size: 18,),
                                      Text(' Trình độ học vấn: Đại Học',style: TextStyle(color: Colors.black)),
                                    ],
                                  ),
                                ),
                                ListTile(
                                  title: Row(
                                    children: [
                                      Icon(FontAwesomeIcons.briefcase,size: 18,),
                                      Text(' Vị trí: Senior',style: TextStyle(color: Colors.black)),
                                    ],
                                  ),
                                ),
                                ListTile(
                                  title: Row(
                                    children: [
                                      Icon(FontAwesomeIcons.boxArchive,size: 18,),
                                      Text(' Hình thức làm việc: Onsite',style: TextStyle(color: Colors.black)),
                                    ],
                                  ),
                                ),
                                ListTile(
                                  title: Row(
                                    children: [
                                      Icon(FontAwesomeIcons.users,size: 15,),
                                      Text('  Số lượng tuyển:',style: TextStyle(color: Colors.black)),
                                    ],
                                  ),
                                ),
                                ListTile(
                                  title: Row(
                                    children: [
                                      Icon(FontAwesomeIcons.clock,size: 18,),
                                      Text(' Hạn ứng tuyển: Còn 36 ngày',style: TextStyle(color: Colors.black)),
                                    ],
                                  ),
                                ),
                                ListTile(
                                  title: Row(
                                    children: [
                                      Icon(FontAwesomeIcons.solidCalendarMinus,size: 18,),
                                      Text(' Thời hạn thanh toán:',style: TextStyle(color: Colors.black)),
                                    ],
                                  ),
                                ),

                              ],
                            ),
                            isExpanded: _expanded,
                            canTapOnHeader: true,
                          ),
                        ],
                        dividerColor: Color(0xFFFF6600),
                        expansionCallback: (panelIndex, isExpanded) {
                          _expanded = !_expanded;
                          setState(() {});
                        },
                      ),
                    ),
                    SizedBox(height: 10,),
                    //Mô tả công việc
                    Theme(
                      data: ThemeData(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                      ),
                      child: ExpansionPanelList(
                        animationDuration: Duration(milliseconds: 1000),
                        elevation: 1,
                        dividerColor: Color(0xFFFF6600),
                        children: [
                          ExpansionPanel(
                            headerBuilder: (context, isExpanded) {
                              return Padding(
                                padding:EdgeInsets.symmetric(vertical: 1),
                                child: ListTile(
                                  title: Text('Mô tả công việc', style: TextStyle(color: Colors.black), ),
                                ),
                              );
                            },
                            body:ListTile(
                              title: Text('Môi trường làm việc chuyên nghiệp, thân thiện, cởi mở. Các thành viên trong công ty gần gũi, gắn bó, quan tâm, giúp đỡ nhau cùng phát triển. Được tham gia các hoạt động teambuilding hàng tháng, du lịch hàng năm. Tham gia các hoạt động phát triển tiếng Anh Công ty luôn động viên và tạo điều kiện tốt nhất cho toàn thể nhân viên. Công ty tổ chức các buổi sinh nhật cho nhân viên hàng tháng, tổ chức thưởng và kỉ niệm những ngày lễ tết trong năm. Hoạt động văn hóa thể thao đa dạng: câu lạc bộ bóng đá, gym, bơi lội, ...',textAlign:TextAlign.start ,style: TextStyle(color: Colors.black)),
                            ),
                            isExpanded: _expande,
                            canTapOnHeader: true,
                          ),
                        ],
                        expansionCallback: (panelIndex, isExpanded) {
                          _expande = !_expande;
                          setState(() {});
                        },
                      ),
                    ),
                    SizedBox(height: 10,),
                    //Yêu cầu công việc
                    Theme(
                      data: ThemeData(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                      ),
                      child: ExpansionPanelList(
                        animationDuration: Duration(milliseconds: 1000),
                        elevation: 1,
                        children: [
                          ExpansionPanel(
                            headerBuilder: (context, isExpanded) {
                              return ListTile(
                                title: Text('Yêu cầu công việc', style: TextStyle(color: Colors.black),),
                              );
                            },
                            body:ListTile(
                              title: Text('Tham gia các dự án thực tế phát triển phần mềm của Công ty trong quá trình được đào tạo.',style: TextStyle(color: Colors.black)),
                            ),
                            isExpanded: _expand,
                            canTapOnHeader: true,
                          ),
                        ],
                        dividerColor: Color(0xFFFF6600),
                        expansionCallback: (panelIndex, isExpanded) {
                          _expand = !_expand;
                          setState(() {

                          });
                        },
                      ),
                    ),
                    SizedBox(height: 10,),
                    //Môi trường văn hóa
                    Theme(
                      data: ThemeData(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                      ),
                      child: ExpansionPanelList(
                        animationDuration: Duration(milliseconds: 1000),
                        elevation: 1,
                        children: [
                          ExpansionPanel(
                            headerBuilder: (context, isExpanded) {
                              return ListTile(
                                title: Text('Môi trường văn hóa', style: TextStyle(color: Colors.black),),
                              );
                            },
                            body:ListTile(
                              title: Text('Thưởng lương tháng 13, lễ, tết. Ngoài ra, Cty còn tổ chức các ngày lễ riêng biệt: các giải đấu bóng đá được tổ chức đều đặn hàng tuần/tháng, tổ chức ngày tôn vinh các chàng trai IT, ngày tôn vinh các Phụ huynh nhân viên Cty, tổ chức hoạt động cho con em nhân viên trg các dịp Tết Thiếu nhi, ngày tôn vinh chị em phụ nữ, Tết Trung Thu, Sinh nhật nhân viên, Team building,….',style: TextStyle(color: Colors.black)),
                            ),
                            isExpanded: _expan,
                            canTapOnHeader: true,
                          ),
                        ],
                        dividerColor: Color(0xFFFF6600),
                        expansionCallback: (panelIndex, isExpanded) {
                          _expan = !_expan;
                          setState(() {
                          });
                        },
                      ),
                    ),
                  ]
              )
          ),
        ),
      ],
    );
  }
}