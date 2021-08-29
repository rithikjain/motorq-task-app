import 'dart:developer';

import 'package:get/get.dart';
import 'package:vitclasses/data/models/api_response.dart';
import 'package:vitclasses/data/models/classes.dart';
import 'package:vitclasses/data/models/courses.dart';
import 'package:vitclasses/data/repositories/class_repository.dart';

class ClassController extends GetxController {
  final _repo = ClassRepository();

  var mapClasses = <Class>[].obs;

  void getClassesOnMap(String courseCode) async {
    final response = await _repo.getClassesForCourse(courseCode);
    if (response.status == Status.COMPLETED) {
      if (response.data!.classes != null) {
        mapClasses.clear();
        mapClasses.addAll(response.data!.classes!);
        mapClasses.refresh();
        log(mapClasses.toString());
      }
    }
  }

  var courses = <Course>[].obs;

  void getAllCourses() async {
    final response = await _repo.getAllCourses();
    if (response.status == Status.COMPLETED) {
      if (response.data!.courses != null) {
        courses.clear();
        courses.addAll(response.data!.courses!);
        courses.refresh();
        log(courses.toString());
      }
    }
  }

  var classesObs = ApiResponse<ClassesResponse>().obs;

  void getClassesForACourse(String courseCode) async {
    classesObs.value = ApiResponse<ClassesResponse>.loading();

    final response = await _repo.getClassesForCourse(courseCode);
    classesObs.value = response;
    update();
  }
}
