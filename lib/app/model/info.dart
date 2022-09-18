import 'package:equatable/equatable.dart';

class Info extends Equatable {
  final String phone;
  final String name;
  final String skype;
  final String tax;
  final String email;
  final String address;
  final String introduce;
  final String bankName;
  final String password;
  bool? isDone;
  bool? isDeleted;

  Info(
      {required this.phone,
      required this.name,
      required this.skype,
      required this.tax,
      required this.email,
      required this.address,
      required this.introduce,
      required this.bankName,
      required this.password,
      this.isDone,
      this.isDeleted}) {
    isDone = isDone ?? false;
    isDeleted = isDeleted ?? false;
  }

  Info copyWith({
    String? phone,
    String? name,
    String? skype,
    String? tax,
    String? email,
    String? address,
    String? introduce,
    String? bankName,
    String? password,
    bool? isDone,
    bool? isDeleted,
  }) {
    return Info(
      phone: phone ?? this.phone,
      name: name ?? this.name,
      skype: skype ?? this.skype,
      tax: tax ?? this.tax,
      email: email ?? this.email,
      address: address ?? this.address,
      introduce: introduce ?? this.introduce,
      bankName: bankName ?? this.bankName,
      password: password ?? this.password,
      isDone: isDone ?? this.isDone,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'phone': phone,
      'name': name,
      'skype': skype,
      'tax': tax,
      'email': email,
      'address': address,
      'introduce': introduce,
      'bankName': bankName,
      'password': password,
      'isDone': isDone,
      'isDeleted': isDeleted,
    };
  }

  factory Info.fromMap(Map<String, dynamic> map) {
    return Info(
      phone: map['phone'] ?? '',
      name: map['name'] ?? '',
      skype: map['skype'] ?? '',
      tax: map['tax'] ?? '',
      email: map['email'] ?? '',
      address: map['address'] ?? '',
      introduce: map['introduce'] ?? '',
      bankName: map['bankName'] ?? '',
      password: map['password'] ?? '',
      isDone: map['isDone'],
      isDeleted: map['isDeleted'],
    );
  }

  @override
  List<Object?> get props =>
      [phone, name, skype, tax, email, address, introduce,bankName,password, isDone, isDeleted];
}
