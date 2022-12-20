import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class Search extends StatefulWidget {

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {

  GoogleMapController? mapController;
  Set<Marker> markers = Set();
  LatLng showLocation1 = LatLng(31.524382756686578, 34.44268848182834);
  LatLng showLocation2 = LatLng(31.417834050934434, 34.35067354440005);

  LatLng showLocation3 = LatLng(31.296884631230522, 34.24344984998272);

  Future<void> _launchUrl1(url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw 'Could not launch $url';
    }
  }
  Future<void> _launchUrl2(url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw 'Could not launch $url';
    }
  }

  Future<void> _launchUrl3(url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw 'Could not launch $url';
    }
  }

  // BitmapDescriptor? bitmapDescriptor;
  //
  // getBitmapDescriptor()async{
  //   bitmapDescriptor =await BitmapDescriptor.fromAssetImage( ImageConfiguration.empty, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0BKO2XDG9XrOr7w1MmVOm54oWonC-JB0jvg&usqp=CAU');
  // }


  @override
  void initState() {
    //getBitmapDescriptor();
    markers.add(Marker(
      markerId: MarkerId(showLocation1.toString()),
      position: showLocation1, //position of marker
      infoWindow: InfoWindow(
        title: 'Usman Yousaf',
        snippet: 'Brain surgery specialist',
      ),
      onTap: () {
        _launchUrl1('https://www.facebook.com/profile.php?id=100054380897219');
        /// لما اضغط عليه خلي يفتح صفحة العيادة الخاصة فيه
        // Provider.of<AdminProvider>(context).setBnbIndex(3);
        // AppRouter.navigateToScreen(Profile());
      },
      icon: BitmapDescriptor.defaultMarker,
    ));
    markers.add(Marker(
      markerId: MarkerId(showLocation2.toString()),
      position: showLocation2, //position of marker
      infoWindow: InfoWindow(
        title: 'Austin Disrel',
        snippet: 'Neurosurgery specialist',
      ),
      onTap: () {
        _launchUrl2('https://www.facebook.com/%D9%85%D8%B3%D8%AA%D8%B4%D9%81%D9%89-%D9%8A%D8%A7%D9%81%D8%A7-%D8%AF%D9%8A%D8%B1-%D8%A7%D9%84%D8%A8%D9%84%D8%AD-1422011274736697/');
      },
      icon: BitmapDescriptor.defaultMarker,
    ));
    markers.add(Marker(
      markerId: MarkerId(showLocation3.toString()),
      position: showLocation3, //position of marker
      infoWindow: InfoWindow(
        title: 'Ashkan Forouzani',
        snippet: 'Cardiac surgery specialist',
      ),
      onTap: () {
        _launchUrl3('');
      },
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
            child: Padding(
              padding: const EdgeInsetsDirectional.only(
                start: 27,
                top: 15,
              ),
              child: AppBar(
                elevation: 0.0.r,
                backgroundColor: const Color(0xff54C0FF),
                title: Text('Google Map' , style: TextStyle(fontSize: 25 , fontWeight: FontWeight.bold),),
                // title: Padding(
                //   padding: EdgeInsetsDirectional.
                //   ),
                //   child: Text('Google Map'),
                // ),
                // actions: [
                //   Padding(
                //     padding: EdgeInsetsDirectional.only(
                //       top: 27.r,
                //       end: 15.r,
                //     ),
                //     child: IconButton(
                //       onPressed: () {},
                //       icon: const Icon(Icons.location_pin),
                //     ),
                //   ),
                // ],
              ),
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
                  zoomGesturesEnabled: true,
                  initialCameraPosition: CameraPosition(
                    target: showLocation1,
                    zoom: 10.0,
                  ),
                  markers: markers,
                  mapType: MapType.satellite,
                  onMapCreated: (controller) {
                    setState(() {
                      mapController = controller;
                    });
                  },
                ),
                /**
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
                 * */

              ],
            ),
          ),
        );
      },
    );
  }
}
