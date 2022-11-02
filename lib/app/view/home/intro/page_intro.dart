// ignore_for_file: prefer_final_fields, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hatonet_hcn/app/view/home/intro/slider_page.dart';
import 'package:hatonet_hcn/app/view/sign_in/main_page.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int _currentPage = 0;

  PageController _controller = PageController();

  List<Widget> _pages = [
    SliderPage(
        title: 'TỐC ĐỘ',
        description:
            '- Tối ưu thời gian tuyển dụng.\n- Kết nối 1.0000 Doanh nghiệp IT cung ứng & tuyển dụng trên toàn quốc.\n- Thao tác đơn giản.\n- Tận dụng nguồn lực của nhiều doanh nghiệp CNTT.',
        image: 'assets/icons/ic_fastboy.svg'),
    SliderPage(
        title: 'TỐI ƯU',
        description:
            '- Tối ưu được chi phí cơ hội khi có nhu cầu lớn về nhân sự onsite.\n- Hỗ trợ kết nối thông qua hệ sinh thái của Hatonet đến các doanh nghiệp CNTT trên toàn quốc.',
        image: 'assets/icons/ic_oclock.svg'),
    SliderPage(
        title: 'TIN CẬY',
        description:
            '- Mức phí tối ưu nhất trên thị trường.\n- Hệ thống CMS được cập nhật và phát triển liên tục.\n- Luôn phát triển và đồng hành cùng doanh nghiệp CNTT Việt Nam',
        image: 'assets/icons/ic_trust.svg'),
  ];

  _onChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
           // scrollDirection: Axis.horizontal,
            controller: _controller,
            itemCount: _pages.length,
            onPageChanged: _onChanged,
            itemBuilder: (context, int index) {
              return _pages[index];
            },
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List<Widget>.generate(_pages.length, (int index) {
                    return AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      height: 10,
                      width: (index == _currentPage) ? 30 : 10,
                      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 30),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: (index == _currentPage)
                              ? Color(0xFFE65C00)
                              : Color(0xFFC9DCED)),
                    );
                  })),
              InkWell(
                onTap: () {
                  if(_currentPage == 2){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> MainPage()));
                  }
                  _controller.nextPage(
                      duration: Duration(milliseconds: 800),
                      curve: Curves.easeInOutQuint);
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    height: 50,
                    alignment: Alignment.center,
                    width: (_currentPage == (_pages.length - 1))
                        ? double.infinity
                        : double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xFFFF6116),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: (_currentPage == (_pages.length - 1))
                        ? Text(
                          'Bắt đầu',
                          style:
                              TextStyle(color: Colors.white, fontSize: 22,fontWeight: FontWeight.bold),
                        )
                        : Text(
                            'Tiếp tục',
                            style: TextStyle(color: Colors.white, fontSize: 22,fontWeight: FontWeight.bold),
                          ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              )
            ],
          )
        ],
      ),
    );
  }
}
