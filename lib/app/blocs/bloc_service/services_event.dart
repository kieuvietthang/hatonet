import 'package:equatable/equatable.dart';
import 'package:hatonet_hcn/app/blocs/bloc_service/services_state.dart';
import 'package:hatonet_hcn/app/model/services.dart';

abstract class ServicesEvent extends Equatable {
  const ServicesEvent();

  @override
  List<Object?> get props => [];
}



class AddService extends ServicesEvent {
  final Services services;

  AddService({
    required this.services,
  });

  @override
  List<Object?> get props => [services];
}

class UpdateService extends ServicesEvent {
  final Services services;

  UpdateService({
    required this.services,
  });

  @override
  List<Object?> get props => [services];
}

class RemoveService extends ServicesEvent {
  final Services services;

  RemoveService({
    required this.services,
  });

  @override
  List<Object?> get props => [services];
}

class DeleteService extends ServicesEvent {
  final Services services;

  DeleteService({
    required this.services,
  });

  @override
  List<Object?> get props => [services];
}


class MarkFavoriteOrUnfavoriteTask extends ServicesEvent {
  final Services services;

  const MarkFavoriteOrUnfavoriteTask({
    required this.services,
  });

  @override
  List<Object?> get props => [];
}

class EditServices extends ServicesEvent {
  final Services oldServices;
  final Services newServices;

  const EditServices({
    required this.oldServices,
    required this.newServices,
  });

  @override
  List<Object> get props => [oldServices, newServices];
}