// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hatonet_hcn/app/blocs/bloc_job_postings/job_postings_bloc.dart';
import 'package:hatonet_hcn/app/blocs/bloc_job_postings/job_postings_state.dart';
import 'package:hatonet_hcn/app/di/injection.dart';
import 'package:hatonet_hcn/app/model/job_postings.dart';
import 'package:hatonet_hcn/app/model/services.dart';
import 'package:hatonet_hcn/app/module/common/navigator_screen.dart';
import 'package:hatonet_hcn/app/view/home/bottom/bottom_bar.dart';
import 'package:hatonet_hcn/app/view/home/create_news_request_page/create_news_request_page.dart';
import 'package:hatonet_hcn/app/view/home/step_page/step_page.dart';
import 'package:hatonet_hcn/app/widget/custom_page_route.dart';
import 'package:hatonet_hcn/app/widget/jobPostings_list.dart';

class JobPostingsPage extends StatefulWidget {
  const JobPostingsPage({Key? key}) : super(key: key);

  @override
  State<JobPostingsPage> createState() => _JobPostingsPageState();
}

class _JobPostingsPageState extends State<JobPostingsPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<JobPostingsBloc, JobPostingsState>(
        builder: (context, state) {
      List<JobPostings> jobPostingsList = state.allJobPostings;
      return SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xFFECECEC),
          body: Column(
            children: [
              Container(
                height: 80,
                width: double.infinity,
                color: Color(0xFFEEF5F5),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            CustomPageRoute(
                                child: BottomBarPage(),
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
                    Expanded(
                      flex: 4,
                      child: Container(
                        width: double.infinity,
                        height: 45,
                        decoration: BoxDecoration(
                          color: Color(0xFFD9D9D9).withOpacity(0.5),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Center(
                          child: TextField(
                            decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.search),
                                suffixIcon: IconButton(
                                  icon: const Icon(Icons.clear),
                                  onPressed: () {},
                                ),
                                hintText: 'T??m ki???m vi???c l??m',
                                border: InputBorder.none),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            CustomPageRoute(
                                child: StepPage(
                                  services: Services(
                                      isFavorite: false,
                                      status: '',
                                      isEdit: false,
                                      support: '',
                                      id: '',
                                      promotional: '',
                                      name: '',
                                      cost: '',
                                      describe: '',
                                      usedtime: ''),
                                  jobPostings: JobPostings(
                                    workingForm: '',
                                    rank: '',
                                    experience: '',
                                    unitPrice: '',
                                    applicationDeadline: '',
                                    contractTerm: '',
                                    title: '',
                                    paymentTerm: '',
                                    id: '',
                                    isFavorite: false,
                                    academicLevel: '',
                                    skill: '',
                                    area: '',
                                    amount: '',
                                    culturalEnvironment: '',
                                    skillRequirements: '',
                                    jobDescription: '',
                                  ),
                                ),
                                direction: AxisDirection.right),
                          );
                          // getIt<NavigationService>().pushScreenWithFade(CustomerPhoneListPage());
                        },
                        child: Container(
                          height: 30,
                          width: 30,
                          padding: EdgeInsets.only(top: 5, bottom: 5),
                          decoration: BoxDecoration(
                              color: Color(0xFFD9D9D9).withOpacity(0.5),
                              shape: BoxShape.circle),
                          child: SvgPicture.asset(
                            'assets/icons/plus-solid.svg',
                            height: 7,
                            width: 7,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              JobPostingsList(jobPostingsList: jobPostingsList),
            ],
          ),
        ),
      );
    });
  }
}
