import 'package:equatable/equatable.dart';

class Info extends Equatable {
  final String phone;
  final String companyName;
  final String abbreviations;
  final String tax;
  final String email;
  final String hotline;
  final String password;
  bool? isDone;
  bool? isDeleted;

  Info(
      {
        required this.phone,
      required this.companyName,
      required this.abbreviations,
      required this.tax,
      required this.hotline,
      required this.email,
      required this.password,
      this.isDone,
      this.isDeleted}) {
    isDone = isDone ?? false;
    isDeleted = isDeleted ?? false;
  }

  Info copyWith({
    String? phone,
    String? companyName,
    String? abbreviations,
    String? tax,
    String? hotline,
    String? email,
    String? password,
    bool? isDone,
    bool? isDeleted,
  }) {
    return Info(
      phone: phone ?? this.phone,
      companyName: companyName ?? this.companyName,
      abbreviations: abbreviations ?? this.abbreviations,
      tax: tax ?? this.tax,
      hotline: hotline ?? this.hotline,
      email: email ?? this.email,
      password: password ?? this.password,
      isDone: isDone ?? this.isDone,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'phone': phone,
      'companyName': companyName,
      'abbreviations': abbreviations,
      'tax': tax,
      'hotline': hotline,
      'email': email,
      'password': password,
      'isDone': isDone,
      'isDeleted': isDeleted,
    };
  }

  factory Info.fromMap(Map<String, dynamic> map) {
    return Info(
      phone: map['phone'] ?? '',
      companyName: map['companyName'] ?? '',
      abbreviations: map['abbreviations'] ?? '',
      tax: map['tax'] ?? '',
      hotline: map['hotline'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      isDone: map['isDone'],
      isDeleted: map['isDeleted'],
    );
  }

  @override
  List<Object?> get props =>
      [phone, companyName, abbreviations, tax, hotline,email,password, isDone, isDeleted];
}
