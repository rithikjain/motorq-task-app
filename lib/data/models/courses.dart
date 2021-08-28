class CoursesResponse {
  List<Course>? courses;
  String? message;

  CoursesResponse({this.courses, this.message});

  CoursesResponse.fromJson(Map<String, dynamic> json) {
    if (json['courses'] != null) {
      courses = <Course>[];
      json['courses'].forEach((v) {
        courses?.add(new Course.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.courses != null) {
      data['courses'] = this.courses?.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class Course {
  String? id;
  String? name;

  Course({this.id, this.name});

  Course.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
