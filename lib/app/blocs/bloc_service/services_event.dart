import 'package:equatable/equatable.dart';
import 'package:hatonet_hcn/app/model/service.dart';

abstract class ServicesEvent extends Equatable {
  const ServicesEvent();

  @override
  List<Object?> get props => [];
}



class AddService extends ServicesEvent {
  final Service services;

  AddService({
    required this.services,
  });

  @override
  List<Object?> get props => [services];
}

class UpdateService extends ServicesEvent {
  final Service services;

  UpdateService({
    required this.services,
  });

  @override
  List<Object?> get props => [services];
}

class RemoveService extends ServicesEvent {
  final Service services;

  RemoveService({
    required this.services,
  });

  @override
  List<Object?> get props => [services];
}

class DeleteService extends ServicesEvent {
  final Service services;

  DeleteService({
    required this.services,
  });

  @override
  List<Object?> get props => [services];
}

class EditService extends ServicesEvent {
  final Service services;

  EditService({
    required this.services,
  });

  @override
  List<Object?> get props => [services];
}