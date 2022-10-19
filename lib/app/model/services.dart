import 'package:equatable/equatable.dart';

class Services extends Equatable {
  final String id;
  final String name;
  final String describe;
  final String status;
  final String support;
  final String cost;
  final String promotional;
  final String usedtime;
  bool? isDone;
  bool? isDeleted;
  bool isFavorite = false;
  bool isEdit = false;

  Services({
    required this.name,
    required this.id,
    required this.describe,
    required this.status,
    required this.support,
    required this.cost,
    required this.promotional,
    required this.usedtime,
    this.isDone,
    this.isDeleted,
    required this.isFavorite,
    required this.isEdit,
  }) {
    isDone = isDone ?? false;
    isDeleted = isDeleted ?? false;
    isEdit = false;
    isFavorite = false;

  }

  Services copyWith(
      {String? name,
      String? id,
      String? describe,
      String? status,
      String? support,
      String? cost,
      String? promotional,
      String? usedtime,
      bool? isDone,
      bool? isDeleted,
      bool? isFavorite,
      bool? isEdit}) {
    return Services(
      name: name ?? this.name,
      id: id ?? this.id,
      describe: describe ?? this.describe,
      status: status ?? this.status,
      support: support ?? this.support,
      cost: cost ?? this.cost,
      promotional: promotional ?? this.promotional,
      usedtime: usedtime ?? this.usedtime,
      isDone: isDone ?? this.isDone,
      isDeleted: isDeleted ?? this.isDeleted,
      isFavorite: isFavorite ?? this.isFavorite,
      isEdit: isEdit ?? this.isEdit,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'id': id,
      'describe': describe,
      'status': status,
      'support': support,
      'cost': cost,
      'promotional': promotional,
      'usedtime': usedtime,
      'isDone': isDone,
      'isDeleted': isDeleted,
      'isFavorite': isFavorite,
      'isEdit': isEdit,
    };
  }

  factory Services.fromMap(Map<String, dynamic> map) {
    return Services(
      name: map['name'] ?? '',
      id: map['id'] ?? '',
      describe: map['describe'] ?? '',
      status: map['status'] ?? '',
      support: map['support'] ?? '',
      cost: map['cost'] ?? '',
      promotional: map['promotional'] ?? '',
      usedtime: map['usedtime'] ?? '',
      isDone: map['isDone'],
      isDeleted: map['isDeleted'],
      isFavorite: map['isFavorite'] ?? '',
      isEdit: map['isEdit'] ?? '',
    );
  }

  @override
  List<Object?> get props => [
        name,
        id,
        describe,
        status,
        support,
        cost,
        promotional,
        usedtime,
        isDone,
        isDeleted,
        isFavorite,
        isEdit,
      ];
}
