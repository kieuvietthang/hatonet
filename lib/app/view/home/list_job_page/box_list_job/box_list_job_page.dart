import 'package:flutter/material.dart';
import 'package:hatonet_hcn/app/view/home/list_job_page/box_list_job/page_one/fake_data_page_one_box_list_job.dart';
import 'package:hatonet_hcn/app/view/home/list_job_page/box_list_job/page_one/item_box_list_job.dart';
import 'package:hatonet_hcn/app/view/home/list_job_page/box_list_job/page_two/fake_data_page_two_box_list_job.dart';
import 'package:hatonet_hcn/app/view/home/list_job_page/box_list_job/page_two/item_box_page_list_job.dart';

const double borderRadius = 25.0;

class BoxListJobPage extends StatefulWidget {
  @override
  _BoxListJobPageState createState() => _BoxListJobPageState();
}

class _BoxListJobPageState extends State<BoxListJobPage>
    with SingleTickerProviderStateMixin {
  late PageController _pageController;
  int activePageIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Image.asset('assets/images/hatonetlogi.png',
                            height: 30, width: 65),
                        Spacer(flex: 1,),
                        Container(
                          width: 200.0,
                          height: 30.0,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                            BorderRadius.all(Radius.circular(borderRadius)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Expanded(
                                child: InkWell(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(borderRadius)),
                                  onTap: _onPlaceBidButtonPress,
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    padding: EdgeInsets.symmetric(vertical: 5),
                                    alignment: Alignment.center,
                                    decoration: (activePageIndex == 0)
                                        ? BoxDecoration(
                                      color: Colors.amber,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(borderRadius)),
                                    )
                                        : null,
                                    child: Text(
                                      "Lịch sử lưu",
                                      style: (activePageIndex == 0)
                                          ? TextStyle(color: Colors.white)
                                          : TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: InkWell(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(borderRadius)),
                                  onTap: _onBuyNowButtonPress,
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    padding: EdgeInsets.symmetric(vertical: 5),
                                    alignment: Alignment.center,
                                    decoration: (activePageIndex == 1)
                                        ? const BoxDecoration(
                                      color: Colors.amber,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(borderRadius)),
                                    )
                                        : null,
                                    child: Text(
                                      "Đã lưu", style: (activePageIndex == 1) ? TextStyle(color: Colors.white) : TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black26,
                                      spreadRadius: -10.0,
                                      blurRadius: 10.0,
                                    ),
                                  ],
                                ),
                                child: IconButton(
                                  icon: Icon(
                                    Icons.arrow_back_sharp,
                                  ),
                                  iconSize: 18,
                                  onPressed: () {Navigator.pop(context);},
                                  splashRadius: 19,
                                  splashColor: Color(0xFFFF5400),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: PageView(
                      controller: _pageController,
                      physics: BouncingScrollPhysics(),
                      onPageChanged: (int i) {
                        FocusScope.of(context).requestFocus(FocusNode());
                        setState(() {activePageIndex = i;});
                      },
                      children: <Widget>[
                        ConstrainedBox(
                          constraints: const BoxConstraints.expand(),
                          child: SafeArea(
                            child: Stack(
                              children: <Widget>[
                                Column(
                                  children: [
                                    Expanded(
                                      child: SingleChildScrollView(physics: BouncingScrollPhysics(),
                                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(left: 10),
                                              child: Text(
                                                'Hôm nay - thứ 3 13 tháng 9,2022',
                                                style: TextStyle(fontSize: 14.0, color: Colors.black),
                                              ),
                                            ),
                                            ListView.builder(
                                                physics: NeverScrollableScrollPhysics(),
                                                itemCount: FAKE_BOX_LIST_JOB.length,
                                                shrinkWrap: true,
                                                itemBuilder: (BuildContextcontext, int index) =>
                                                    Padding(
                                                      padding: EdgeInsets.all(8.0),
                                                      child: ItemBoxListJob(item: FAKE_BOX_LIST_JOB[index], onClickItem: () {}),
                                                    )),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 10),
                                              child: Text('Hôm qua - thứ 2 12 tháng 9,2022',
                                                style: TextStyle(
                                                    fontSize: 14.0,
                                                    color: Colors.black),
                                              ),
                                            ),
                                            ListView.builder(
                                                physics: NeverScrollableScrollPhysics(),
                                                itemCount: FAKE_BOX_LIST_JOB.length,
                                                shrinkWrap: true,
                                                itemBuilder: (BuildContextcontext, int index) =>
                                                    Padding(
                                                      padding:
                                                      const EdgeInsets.all(8.0),
                                                      child: ItemBoxListJob(
                                                          item: FAKE_BOX_LIST_JOB[index],
                                                          onClickItem: () {}),
                                                    )),
                                            Center(
                                                child: Text('...',
                                                  style: TextStyle(
                                                      fontSize: 20.0,
                                                      color: Colors.black),
                                                )),
                                            SizedBox(
                                              height: 20,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints.expand(),
                          child: SafeArea(
                            child: Stack(
                              children: <Widget>[
                                Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height,
                                    child: Container(
                                      height: 100,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/logo hatonet-031.png'),
                                          fit: BoxFit.scaleDown,
                                        ),
                                      ),
                                      child: Column(
                                        children: [
                                          Expanded(
                                            child: SingleChildScrollView(
                                              physics: BouncingScrollPhysics(),
                                              child: ListView.builder(
                                                  physics: NeverScrollableScrollPhysics(),
                                                  itemCount:FAKE_BOX_PAGE_TWO_LIST_JOB.length,
                                                  shrinkWrap: true,
                                                  itemBuilder:
                                                      (BuildContext context,
                                                      int index) =>
                                                      Padding(padding: const EdgeInsets.all(8.0),
                                                        child: ItemBoxListPageJob(
                                                            item: FAKE_BOX_PAGE_TWO_LIST_JOB[index],
                                                            onClickItem: () {}),)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )),
                              ],
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
        ));
  }

  void _onPlaceBidButtonPress() {
    _pageController.animateToPage(0,
        duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
  }

  void _onBuyNowButtonPress() {
    _pageController.animateToPage(1,
        duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
  }
}