import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:vitclasses/services/network_controllers/class_controller.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final _classController = Get.find<ClassController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox.shrink(),
        leadingWidth: 0,
        title: TextField(
          textInputAction: TextInputAction.search,
          onSubmitted: (courseCode) {
            if (courseCode.isNotEmpty) {
              _classController.getClassesOnMap(courseCode.toUpperCase());
            }
          },
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search),
            hintText: 'Course Code',
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 24),
        child: Obx(
          () {
            var classes = _classController.mapClasses;
            var markers = classes
                .map(
                  (ele) => Marker(
                    width: 40.0,
                    height: 40.0,
                    point: LatLng(
                      ele.building!.location!.lat!,
                      ele.building!.location!.lon!,
                    ),
                    builder: (ctx) => GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          backgroundColor: Theme.of(context).cardColor,
                          builder: (context) => Container(
                            padding: const EdgeInsets.all(24),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  ele.course!.id.toString(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  ele.course!.name.toString(),
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(height: 24),
                                RichText(
                                  text: TextSpan(
                                    text: "Faculty: ",
                                    children: [
                                      TextSpan(
                                        text: ele.faculty,
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
                                        text: ele.building!.name,
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
                                        text: ele.timeString,
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
                                        text: ele.studentsRegistered.toString(),
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
                                SizedBox(height: 24),
                              ],
                            ),
                          ),
                        );
                      },
                      child: Container(
                        child: Icon(
                          Icons.location_on,
                          color: Theme.of(context).accentColor,
                          size: 40,
                        ),
                      ),
                    ),
                  ),
                )
                .toList();

            return FlutterMap(
              options: MapOptions(
                center: LatLng(12.973167, 79.159336),
                zoom: 15.8,
              ),
              layers: [
                TileLayerOptions(
                    urlTemplate:
                        "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                    subdomains: ['a', 'b', 'c']),
                MarkerLayerOptions(
                  markers: markers,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
