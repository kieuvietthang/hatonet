class ListItemPageBoxJob {
  String tittle = '';
  String date = '';
  String skillname = '';
  String firtskillname = '';
  String company = '';
  String city = '';
  String day = '';
  String icon = '';
  String time = '';
  String image = '';
  String checkimage = '';
  String status = '';
  String money = '';
  String deatailjob = '';

  ListItemPageBoxJob({
    required this.deatailjob,
    required this.day,
    required this.time,
    required this.image,
    required this.checkimage,
    required this.status,
    required this.money,
    required this.skillname,
    required this.firtskillname,
    required this.city,
    required this.company,
    required this.date,
    required this.tittle,
  });
  static ListItemPageBoxJob fromJson(json) => ListItemPageBoxJob(deatailjob: '', time: '', firtskillname: '', skillname: '', city: '', checkimage: '', image: '', money: '', status: '', date: '', day: '', tittle: '', company: '');
}
