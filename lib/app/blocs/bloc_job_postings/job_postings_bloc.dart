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
   // on<EditJobPostings>(_onEditJobPostings);
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

  // void _onEditJobPostings(EditJobPostings event, Emitter<JobPostingsState> emit) {
  //   final state = this.state;
  //   List<JobPostings> allJobPostings = state.allJobPostings;
  //   if (event.oldTask.isFavorite == true) {
  //     favouriteTasks
  //       ..remove(event.oldTask)
  //       ..insert(0, event.newTask);
  //   }
  //   emit(TasksState(
  //     pendingTasks: List.from(state.pendingTasks)
  //       ..remove(event.oldTask)
  //       ..insert(0, event.newTask),
  //     completedTasks: state.completedTasks..remove(event.oldTask),
  //     favoriteTasks: favouriteTasks,
  //     removedTasks: state.removedTasks,
  //   ));
  // }

  @override
  JobPostingsState? fromJson(Map<String, dynamic> json) {
    return JobPostingsState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(JobPostingsState state) {
    return state.toMap();
  }
}