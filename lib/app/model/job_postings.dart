class JobPostings {
  final String title;
  final String workingForm;
  final String amount;
  final String applicationDeadline;
  final String paymentTerm;
  final String contractTerm;
  final String experience;
  final String unitPrice;
  final String rank;
  final String academicLevel;
  final String skill;
  final String area;
  bool? isDone;
  bool? isDeleted;

  JobPostings({
    required this.title,
    required this.workingForm,
    required this.amount,
    required this.applicationDeadline,
    required this.paymentTerm,
    required this.contractTerm,
    required this.experience,
    required this.unitPrice,
    required this.rank,
    required this.academicLevel,
    required this.skill,
    required this.area,
    this.isDone,
    this.isDeleted,
  }) {
    isDone = isDone ?? false;
    isDeleted = isDeleted ?? false;
  }

  JobPostings copyWith({
    String? title,
    String? workingForm,
    String? amount,
    String? applicationDeadline,
    String? paymentTerm,
    String? contractTerm,
    String? experience,
    String? unitPrice,
    String? rank,
    String? academicLevel,
    String? skill,
    String? area,
    bool? isDone,
    bool? isDeleted,
  }) {
    return JobPostings(
      title: title ?? this.title,
      workingForm: workingForm ?? this.workingForm,
      amount: amount ?? this.amount,
      applicationDeadline: applicationDeadline ?? this.applicationDeadline,
      paymentTerm: paymentTerm ?? this.paymentTerm,
      contractTerm: contractTerm ?? this.contractTerm,
      experience: experience ?? this.experience,
      unitPrice: unitPrice ?? this.unitPrice,
      rank: rank ?? this.rank,
      academicLevel: academicLevel ?? this.academicLevel,
      skill: skill ?? this.skill,
      area: area ?? this.area,
      isDone: isDone ?? this.isDone,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'workingForm': workingForm,
      'amount': amount,
      'applicationDeadline': applicationDeadline,
      'paymentTerm': paymentTerm,
      'contractTerm': contractTerm,
      'experience': experience,
      'unitPrice': unitPrice,
      'rank': rank,
      'academicLevel': academicLevel,
      'skill': skill,
      'area': area,
      'isDone': isDone,
      'isDeleted': isDeleted,
    };
  }

  factory JobPostings.fromMap(Map<String, dynamic> map) {
    return JobPostings(
      title: map['title'] ?? '',
      workingForm: map['workingForm'] ?? '',
      amount: map['amount'] ?? '',
      applicationDeadline: map['applicationDeadline'] ?? '',
      paymentTerm: map['paymentTerm'] ?? '',
      contractTerm: map['contractTerm'] ?? '',
      experience: map['experience'] ?? '',
      unitPrice: map['unitPrice'] ?? '',
      rank: map['rank'] ?? '',
      academicLevel: map['academicLevel'] ?? '',
      skill: map['skill'] ?? '',
      area: map['area'] ?? '',
      isDone: map['isDone'] ?? '',
      isDeleted: map['isDeleted'] ?? '',
    );
  }

  @override
  List<Object?> get props => [
        title,
        workingForm,
        amount,
        applicationDeadline,
        paymentTerm,
        contractTerm,
        experience,
        unitPrice,
        rank,
        academicLevel,
        skill,
        area,
        isDone,
        isDeleted,
      ];
}
