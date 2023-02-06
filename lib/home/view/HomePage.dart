import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:location_app/home/controller/homeController.dart';
import 'package:permission_handler/permission_handler.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    location();
  }

  Future<Map<Permission, PermissionStatus>> location() async {
    Map<Permission, PermissionStatus> map =
        await [Permission.location].request();
    return map;
  }

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green.shade600,
          title: Text("Location"),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.menu))],
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                "assets/image/world.png",
                width: double.infinity,
              ),
              ElevatedButton(
                onPressed: () async {
                  homeController.position.value =
                      await Geolocator.getCurrentPosition(
                          desiredAccuracy: LocationAccuracy.high);
                },
                child: Text("Get Location"),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green.shade600),
              ),
              SizedBox(
                height: 10,
              ),
              Obx(
                () => Text(
                    "Lag : ${homeController.position.value.longitude},Lat : ${homeController.position.value.latitude}"),
              ),
              SizedBox(
                height: 25,
              ),
              ElevatedButton(
                onPressed: () async {
                  homeController.placeList.value = await placemarkFromCoordinates(
                      homeController.position.value.latitude,
                      homeController.position.value.longitude);
                },
                child: Text("Get Address"),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green.shade600),
              ),
              SizedBox(
                height: 10,
              ),
              Obx(
                () => Text(
                    "Address : ${homeController.placeList}"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
