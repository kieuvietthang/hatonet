// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hatonet_hcn/app/blocs/bloc_exports.dart';
import 'package:hatonet_hcn/app/blocs/bloc_job_postings/job_postings_bloc.dart';
import 'package:hatonet_hcn/app/blocs/bloc_job_postings/job_postings_state.dart';
import 'package:hatonet_hcn/app/blocs/bloc_service/services_state.dart';
import 'package:hatonet_hcn/app/model/job_postings.dart';
import 'package:hatonet_hcn/app/model/services.dart';
import 'package:hatonet_hcn/app/view/home/bottom/bottom_bar.dart';
import 'package:hatonet_hcn/app/widget/custom_page_route.dart';
import 'package:hatonet_hcn/app/widget/favorite_job_posting_list.dart';
import 'package:hatonet_hcn/app/widget/favorite_services_list.dart';

class FavoriteJobPostingsPage extends StatelessWidget {
  final JobPostings jobPostings;
  const FavoriteJobPostingsPage({Key? key, required this.jobPostings}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<JobPostingsBloc, JobPostingsState>(
        builder: (context,state) {
          List<JobPostings> jobPostingsList = state.allJobPostings;
          return SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
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
                          ),
                        ),

                        Expanded(
                          flex: 2,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Danh sách yêu thích',
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
                  FavoriteJobPostingList(jobPostingsList: jobPostingsList,)
                ],
              ),
            ),
          );
        }
    );
  }
}
