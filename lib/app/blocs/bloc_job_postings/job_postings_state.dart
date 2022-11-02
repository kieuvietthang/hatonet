import 'package:equatable/equatable.dart';
import 'package:hatonet_hcn/app/model/job_postings.dart';

class JobPostingsState extends Equatable {
  final List<JobPostings> allJobPostings;
  final List<JobPostings> removedJobPostings;
  final List<JobPostings> favoriteJobPostings;


  const JobPostingsState({
    this.allJobPostings = const <JobPostings>[],
    this.removedJobPostings = const <JobPostings>[],
    this.favoriteJobPostings = const <JobPostings>[],
  });

  @override
  List<Object?> get props => [allJobPostings,removedJobPostings];

  Map<String, dynamic> toMap() {
    return {
      'allTasks': allJobPostings.map((x) => x.toMap()).toList(),
      'removedTasks': removedJobPostings.map((x) => x.toMap()).toList(),
      'favoriteJobPostings': favoriteJobPostings.map((x) => x.toMap()).toList(),
    };
  }

  factory JobPostingsState.fromMap(Map<String, dynamic> map) {
    return JobPostingsState(
      allJobPostings: List<JobPostings>.from(map['allTasks']?.map((x) => JobPostings.fromMap(x))),

      removedJobPostings:
      List<JobPostings>.from(map['removedTasks']?.map((x) => JobPostings.fromMap(x))),
      favoriteJobPostings:
      List<JobPostings>.from(map['favoriteJobPostings']?.map((x) => JobPostings.fromMap(x))),
    );
  }
}
