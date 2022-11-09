class JobPostings {
  final String id;
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
  final String jobDescription;
  final String skillRequirements;
  final String culturalEnvironment;
  bool? isDone;
  bool? isDeleted;
  bool isFavorite = false;

  JobPostings({
    required this.id,
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
    required this.jobDescription,
    required this.skillRequirements,
    required this.culturalEnvironment,
    this.isDone,
    this.isDeleted,
    required this.isFavorite,
  }) {
    isDone = isDone ?? false;
    isDeleted = isDeleted ?? false;
    isFavorite = false;
  }

  JobPostings copyWith({
    String? id,
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
    String? jobDescription,
    String? skillRequirements,
    String? culturalEnvironment,
    bool? isDone,
    bool? isDeleted,
    bool? isFavorite,
  }) {
    return JobPostings(
      id: id ?? this.id,
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
      jobDescription: jobDescription ?? this.jobDescription,
      skillRequirements: skillRequirements ?? this.skillRequirements,
      culturalEnvironment: culturalEnvironment ?? this.culturalEnvironment,
      isDone: isDone ?? this.isDone,
      isDeleted: isDeleted ?? this.isDeleted,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
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
      'jobDescription': jobDescription,
      'skillRequirements': skillRequirements,
      'culturalEnvironment': culturalEnvironment,
      'isDone': isDone,
      'isDeleted': isDeleted,
      'isFavorite': isFavorite,
    };
  }

  factory JobPostings.fromMap(Map<String, dynamic> map) {
    return JobPostings(
      id: map['id'] ?? '',
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
      jobDescription: map['jobDescription'] ?? '',
      skillRequirements: map['skillRequirements'] ?? '',
      culturalEnvironment: map['culturalEnvironment'] ?? '',
      isDone: map['isDone'] ?? '',
      isDeleted: map['isDeleted'] ?? '',
      isFavorite: map['isFavorite'] ?? '',
    );
  }

  @override
  List<Object?> get props => [
    id,
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
    jobDescription,
    skillRequirements,
    culturalEnvironment,
        isDone,
        isDeleted,
        isFavorite,
      ];
}
