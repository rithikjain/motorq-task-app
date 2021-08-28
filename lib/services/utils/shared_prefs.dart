import 'package:get_storage/get_storage.dart';

class SharedPrefs {
  static void saveStudentID(String studentID) {
    GetStorage().write("student_id", studentID);
  }

  static String getStudentID() {
    return GetStorage().read("student_id");
  }

  static void saveStudentName(String studentName) {
    GetStorage().write("student_name", studentName);
  }

  static String getStudentName() {
    return GetStorage().read("student_name");
  }

  static void saveLoggedInStatus(bool status) {
    GetStorage().write("logged_in_staus", status);
  }

  static bool? getLoggedInStatus() {
    return GetStorage().read("logged_in_staus");
  }
}
