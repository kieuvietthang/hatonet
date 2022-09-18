import 'package:equatable/equatable.dart';
import 'package:hatonet_hcn/app/model/info.dart';

class InfosState extends Equatable{

  final List<Info> allInfos;

  const InfosState({
    this.allInfos = const <Info>[],

  });


  @override
  List<Object?> get props => [allInfos];

  Map<String, dynamic> toMap() {
    return {
      'allInfos': allInfos.map((x) => x.toMap()).toString(),
    };
  }

  factory InfosState.fromMap(Map<String, dynamic> map) {
    return InfosState(
        allInfos:
        List<Info>.from(map['allInfos']?.map((x) => Info.fromMap(x))));
  }

}