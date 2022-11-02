import 'package:equatable/equatable.dart';
import 'package:hatonet_hcn/app/model/job_postings.dart';

abstract class JobPostingsEvent extends Equatable {
  const JobPostingsEvent();

  @override
  List<Object?> get props => [];
}



class AddJobPostings extends JobPostingsEvent {
  final JobPostings jobPostings;

  AddJobPostings({
    required this.jobPostings,
  });

  @override
  List<Object?> get props => [jobPostings];
}

class UpdateJobPostings extends JobPostingsEvent {
  final JobPostings jobPostings;

  UpdateJobPostings({
    required this.jobPostings,
  });

  @override
  List<Object?> get props => [jobPostings];
}

class RemoveJobPostings extends JobPostingsEvent {
  final JobPostings jobPostings;

  RemoveJobPostings({
    required this.jobPostings,
  });

  @override
  List<Object?> get props => [jobPostings];
}

class DeleteJobPostings extends JobPostingsEvent {
  final JobPostings jobPostings;

  DeleteJobPostings({
    required this.jobPostings,
  });

  @override
  List<Object?> get props => [jobPostings];
}

class MarkFavoriteOrUnfavoriteJobPostings extends JobPostingsEvent {
  final JobPostings jobPostings;

  const MarkFavoriteOrUnfavoriteJobPostings({
    required this.jobPostings,
  });

  @override
  List<Object?> get props => [jobPostings];
}

class EditJobPostings extends JobPostingsEvent {
  final JobPostings oldJobPostings;
  final JobPostings newJobPostings;

  const EditJobPostings({
    required this.oldJobPostings,
    required this.newJobPostings,
  });

  @override
  List<Object> get props => [oldJobPostings, newJobPostings];
}