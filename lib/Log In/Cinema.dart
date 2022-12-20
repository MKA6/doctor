import 'package:doctor/Log%20In/signIn.dart';
import 'package:doctor/Models/slide.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Cinema extends StatefulWidget {
  PageController _controller = PageController();

  List<Slide> sliders = [
    Slide(
        image: 'images/Group@2x.png',
        title: 'Aya',
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
            'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. '
            'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. '
            'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
    Slide(
      image: 'images/Prof-H.jpg',
      title: 'Jurgen Harms',
      description:
          'Professor Harms unus est peritior spina chirurgi mundi. Per 10,000 chirurgiae spinae tractato, Professor Harms chirurgicam experientiam praestantem habet',
    ),
    Slide(
      image: 'images/Dr-Roehl.jpg',
      title: 'Henningus Rohl',
      description:
          'Specialista in medicina articulari artificiali, reposito et recognitione artuum artificialium, correctione deformitatum, Mannheim, Germania',
    ),
  ];

  @override
  State<Cinema> createState() => _CinemaState();
}

class _CinemaState extends State<Cinema> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context, Widget? child) {
        return Scaffold(
          backgroundColor: Color(0xFF0093FF),
          appBar: AppBar(
            elevation: 0.r,
            backgroundColor: Color(0xFF0093FF),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacement(MaterialPageRoute(builder: (context) {
                    return SignIn();
                  }));
                },
                style: ButtonStyle(
                  alignment: AlignmentDirectional.center,
                  elevation: MaterialStateProperty.all(0.0.r),
                  backgroundColor: MaterialStateProperty.all(Color(0xFF0093FF)),
                ),
                child: Text(
                  'Skip',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17.sp,
                  ),
                ),
              )
            ],
          ),
          body: Container(
            color: const Color(0xFF0093FF),
            alignment: AlignmentDirectional.center,
            child: Column(
              children: [
                Text(
                  'CINEMA',
                  style: TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontSize: 40.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                Container(
                  height: 450.h,
                  child: PageView.builder(
                    onPageChanged: (value) {
                      setState(() {});
                    },
                    // scrollBehavior: ScrollBehavior(),
                    controller: widget._controller,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) => Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                            vertical: 30.r,
                          ),
                          child: Stack(
                            alignment: AlignmentDirectional.center,
                            children: [
                              Container(
                                width: 290.w,
                                height: 190.h,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadiusDirectional.circular(15.r),
                                  color: Colors.black38,
                                ),
                              ),
                              Container(
                                width: 250.w,
                                height: 250.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadiusDirectional.all(
                                      Radius.circular(15.r)),
                                  // color: Colors.white
                                ),
                                clipBehavior: Clip.antiAlias,
                                child: Image.asset(
                                  // 'images/employee3.jpg',
                                  widget.sliders[index].image!,
                                  width: double.infinity,
                                  height: double.infinity,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Text(
                          widget.sliders[index].title!,
                          style: TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {});
                          },
                          // اعمل ظغط عليه انه يعرص الجزء الثاني في نفس الكونتينير
                          child: Container(
                            width: 210.w,
                            height: 66.h,
                            child: Text(
                              widget.sliders[index].description!,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 4,
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                color: Color(0xFFFFFFFF),
                                fontSize: 12.sp,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    itemCount: 3,
                  ),
                ),
                Container(
                  height: 8.h,
                  alignment: AlignmentDirectional.bottomCenter,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) => Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 2.r,
                      ),
                      width: widget._controller.page!.round() == index
                          ? 20.h
                          : 10.h,
                      height: 8,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100.r)),
                    ),
                    itemCount: widget.sliders.length,
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
