import 'package:doctor/AppRouter/AppRouter.dart';
import 'package:doctor/Doctor/Doctor.dart';
import 'package:doctor/Profile/Profile.dart';
import 'package:doctor/Provider/AdminProvider/AdminProvider.dart';
import 'package:doctor/Search/Search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Home/Home.dart';

class BottoNavigationScreen extends StatefulWidget {
  @override
  State<BottoNavigationScreen> createState() => _HomeState();
}

class _HomeState extends State<BottoNavigationScreen> {
  int index = 0;
  List<Widget> pages = [
    Home(),
    Doctor(),
    Search(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadiusDirectional.only(
            topStart: Radius.circular(30),
            topEnd: Radius.circular(30),
          ),
          color: Colors.blue,
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: BottomNavigationBar(
          showSelectedLabels: false,
          currentIndex: Provider.of<AdminProvider>(context).bnbindex,
          onTap: (i) {
            Provider.of<AdminProvider>(context, listen: false).setBnbIndex(i);
            Provider.of<AdminProvider>(context , listen: false).bnbindex = i;

            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                'images/Home.png',
                color: Provider.of<AdminProvider>(context).bnbindex == 0
                    ? const Color(0xff0093FF)
                    : Colors.grey,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Image.asset(
                    'images/Doctor@2x.png',
                    color: Provider.of<AdminProvider>(context, listen: false).bnbindex == 1
                        ? const Color(0xff0093FF)
                        : Colors.grey,
                  ),
                  Image.asset(
                    'images/Combined Shape@2x.png',
                    width: 15,
                    height: 15,
                  ),
                ],
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.fmd_good,
                color: Provider.of<AdminProvider>(context, listen: false).bnbindex == 2
                    ? const Color(0xff0093FF)
                    : Colors.grey,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'images/Profile@3x.png',
                color: Provider.of<AdminProvider>(context , listen: false).bnbindex == 3
                    ? const Color(0xff0093FF)
                    : Colors.grey,
              ),
              label: '',
            ),
          ],
        ),
      ),
      body: pages[Provider.of<AdminProvider>(context, listen: false).bnbindex],
    );
  }
}
