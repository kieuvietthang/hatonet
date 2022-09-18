

import 'package:equatable/equatable.dart';
import 'package:hatonet_hcn/app/model/info.dart';

abstract class InfosEvent extends Equatable{
  const InfosEvent();

  @override
  List<Object> get props => [];
}

class AddInfo extends InfosEvent {
  final Info info;

  const AddInfo({required this.info});


  @override
  List<Object> get props => [info];
}

class UpdateInfo extends InfosEvent {
  final Info info;

  const UpdateInfo({required this.info});


  @override
  List<Object> get props => [info];
}

class DeleteInfo extends InfosEvent {
  final Info info;

  const DeleteInfo({required this.info});


  @override
  List<Object> get props => [info];
}