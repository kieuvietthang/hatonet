import 'package:bloc/bloc.dart';
import 'package:hatonet_hcn/app/blocs/bloc/infos_event.dart';
import 'package:hatonet_hcn/app/blocs/bloc/infos_state.dart';
import 'package:hatonet_hcn/app/model/info.dart';


class InfosBloc extends Bloc<InfosEvent, InfosState> {
  InfosBloc() : super(const InfosState()) {
    on<AddInfo>(_onAddTask);
    on<UpdateInfo>(_onUpdateTask);
    on<DeleteInfo>(_onDeleteTask);
  }

  void _onAddTask(AddInfo event, Emitter<InfosState> emit) {
    final state = this.state;
    emit(InfosState(
      allInfos: List.from(state.allInfos)..add(event.info),
    ));
  }

  void _onUpdateTask(UpdateInfo event, Emitter<InfosState> emit) {
    final state = this.state;
    final task = event.info;
    final int index = state.allInfos.indexOf(task);
    List<Info> allInfos = List.from(state.allInfos)..remove(task);
    task.isDone == false
        ? allInfos.insert(index,task.copyWith(isDone: true))
        : allInfos.insert(index,task.copyWith(isDone: false));

    emit(InfosState(allInfos: allInfos));
  }

  void _onDeleteTask(DeleteInfo event, Emitter<InfosState> emit) {
    final state = this.state;
    emit(
        InfosState(
          allInfos: List.from(state.allInfos)..remove(event.info),
        )
    );

  }

  @override
  InfosState? fromJson(Map<String, dynamic> json) {
    return InfosState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(InfosState state) {
    return state.toMap();
  }
}