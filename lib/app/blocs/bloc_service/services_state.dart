import 'package:equatable/equatable.dart';
import 'package:hatonet_hcn/app/model/services.dart';

class ServicesState extends Equatable {
  final List<Services> allServices;
  final List<Services> removedServices;
  final List<Services> favoriteServices;

  const ServicesState({
    this.allServices = const <Services>[],
    this.removedServices = const <Services>[],
    this.favoriteServices = const <Services>[],
  });

  @override
  List<Object?> get props => [allServices, removedServices,favoriteServices];

  Map<String, dynamic> toMap() {
    return {
      'allTasks': allServices.map((x) => x.toMap()).toList(),
      'removedServices': removedServices.map((x) => x.toMap()).toList(),
      'favoriteServices': favoriteServices.map((x) => x.toMap()).toList(),
    };
  }

  factory ServicesState.fromMap(Map<String, dynamic> map) {
    return ServicesState(
      allServices:
          List<Services>.from(map['allTasks']?.map((x) => Services.fromMap(x))),
      removedServices:
      List<Services>.from(map['removedServices']?.map((x) => Services.fromMap(x))),
      favoriteServices:
      List<Services>.from(map['favoriteServices']?.map((x) => Services.fromMap(x))),
    );
  }
}
