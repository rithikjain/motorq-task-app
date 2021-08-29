import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:vitclasses/data/models/api_response.dart';
import 'package:vitclasses/data/models/classes.dart';
import 'package:vitclasses/data/models/courses.dart';
import 'package:vitclasses/services/api_routes.dart';

class ClassRepository {
  Future<ApiResponse<ClassesResponse>> getClassesForCourse(
    String courseCode,
  ) async {
    log("entered getClassesForCourse route");
    try {
      final response = await http.get(
        Uri.parse("$FetchClasses/$courseCode"),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        },
      );

      switch (response.statusCode) {
        case 200:
          return ApiResponse.completed(
            ClassesResponse.fromJson(json.decode(response.body)),
          );
        default:
          return ApiResponse.error("Something went wrong.");
      }
    } on SocketException {
      return ApiResponse.error("Please connect to the internet.");
    } catch (e) {
      log(e.toString());
      return ApiResponse.error("error: ${e.toString()}");
    }
  }

  Future<ApiResponse<CoursesResponse>> getAllCourses() async {
    log("entered getAllCourse route");
    try {
      final response = await http.get(
        Uri.parse(AllCourses),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        },
      );

      switch (response.statusCode) {
        case 200:
          return ApiResponse.completed(
            CoursesResponse.fromJson(json.decode(response.body)),
          );
        default:
          return ApiResponse.error("Something went wrong.");
      }
    } on SocketException {
      return ApiResponse.error("Please connect to the internet.");
    } catch (e) {
      log(e.toString());
      return ApiResponse.error("error: ${e.toString()}");
    }
  }
}
