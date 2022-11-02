
class Info {
  final String phone;
  final String companyName;
  final String abbreviations;
  final String tax;
  final String website;
  final String detail;
  final String introduce;
  final String email;
  final String hotline;
  final String password;
  final String contact;
  final String contactEmail;

  Info(this.phone,
      this.companyName,
      this.abbreviations,
      this.tax,
      this.hotline,
      this.email,
      this.password,
      this.website,
      this.detail,
      this.introduce,
      this.contact,
      this.contactEmail,);

  Info.fromJson(Map<String, dynamic> json)
      : phone = json['phone'],
        companyName = json['companyName'],
        abbreviations = json['abbreviations'],
        tax = json['tax'],
        hotline = json['hotline'],
        email = json['email'],
        password = json['password'],
        website = json['website'],
        detail = json['detail'],
        introduce = json['introduce'],
        contact = json['contact'],
        contactEmail = json['contactEmail'];

  Map<String, dynamic> toJson() => {
    'phone':phone,
    'companyName':companyName,
    'abbreviations':abbreviations,
    'tax':tax,
    'hotline':hotline,
    'email':email,
    'password':password,
    'website':website,
    'detail':detail,
    'introduce':introduce,
    'contact':contact,
    'contactEmail':contactEmail,
  };

}
