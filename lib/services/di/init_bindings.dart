import 'package:get/get.dart';
import 'package:vitclasses/services/network_controllers/class_controller.dart';
import 'package:vitclasses/services/network_controllers/student_controller.dart';

class InitBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(StudentController());
    Get.put(ClassController());
  }
}
