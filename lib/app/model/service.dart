import 'package:equatable/equatable.dart';

class Service extends Equatable {
  final String name;
  final String describe;
  final String status;
  final String support;
  final String cost;
  final String promotional;
  final String usedtime;
  bool? isDone;
  bool? isDeleted;

  Service({
    required this.name,
    required this.describe,
    required this.status,
    required this.support,
    required this.cost,
    required this.promotional,
    required this.usedtime,
    this.isDone,
    this.isDeleted,
  }){
    isDone = isDone ?? false;
    isDeleted = isDeleted ?? false;
  }

  Service copyWith({
    String? name,
    String? describe,
    String? status,
    String? support,
    String? cost,
    String? promotional,
    String? usedtime,
    bool? isDone,
    bool? isDeleted,
  }) {
    return Service(
      name: name ?? this.name,
      describe: describe ?? this.describe,
      status: status ?? this.status,
      support: support ?? this.support,
      cost: cost ?? this.cost,
      promotional: promotional ?? this.promotional,
      usedtime: usedtime ?? this.usedtime,
      isDone: isDone ?? this.isDone,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'describe': describe,
      'status': status,
      'support': support,
      'cost': cost,
      'promotional': promotional,
      'usedtime': usedtime,
      'isDone': isDone,
      'isDeleted': isDeleted,
    };
  }


  factory Service.fromMap(Map<String, dynamic> map) {
    return Service(
      name: map['name'] ?? '',
      describe: map['describe'] ?? '',
      status: map['status'] ?? '',
      support: map['support'] ?? '',
      cost: map['cost'] ?? '',
      promotional: map['promotional'] ?? '',
      usedtime: map['usedtime'] ?? '',
      isDone: map['isDone'],
      isDeleted: map['isDeleted'],
    );
  }

  @override
  List<Object?> get props =>
      [name, describe, status, support, cost,promotional,usedtime, isDone, isDeleted];
}
