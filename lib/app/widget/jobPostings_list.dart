// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hatonet_hcn/app/model/job_postings.dart';
import 'package:hatonet_hcn/app/widget/job_postings_tile.dart';

class JobPostingsList extends StatelessWidget {
  const JobPostingsList({Key? key, required this.jobPostingsList})
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
            return JobPostingsTile(
              jobPostings: jobPostings,
            );
          },
        ),
      ),
    );
  }
}
