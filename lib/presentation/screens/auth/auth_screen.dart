import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:vitclasses/data/models/api_response.dart';
import 'package:vitclasses/presentation/screens/base/base_screen.dart';
import 'package:vitclasses/presentation/widgets/snackbar.dart';
import 'package:vitclasses/services/network_controllers/student_controller.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _regNoController = TextEditingController();
  final _nameController = TextEditingController();

  final _studentController = Get.find<StudentController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Obx(() {
            var status = _studentController.loginObs.value.status;

            if (status == Status.COMPLETED) {
              SchedulerBinding.instance?.addPostFrameCallback((_) {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => BaseScreen()),
                  (route) => false,
                );
                _studentController.resetLogin();
              });
            }

            if (status == Status.ERROR) {
              SchedulerBinding.instance?.addPostFrameCallback((_) {
                ScaffoldMessenger.of(context).showSnackBar(
                  errorSnackbar(
                    _studentController.loginObs.value.message.toString(),
                  ),
                );
                _studentController.resetLogin();
              });
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 52),
                RichText(
                  text: TextSpan(
                    text: "VIT",
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(
                        text: " Classes",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Let's get you started 😊",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                  ),
                ),
                SizedBox(height: 64),
                Text("Registration Number"),
                SizedBox(height: 8),
                TextField(
                  controller: _regNoController,
                  enabled: (status != Status.LOADING),
                  maxLines: 1,
                  decoration: InputDecoration(hintText: '19BDS0014'),
                ),
                SizedBox(height: 32),
                Text("Name"),
                SizedBox(height: 8),
                TextField(
                  controller: _nameController,
                  enabled: (status != Status.LOADING),
                  maxLines: 1,
                  decoration: InputDecoration(hintText: 'Rithik Jain'),
                ),
                SizedBox(height: 64),
                (status != Status.LOADING)
                    ? Container(
                        width: double.maxFinite,
                        height: 48,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).accentColor,
                          ),
                          onPressed: () {
                            if (_nameController.value.text.isNotEmpty &&
                                _regNoController.value.text.isNotEmpty) {
                              _studentController.login(
                                _regNoController.value.text,
                                _nameController.value.text,
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                errorSnackbar("Please fill both the fields :)"),
                              );
                            }
                          },
                          child: Text("Let's go"),
                        ),
                      )
                    : Center(
                        child: CircularProgressIndicator(),
                      ),
                SizedBox(height: 64),
              ],
            );
          }),
        ),
      ),
    );
  }
}
