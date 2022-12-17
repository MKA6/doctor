import 'dart:collection';
import 'dart:developer';

import 'package:doctor/Search/SrarchDoctor.dart';
import 'package:doctor/admin/models/Category.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Search extends StatefulWidget {

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  LatLng? myLocation;

  getUserLocation() async {
    try {
      LocationPermission permission;
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          // Permissions are denied, next time you could try
          // requesting permissions again (this is also where
          // Android's shouldShowRequestPermissionRationale
          // returned true. According to Android guidelines
          // your App should show an explanatory UI now.
          return Future.error('Location permissions are denied');
        }
      }
      if (permission == LocationPermission.deniedForever) {
        // Permissions are denied forever, handle appropriately.
        return Future.error(
            'Location permissions are permanently denied, we cannot request permissions.');
      }
      Position position = await Geolocator.getCurrentPosition();
      this.myLocation = LatLng(position.latitude, position.longitude);
      if (myLocation != null) {}
    } catch (e) {
      log(e.toString());
    }
  }

  GoogleMapController? mapController;
  Set<Marker> markers = Set();
  LatLng showLocation1 = LatLng(31.5027920161292, 34.46680163018382);
  LatLng showLocation2 = LatLng(31.297549283645164, 34.243696622319284);

  @override
  void initState() {
    markers.add(Marker(
      markerId: MarkerId(showLocation1.toString()),
      position: showLocation1, //position of marker
      infoWindow: InfoWindow(
        title: 'My Custom Title ',
        snippet: 'My Custom Subtitle',
      ),
      icon: BitmapDescriptor.defaultMarker,
    ));
    markers.add(Marker(
      markerId: MarkerId(showLocation2.toString()),
      position: showLocation2, //position of marker
      infoWindow: InfoWindow(
        title: 'My Custom Title ',
        snippet: 'My Custom Subtitle',
      ),
      icon: BitmapDescriptor.defaultMarker,
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context, Widget? child) {
        return Scaffold(
          backgroundColor: const Color(0xff54C0FF),
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(
              92.r,
            ),
            child: AppBar(
              elevation: 0.0.r,
              backgroundColor: const Color(0xff54C0FF),
              title: Padding(
                padding: EdgeInsetsDirectional.only(
                  start: 27.r,
                  top: 37.r,
                ),
                child: Text('Search'),
              ),
              actions: [
                Padding(
                  padding: EdgeInsetsDirectional.only(
                    top: 27.r,
                    end: 15.r,
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.location_pin),
                  ),
                ),
              ],
            ),
          ),
          body: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.only(
                topStart: Radius.circular(40.r),
                topEnd: Radius.circular(40.r),
              ),
              color: Colors.white,
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Stack(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              children: [
                GoogleMap(
                  // mapType: MapType.normal,
                  zoomGesturesEnabled: true,
                  initialCameraPosition: CameraPosition(
                    target: showLocation1,
                    zoom: 10.0,
                  ),
                  markers: markers,
                  mapType: MapType.normal,
                  onMapCreated: (controller) {
                    setState(() {
                      mapController = controller;
                    });
                  },
                ),
                Container(
                  margin: EdgeInsetsDirectional.all(30.r),
                  width: 320.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.all(
                        Radius.circular(20.r),
                      ),
                      color: Colors.white),
                  child: Container(
                    width: 320.w,
                    height: 40.h,
                    padding: EdgeInsetsDirectional.all(10.r),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.all(
                        Radius.circular(30.r),
                      ),
                      color: Colors.white,
                    ),
                    child: TextField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: 'Scarch',
                        hintStyle: TextStyle(
                          fontSize: 12.sp,
                          color: Color(0xff878C99),
                        ),
                        prefixIcon: Icon(Icons.search),
                        border: InputBorder.none,
                      ),
                      style: const TextStyle(
                        color: Color(0xff878C99),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
