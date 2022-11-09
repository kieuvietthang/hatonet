// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hatonet_hcn/app/blocs/bloc_job_postings/job_postings_bloc.dart';
import 'package:hatonet_hcn/app/blocs/bloc_job_postings/job_postings_event.dart';
import 'package:hatonet_hcn/app/blocs/job_postings_exports.dart';
import 'package:hatonet_hcn/app/model/job_postings.dart';

class JobPostingsTile extends StatefulWidget {
  final JobPostings jobPostings;

  const JobPostingsTile({Key? key, required this.jobPostings})
      : super(key: key);

  @override
  State<JobPostingsTile> createState() => _JobPostingsTileState();
}

class _JobPostingsTileState extends State<JobPostingsTile> {

  void _removeOrDeleteJobPostings(BuildContext ctx, JobPostings jobPostings) {
    jobPostings.isDeleted!
        ? ctx
            .read<JobPostingsBloc>()
            .add(DeleteJobPostings(jobPostings: jobPostings))
        : ctx
            .read<JobPostingsBloc>()
            .add(RemoveJobPostings(jobPostings: jobPostings));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Container(
        height: 211,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),

        ),
        padding: EdgeInsets.only(left: 10,right: 10,top: 10),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 49,
                    width: 49,
                    decoration: BoxDecoration(
                      color: Color(0xFFFF5400),
                      borderRadius: BorderRadius.circular(4),

                    ),
                    child: SvgPicture.asset('assets/images/logo hatonet-06 (2).png',height: 20,width: 20,),
                  ),
                ),
                SizedBox(
                  width: 9,
                ),
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.jobPostings.title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 9,
                      ),
                      Text(
                        'Công ty cổ phần Hachinet',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                          color: Colors.black.withOpacity(0.5),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () => _removeOrDeleteJobPostings(context, widget.jobPostings),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: SvgPicture.asset(
                            'assets/icons/ic_xmark.svg',
                            height: 20,
                            width: 20,
                            color: Colors.black.withOpacity(0.5)
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        child: Text(''),
                      )
                    ],
                  )
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                '${widget.jobPostings.unitPrice} / người',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  color: Color(0xFFFE5400),
                ),
              ),
            ),
            SizedBox(
              height: 9,
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 25,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Color(0xFFFF5400),
                      borderRadius: BorderRadius.circular(4),

                    ),
                    child: Center(
                      child: Text(
                        widget.jobPostings.skill,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    child: Text(''),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    child: Text(''),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    child: Text(''),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/ic_book_close.svg',
                        height: 18,
                        width: 18,
                        color: Colors.black.withOpacity(0.5),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Gói dịch vụ: BASIC',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 9,
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/ic_calendar_outlined.svg',
                        height: 18,
                        width: 18,
                        color: Colors.black.withOpacity(0.5),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Hợp đồng: ${widget.jobPostings.contractTerm}',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/ic_location.svg',
                        height: 18,
                        width: 18,
                        color: Colors.black.withOpacity(0.5),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        widget.jobPostings.area,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/ic_time.svg',
                          height: 18,
                          width: 18,
                          color: Colors.black.withOpacity(0.5),
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          widget.jobPostings.applicationDeadline,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFFFF5400),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 12),
                    child: Text(
                      'Thời hạn: ${widget.jobPostings.paymentTerm}',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ),
                  ),
                ),

              ],
            ),
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    widget.jobPostings.isFavorite = !widget.jobPostings.isFavorite;
                  });
                },
                child: Padding(
                  padding: EdgeInsets.only(right: 5),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: widget.jobPostings.isFavorite == false
                        ? SvgPicture.asset(
                      'assets/icons/ic_heart_solid.svg',
                      height: 18,
                      width: 18,
                      color: Colors.black.withOpacity(0.1),
                    )
                        : SvgPicture.asset(
                      'assets/icons/ic_heart_solid.svg',
                      height: 18,
                      width: 18,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
