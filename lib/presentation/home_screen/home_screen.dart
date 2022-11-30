// ignore_for_file: prefer_const_constructors, duplicate_ignore
import 'dart:ui' show ImageFilter;
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/core/app_export.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();

  List<Color> colorList = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow
  ];
  List<Alignment> alignmentList = [
    Alignment.bottomLeft,
    Alignment.bottomRight,
    Alignment.topRight,
    Alignment.topLeft,
  ];
  int index = 0;
  Color bottomColor = Colors.red;
  Color topColor = Colors.yellow;
  Alignment begin = Alignment.bottomLeft;
  Alignment end = Alignment.topRight;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        primary: true,
        endDrawer: context.isPhone
            ? BackdropFilter(
                filter: new ImageFilter.blur(
                  sigmaX: 2.0,
                  sigmaY: 2.0,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35),
                      bottomLeft: Radius.circular(35)),
                  child: Container(
                    width: 100,
                    child: Drawer(
                      backgroundColor: ColorConstant.white,
                      child: ListView(
                        // Important: Remove any padding from the ListView.
                        padding: EdgeInsets.zero,
                        children: [
                          Padding(padding: EdgeInsets.only(top: 20)),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Column(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                FaIcon(FontAwesomeIcons.home),
                                Text(
                                  'Home',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Column(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                FaIcon(FontAwesomeIcons.pagelines),
                                Text(
                                  'Home',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            : SizedBox(),
        backgroundColor: ColorConstant.black,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          // ignore: prefer_const_literals_to_create_immutables
          actions: [
            !context.isPhone
                ? Padding(
                    padding: const EdgeInsets.only(right: 50),
                    child: Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Text(
                          'Home'.toUpperCase(),
                          style: TextStyle(
                              fontFamily: 'Century Gothic',
                              color: ColorConstant.white),
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        Text(
                          'Portfolio'.toUpperCase(),
                          style: TextStyle(
                              fontFamily: 'Century Gothic',
                              color: ColorConstant.white),
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        Text(
                          'About'.toUpperCase(),
                          style: TextStyle(
                              fontFamily: 'Century Gothic',
                              color: ColorConstant.white),
                        )
                      ],
                    ),
                  )
                : SizedBox(),
            context.isPhone
                ? IconButton(
                    icon: FaIcon(FontAwesomeIcons.bars),
                    onPressed: () {
                      print("Pressed");
                      _scaffoldKey.currentState!.openEndDrawer();
                    })
                : SizedBox()
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 12, right: 12, top: 12),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    decoration: BoxDecoration(
                        // border: Border.all(color: Colors.brown),
                        color: Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          //crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            // Spacer(),
                            !context.isPhone
                                ? animatedText(context)
                                : SizedBox(),
                            SizedBox(
                              width: !context.isPhone ? 45 : 0,
                              height: !context.isPhone ? 0 : 5,
                            ),
                            DottedBorder(
                              borderType: BorderType.RRect,

                              color: Colors.white, //color of dotted/dash line
                              strokeWidth: 1.2, //thickness of dash/dots
                              dashPattern: [7, 5],
                              radius: Radius.circular(200),
                              child: Card(
                                color: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(200),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(4),
                                  child: Material(
                                    // Replace this child with your own
                                    elevation: 0,
                                    shape: CircleBorder(),

                                    child: CircleAvatar(
                                      backgroundColor: Colors.grey[100],
                                      // ignore: prefer_const_constructors
                                      backgroundImage: AssetImage(
                                        'assets/images/Dp.jpg',
                                      ),
                                      radius: 100,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      context.isPhone ? animatedText(context) : SizedBox(),
                    ]),
                  ),
                ),
                SizedBox(height: 20),
                work(context),
              ],
            ),
          ),
        ));
  }
}

commonButton(BuildContext context) {
  return Row(
    mainAxisAlignment:
        context.isPhone ? MainAxisAlignment.center : MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      OutlinedButton(
        onPressed: () {},
        child: const Text(
          'Portfolio',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Century Gothic',
          ),
        ),
        style: OutlinedButton.styleFrom(
            shape: StadiumBorder(),
            primary: Colors.white,
            side: BorderSide(
              width: 1,
              color: Colors.white,
            ),
            backgroundColor: Colors.white,
            padding: const EdgeInsets.all(20)),
      ),
      SizedBox(
        width: 10,
      ),
      OutlinedButton(
        onPressed: () {
          launch(
              'https://drive.google.com/file/d/1Rm6jee7Q948kiyUkiCAuzKwoAwcIHAkD/view?usp=sharing');
        },
        child: const Text(
          'Resume',
          style: TextStyle(
            fontFamily: 'Century Gothic',
          ),
        ),
        style: OutlinedButton.styleFrom(
            shape: StadiumBorder(),
            primary: Colors.white,
            side: BorderSide(width: 1, color: Colors.white),
            backgroundColor: Colors.transparent,
            padding: const EdgeInsets.all(20)),
      ),
    ],
  );
}

