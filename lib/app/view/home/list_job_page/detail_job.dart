import 'package:flutter/material.dart';
import 'package:hatonet_hcn/app/view/home/list_job_page/skill_list_data_job/information_detail_job.dart';
class DetailJobPage extends StatefulWidget {
  DetailJobPage({Key? key}) : super(key: key);

  @override
  State<DetailJobPage> createState() => _DetailJobPageState();
}

class _DetailJobPageState extends State<DetailJobPage> {
  bool expandFla = true;
  int _activePage = 0;
  final PageController _pageController = PageController(initialPage: 0);
  final List<Widget> _pages = [
    PageOne(),
    //PageTwo(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column  (
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // body
            Expanded(
              child:  Stack(
                children: [
                  // the page view
                  PageView.builder(
                    controller: _pageController,
                    physics: BouncingScrollPhysics(),
                    onPageChanged: (int page) {
                      setState(() {
                        _activePage = page;
                      });
                    },
                    itemCount: _pages.length,
                    itemBuilder: (BuildContext context, int index) {
                      return _pages[index % _pages.length];
                    },
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    height: 10,
                    child: Container(
                      color: Colors.transparent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List<Widget>.generate(
                            _pages.length,
                                (index) => Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 1),
                              child: InkWell(
                                onTap: () {
                                  _pageController.animateToPage(index,
                                      duration: const Duration(milliseconds: 300),
                                      curve: Curves.easeIn);
                                },
                                child: CircleAvatar(
                                  radius: 3,
                                  backgroundColor: _activePage == index ? Colors.amber : Colors.grey,
                                ),
                              ),
                            )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}