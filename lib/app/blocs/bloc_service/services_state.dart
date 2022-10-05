import 'package:equatable/equatable.dart';
import 'package:hatonet_hcn/app/model/service.dart';

class ServicesState extends Equatable {
  final List<Service> allServices;
  final List<Service> removedServices;

  const ServicesState({
    this.allServices = const <Service>[],
    this.removedServices = const <Service>[],
  });

  @override
  List<Object?> get props => [allServices, removedServices];

  Map<String, dynamic> toMap() {
    return {
      'allTasks': allServices.map((x) => x.toMap()).toList(),
      'removedServices': removedServices.map((x) => x.toMap()).toList(),
    };
  }

  factory ServicesState.fromMap(Map<String, dynamic> map) {
    return ServicesState(
      allServices:
          List<Service>.from(map['allTasks']?.map((x) => Service.fromMap(x))),
      removedServices:
      List<Service>.from(map['removedServices']?.map((x) => Service.fromMap(x))),
    );
  }
}
