import 'package:hatonet_hcn/app/blocs/bloc_exports.dart';
import 'package:hatonet_hcn/app/blocs/bloc_job_postings/job_postings_event.dart';
import 'package:hatonet_hcn/app/blocs/bloc_job_postings/job_postings_state.dart';
import 'package:hatonet_hcn/app/model/job_postings.dart';

class JobPostingsBloc extends HydratedBloc<JobPostingsEvent, JobPostingsState> {
  JobPostingsBloc() : super(const JobPostingsState()) {
    on<AddJobPostings>(_onAddJobPostings);
    on<UpdateJobPostings>(_onUpdateJobPostings);
    on<DeleteJobPostings>(_onDeleteJobPostings);
    on<RemoveJobPostings>(_onRemoveJobPostings);
  }

  void _onAddJobPostings(AddJobPostings event, Emitter<JobPostingsState> emit) {
    final state = this.state;
    emit(
      JobPostingsState(
        allJobPostings: List.from(state.allJobPostings)..add(event.jobPostings),
        removedJobPostings: state.removedJobPostings,
      ),
    );
  }

  void _onUpdateJobPostings(UpdateJobPostings event, Emitter<JobPostingsState> emit) {
    final state = this.state;
    final jobPostings = event.jobPostings;
    final int index = state.allJobPostings.indexOf(jobPostings);
    List<JobPostings> allJobPostings = List.from(state.allJobPostings)..remove(jobPostings);
    jobPostings.isDone == false
        ? allJobPostings.insert(index, jobPostings.copyWith(isDone: true))
        : allJobPostings.insert(index, jobPostings.copyWith(isDone: false));

    emit(JobPostingsState(allJobPostings: allJobPostings, removedJobPostings: state.removedJobPostings));
  }

  void _onDeleteJobPostings(DeleteJobPostings event, Emitter<JobPostingsState> emit) {
    final state = this.state;
    emit(JobPostingsState(
        allJobPostings: state.allJobPostings,
        removedJobPostings: List.from(state.removedJobPostings)..remove(event.jobPostings)
    ));
  }

  void _onRemoveJobPostings(RemoveJobPostings event, Emitter<JobPostingsState> emit) {
    final state = this.state;
    emit(JobPostingsState(
      allJobPostings: List.from(state.allJobPostings)..remove(event.jobPostings),
      removedJobPostings: List.from(state.removedJobPostings)
        ..add(event.jobPostings.copyWith(isDeleted: true)),
    ));
  }

  @override
  JobPostingsState? fromJson(Map<String, dynamic> json) {
    return JobPostingsState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(JobPostingsState state) {
    return state.toMap();
  }
}