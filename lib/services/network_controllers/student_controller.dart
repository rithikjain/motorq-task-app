import 'package:get/get.dart';
import 'package:vitclasses/data/models/api_response.dart';
import 'package:vitclasses/data/repositories/student_repository.dart';

class StudentController extends GetxController {
  final _repo = StudentRepository();

  var loginObs = ApiResponse<bool>().obs;

  void login(String regNo, name) async {
    loginObs.value = ApiResponse<bool>.loading();
    final response = await _repo.login(regNo, name);
    loginObs.value = response;
    update();
  }

  void resetLogin() async {
    loginObs.value = ApiResponse<bool>();
    update();
  }
}
