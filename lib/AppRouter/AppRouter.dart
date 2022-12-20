import 'package:doctor/Helper/FirestoreHelper.dart';
import 'package:doctor/Provider/AdminProvider/AdminProvider.dart';
import 'package:doctor/Widgets/BottomSheet/doctorEvaluation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

class AppRouter {
  static GlobalKey<NavigatorState> navKey = GlobalKey();

  static showLoaderDialog() {
    AlertDialog alert = AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          Container(
              margin: EdgeInsets.only(left: 7), child: Text("Loading...")),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: navKey.currentContext!,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  static hideLoadingDialoug() {
    navKey.currentState!.pop();
  }

  static shoeCustomDialog(String content) {
    showDialog(
      context: navKey.currentContext!,
      builder: (context) {
        return AlertDialog(
          content: Text(content),
          actions: [
            TextButton(
              onPressed: () {
                navKey.currentState!.pop();
              },
              child: const Text(
                'OK',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  static showCustomDialogRating(double Rating) {
    showDialog(
      context: navKey.currentContext!,
      builder: (context) {
        return SingleChildScrollView(
          child: AlertDialog(
            // content: Text(Rating),
            actions: [
              Container(
                child: Padding(
                  padding: EdgeInsetsDirectional.all(25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      RatingBar.builder(
                        initialRating: Rating,
                        minRating: 1,
                        itemSize: 30,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        // بوقف العملية
                        itemCount: 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          Rating = rating;
                          // ودي التقيم هاد على البروفايل
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        //keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: "Enter Rating",
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                          enabled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: Colors.black.withOpacity(0.6),
                                width: .8),
                          ),
                        ),
                        style: TextStyle(color: Colors.black),
                        cursorColor: Colors.black,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.all(
                            Radius.circular(
                              20,
                            ),
                          ),
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            Provider.of<AdminProvider>(context , listen: false).updateUserRating();
                            // FirestoreHelper.firestoreHelper.updateUserRating(!);
                            //navKey.currentState!.pop();
                          },
                          child: Text(
                            'Rating',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  static navigateToScreen(Widget widget) {
    navKey.currentState!.push(MaterialPageRoute(builder: (context) {
      return widget;
    }));
  }

  static navigateAndReplaceScreen(Widget widget) {
    navKey.currentState!.pushReplacement(MaterialPageRoute(builder: (context) {
      return widget;
    }));
  }
}
