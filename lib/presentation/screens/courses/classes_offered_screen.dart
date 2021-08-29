import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vitclasses/data/models/api_response.dart';
import 'package:vitclasses/services/network_controllers/class_controller.dart';

class ClassesOfferedScreen extends StatefulWidget {
  final String courseCode;

  const ClassesOfferedScreen({Key? key, required this.courseCode})
      : super(key: key);

  @override
  _ClassesOfferedScreenState createState() => _ClassesOfferedScreenState();
}

class _ClassesOfferedScreenState extends State<ClassesOfferedScreen> {
  final _classController = Get.find<ClassController>();

  @override
  void initState() {
    super.initState();
    _classController.getClassesForACourse(widget.courseCode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.courseCode,
          style: TextStyle(
            color: Theme.of(context).accentColor,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      body: Obx(
        () {
          var _isLoading =
              _classController.classesObs.value.status == Status.LOADING;
          var _isCompleted =
              _classController.classesObs.value.status == Status.COMPLETED;
          var _data = _classController.classesObs.value.data;

          return (!_isLoading && _isCompleted)
              ? Container(
                  margin: EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 16),
                      Text(
                        "Tap a class to join.",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16),
                      Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: _data?.classes?.length ?? 0,
                          itemBuilder: (context, index) => GestureDetector(
                            onTap: () {},
                            child: Container(
                              padding: EdgeInsets.all(24),
                              margin: EdgeInsets.symmetric(vertical: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      text: "Faculty: ",
                                      children: [
                                        TextSpan(
                                          text: _data!.classes![index].faculty,
                                          style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ],
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  RichText(
                                    text: TextSpan(
                                      text: "Building: ",
                                      children: [
                                        TextSpan(
                                          text: _data
                                              .classes![index].building!.name,
                                          style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ],
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  RichText(
                                    text: TextSpan(
                                      text: "Timings: ",
                                      children: [
                                        TextSpan(
                                          text:
                                              _data.classes![index].timeString,
                                          style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ],
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  RichText(
                                    text: TextSpan(
                                      text: "Students Registered: ",
                                      children: [
                                        TextSpan(
                                          text: _data.classes![index]
                                              .studentsRegistered
                                              .toString(),
                                          style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ],
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              decoration: BoxDecoration(
                                color: Theme.of(context).cardColor,
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
