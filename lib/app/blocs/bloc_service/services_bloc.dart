import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hatonet_hcn/app/blocs/bloc_exports.dart';
import 'package:hatonet_hcn/app/blocs/bloc_service/services_event.dart';
import 'package:hatonet_hcn/app/blocs/bloc_service/services_state.dart';
import 'package:bloc/bloc.dart';

class ServicesBloc extends HydratedBloc<ServicesEvent, ServicesState> {
  ServicesBloc() : super(const ServicesState()) {
    on<AddService>(_onAddService);
    on<UpdateService>(_onUpdateService);
    on<DeleteService>(_onDeleteService);
    on<EditService>(_onEditService);
  }

  void _onAddService(AddService event, Emitter<ServicesState> emit) {
    final state = this.state;
    emit(
      ServicesState(
        allServices: List.from(state.allServices)..add(event.services),
      ),
    );
  }

  void _onUpdateService(UpdateService event, Emitter<ServicesState> emit){}

  void _onEditService(EditService event, Emitter<ServicesState> emit){}

  void _onDeleteService(DeleteService event, Emitter<ServicesState> emit){
    final state = this.state;
    emit(ServicesState(
      allServices: List.from(state.allServices)..remove(event.services),
    ));
  }

  @override
  ServicesState? fromJson(Map<String, dynamic> json) {
    return ServicesState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(ServicesState state) {
    return state.toMap();
  }
}