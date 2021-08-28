import 'package:vitclasses/data/models/courses.dart';

class ClassesResponse {
  List<Class>? classes;
  String? message;

  ClassesResponse({this.classes, this.message});

  ClassesResponse.fromJson(Map<String, dynamic> json) {
    if (json['classes'] != null) {
      classes = <Class>[];
      json['classes'].forEach((v) {
        classes?.add(new Class.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.classes != null) {
      data['classes'] = this.classes?.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class Class {
  String? iD;
  Course? course;
  String? faculty;
  int? day;
  Building? building;
  String? startTime;
  String? endTime;
  String? timeString;
  int? studentsRegistered;

  Class(
      {this.iD,
      this.course,
      this.faculty,
      this.day,
      this.building,
      this.startTime,
      this.endTime,
      this.timeString,
      this.studentsRegistered});

  Class.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    course =
        json['course'] != null ? new Course.fromJson(json['course']) : null;
    faculty = json['faculty'];
    day = json['day'];
    building = json['building'] != null
        ? new Building.fromJson(json['building'])
        : null;
    startTime = json['start_time'];
    endTime = json['end_time'];
    timeString = json['time_string'];
    studentsRegistered = json['students_registered'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    if (this.course != null) {
      data['course'] = this.course?.toJson();
    }
    data['faculty'] = this.faculty;
    data['day'] = this.day;
    if (this.building != null) {
      data['building'] = this.building?.toJson();
    }
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    data['time_string'] = this.timeString;
    data['students_registered'] = this.studentsRegistered;
    return data;
  }
}

class Building {
  String? name;
  Location? location;

  Building({this.name, this.location});

  Building.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.location != null) {
      data['location'] = this.location?.toJson();
    }
    return data;
  }
}

class Location {
  double? lat;
  double? lon;

  Location({this.lat, this.lon});

  Location.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lon = json['lon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lat'] = this.lat;
    data['lon'] = this.lon;
    return data;
  }
}