work(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        'Previous Work:',
        textAlign: TextAlign.left,
        style: (TextStyle(
          color: ColorConstant.black,
          fontWeight: FontWeight.w300,
          fontSize: 24,
          backgroundColor: ColorConstant.white,
          fontFamily: 'Sequel 100 Black',
        )),
      ),
      SizedBox(
        height: 5,
      ),
      // ignore: unnecessary_new
      Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  'assets/images/Horn7.png',
                  scale: context.isPhone ? 3 : 2.5,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8, top: 8),
                    child: Text('Horn7',
                        style: TextStyle(
                            fontFamily: 'Century Gothic',
                            fontSize: 15,
                            color: ColorConstant.white)),
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () {
                        launch(
                            'https://play.google.com/store/apps/details?id=gnhub.horn7');
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8, top: 8),
                        child: FaIcon(
                          FontAwesomeIcons.googlePlay,
                          color: ColorConstant.white,
                          size: 16,
                        ),
                      ),
                    ),
                  ),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () {
                        launch(
                            'https://apps.apple.com/me/app/horn7/id1591019805');
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8, top: 8),
                        child: FaIcon(
                          FontAwesomeIcons.appStore,
                          color: ColorConstant.white,
                          size: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),

      SizedBox(
        height: 5,
      ),
      // ignore: unnecessary_new
      Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  'assets/images/Fees.png',
                  scale: context.isPhone ? 3 : 2.5,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8, top: 8),
                    child: Text('Fees Collection',
                        style: TextStyle(
                            fontFamily: 'Century Gothic',
                            fontSize: 15,
                            color: ColorConstant.white)),
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () {
                        launch(
                            'https://play.google.com/store/apps/details?id=gnhub.feesmanagement');
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8, top: 8),
                        child: FaIcon(
                          FontAwesomeIcons.googlePlay,
                          color: ColorConstant.white,
                          size: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      SizedBox(
        height: 5,
      ),
      // ignore: unnecessary_new
      Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  'assets/images/WpDirect.png',
                  scale: context.isPhone ? 3 : 2.5,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8, top: 8),
                    child: Text('WP Direct',
                        style: TextStyle(
                            fontFamily: 'Century Gothic',
                            fontSize: 15,
                            color: ColorConstant.white)),
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () {
                        launch(
                            'https://galaxystore.samsung.com/detail/com.example.whatsapp_direct?session_id=W_4ba8a7dae7e3239f1224b3f3f710c38ehttps://galaxystore.samsung.com/detail/com.example.whatsapp_direct?session_id=W_4ba8a7dae7e3239f1224b3f3f710c38e');
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8, top: 8),
                        child: FaIcon(
                          FontAwesomeIcons.android,
                          color: ColorConstant.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () {
                        launch('https://appgallery.huawei.com/app/C104138749');
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8, top: 8),
                        child: FaIcon(
                          FontAwesomeIcons.globe,
                          color: ColorConstant.white,
                          size: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      SizedBox(
        height: 5,
      ),
      // ignore: unnecessary_new
      Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  'assets/images/sugarin.png',
                  scale: context.isPhone ? 3 : 2.5,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8, top: 8),
                    child: Text('Sugarin',
                        style: TextStyle(
                            fontFamily: 'Century Gothic',
                            fontSize: 15,
                            color: ColorConstant.white)),
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () {
                        launch(
                            'https://play.google.com/store/apps/details?id=gnhub.ecom.sugarcakeapp&hl=en_US&gl=US');
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8, top: 8),
                        child: FaIcon(
                          FontAwesomeIcons.googlePlay,
                          color: ColorConstant.white,
                          size: 16,
                        ),
                      ),
                    ),
                  ),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () {
                        launch(
                            'https://apps.apple.com/us/app/sugarin/id1610342345');
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8, top: 8),
                        child: FaIcon(
                          FontAwesomeIcons.appStore,
                          color: ColorConstant.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ],
  );
}

animatedText(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      SizedBox(
        width: 500,
        child: AnimatedTextKit(isRepeatingAnimation: false, animatedTexts: [
          TyperAnimatedText('Hello!',
              // ignore: prefer_const_constructors
              textAlign: context.isPhone ? TextAlign.center : TextAlign.right,
              textStyle: (TextStyle(
                color: ColorConstant.white,
                fontWeight: FontWeight.w100,
                fontSize: 28,
                fontFamily: 'Sequel 100 Black 105',
              )),
              speed: Duration(milliseconds: 50)),
        ]),
      ),
      SizedBox(
        width: 500,
        child: DefaultTextStyle(
          style: const TextStyle(
            fontSize: 30.0,
          ),
          child: AnimatedTextKit(isRepeatingAnimation: false, animatedTexts: [
            TyperAnimatedText(
              "I'm Prayag Dalal",
              textAlign: context.isPhone ? TextAlign.center : TextAlign.right,
              // ignore: prefer_const_constructors
              textStyle: (TextStyle(
                  color: ColorConstant.white,
                  // backgroundColor: Colors.white,
                  fontWeight: FontWeight.w200,
                  fontFamily: 'Sequel 100 Black',
                  fontSize: 18)),
            ),
          ]),
        ),
      ),
      SizedBox(
        height: 5,
      ),
      SizedBox(
        width: 500,
        child: Text(
          "I'm from India. I develop mobile app and website.",
          textAlign: context.isPhone ? TextAlign.center : TextAlign.right,
          style: TextStyle(
              fontFamily: 'Century Gothic', color: ColorConstant.white),
        ),
      ),
      SizedBox(
        height: 8,
      ),
      SizedBox(
        width: 500,
        child: Text(
          "Apart from that I do graphic designing",
          textAlign: context.isPhone ? TextAlign.center : TextAlign.right,
          style: TextStyle(
              fontFamily: 'Century Gothic', color: ColorConstant.white),
        ),
      ),
      SizedBox(
        height: 20,
      ),
      commonButton(context),
      SizedBox(
        height: 20,
      ),
    ],
  );
}
