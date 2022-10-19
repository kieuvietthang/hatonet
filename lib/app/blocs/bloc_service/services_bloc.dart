import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hatonet_hcn/app/blocs/bloc_exports.dart';
import 'package:hatonet_hcn/app/blocs/bloc_service/services_event.dart';
import 'package:hatonet_hcn/app/blocs/bloc_service/services_state.dart';
import 'package:bloc/bloc.dart';
import 'package:hatonet_hcn/app/model/services.dart';

class ServicesBloc extends HydratedBloc<ServicesEvent, ServicesState> {
  ServicesBloc() : super(const ServicesState()) {
    on<AddService>(_onAddService);
    on<UpdateService>(_onUpdateService);
    on<DeleteService>(_onDeleteService);
    on<RemoveService>(_onRemoveTask);
    on<EditServices>(_onEditServices);
    on<MarkFavoriteOrUnfavoriteTask>(_onMarkFavoriteOrUnfavoriteTask);
  }

  void _onAddService(AddService event, Emitter<ServicesState> emit) {
    final state = this.state;
    emit(
      ServicesState(
        allServices: List.from(state.allServices)..add(event.services),
        removedServices: state.removedServices,
      ),
    );
  }

  void _onUpdateService(UpdateService event, Emitter<ServicesState> emit){}


  void _onDeleteService(DeleteService event, Emitter<ServicesState> emit){
    final state = this.state;
    emit(ServicesState(
      allServices: state.allServices,
      removedServices: List.from(state.removedServices)..remove(event.services)
    ));
  }

  void _onRemoveTask(RemoveService event, Emitter<ServicesState> emit) {
    final state = this.state;
    emit(ServicesState(
      allServices: List.from(state.allServices)..remove(event.services),
      removedServices: List.from(state.removedServices)
        ..add(event.services.copyWith(isDeleted: true)),
    ));
  }


  void _onMarkFavoriteOrUnfavoriteTask(
      MarkFavoriteOrUnfavoriteTask event, Emitter<ServicesState> emit) {
    final state = this.state;
    List<Services> allServices = state.allServices;
    List<Services> favoriteServices = state.favoriteServices;
    if (event.services.isFavorite == false) {
      if (event.services.isFavorite == false) {
        var taskIndex = allServices.indexOf(event.services);
        allServices = List.from(allServices)
          ..insert(taskIndex, event.services.copyWith(isFavorite: true));
        favoriteServices.insert(0, event.services.copyWith(isFavorite: true));
      } else {
        var taskIndex = allServices.indexOf(event.services);
        allServices = List.from(allServices)
          ..insert(taskIndex, event.services.copyWith(isFavorite: false));
      }
    }
    emit(ServicesState(
      allServices: allServices,
      favoriteServices: state.favoriteServices,
    ));
  }

  void _onEditServices(EditServices event, Emitter<ServicesState> emit) {
    final state = this.state;
    List<Services> allServices = state.allServices;
    if (event.oldServices.isEdit == true) {
      allServices
        ..remove(event.oldServices)
        ..insert(0, event.newServices);
    }
    emit(ServicesState(
      allServices: List.from(state.allServices)
        ..insert(0, event.newServices),
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