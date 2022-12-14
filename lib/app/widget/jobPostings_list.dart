// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hatonet_hcn/app/model/job_postings.dart';
import 'package:hatonet_hcn/app/model/services.dart';
import 'package:hatonet_hcn/app/view/home/job_information_page/job_information_page.dart';
import 'package:hatonet_hcn/app/view/home/step_page/step_page.dart';
import 'package:hatonet_hcn/app/widget/job_postings_tile.dart';

class JobPostingsList extends StatelessWidget {
   JobPostingsList({Key? key, required this.jobPostingsList})
      : super(key: key);

  final List<JobPostings> jobPostingsList;



   @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(
          left: 10,
          right: 10,
        ),
        child: ListView.builder(
          itemCount: jobPostingsList.length,
          itemBuilder: (context, index) {
            var jobPostings = jobPostingsList[index];
            return InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => JobInformationPage(
                      jobPostings: jobPostingsList[index],
                    ),
                  ),
                );
              },
              child: JobPostingsTile(
                jobPostings: jobPostings,
              ),
            );
          },
        ),
      ),
    );
  }
}
