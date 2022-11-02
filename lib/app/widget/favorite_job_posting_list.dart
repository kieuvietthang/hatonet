import 'package:flutter/material.dart';
import 'package:hatonet_hcn/app/widget/favorite_job_posting_tile.dart';

import '../model/job_postings.dart';

class FavoriteJobPostingList extends StatelessWidget {
  const FavoriteJobPostingList({Key? key, required this.jobPostingsList})
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
            return FavoriteJobPostingTile(
              jobPostings: jobPostings,
            );
          },
        ),
      ),
    );
  }
}