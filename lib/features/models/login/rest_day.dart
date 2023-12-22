class RestDay {
  int? userId;
  int? mon;
  int? tue;
  int? wed;
  int? thr;
  int? fri;
  int? sat;
  int? sun;

  RestDay({this.userId, this.mon, this.tue, this.wed, this.thr, this.fri, this.sat, this.sun});

  RestDay.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    mon = json['mon'];
    tue = json['tue'];
    wed = json['wed'];
    thr = json['thr'];
    fri = json['fri'];
    sat = json['sat'];
    sun = json['sun'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['mon'] = mon;
    data['tue'] = tue;
    data['wed'] = wed;
    data['thr'] = thr;
    data['fri'] = fri;
    data['sat'] = sat;
    data['sun'] = sun;
    return data;
  }
}