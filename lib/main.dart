import 'dart:typed_data';

import 'package:dbminers/splash_screen.dart';
import 'package:flutter/material.dart';

import 'details.dart';
import 'global.dart';
import 'helper/img_helper.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "splash_screen",
      routes: {
        "/": (context) => HomePage(),
        "splash_screen": (context) => IntroScreen(),
        "details": (context) => Details_Page(),
      },
    ),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextStyle textStyle = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w400,
    color: Colors.white,
    letterSpacing: 1,
  );
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          FutureBuilder(
            future: ImageAPIHelper.imageAPIHelper
                .getImage(name: 'background,wild animal'),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text("Error:${snapshot.error}"),
                );
              } else if (snapshot.hasData) {
                Uint8List data = snapshot.data as Uint8List;
                return Container(
                  height: height * 0.38,
                  width: width,
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    image: DecorationImage(
                      colorFilter: ColorFilter.mode(
                        const Color(0xffC19E82).withOpacity(0.6),
                        BlendMode.darken,
                      ),
                      image: MemoryImage(data),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 38),
                      const Spacer(),
                      Text(
                        "ANIMAL\nBIOGRAPHY ",
                        style: TextStyle(
                          fontSize: 48,
                          color: Colors.white.withOpacity(0.9),
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const Spacer(flex: 2),
                    ],
                  ),
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
          Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: 280),
                width: width,
                height: height * 0.65,
                padding: const EdgeInsets.only(left: 26, right: 26),
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(18),
                      topRight: Radius.circular(18),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        offset: const Offset(0, -0.2),
                        spreadRadius: 2,
                        blurRadius: 16,
                      ),
                    ]),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 15),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed("details",
                              arguments: Global.Animals[0]);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: height * 0.14,
                          width: width,
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.5),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                opacity: 0.5,
                                image: NetworkImage(
                                    "https://cdn.firstcry.com/education/2022/04/25155522/1378635314.jpg"),
                              ),
                              borderRadius: BorderRadius.circular(60),
                              border: Border.all(
                                  color: Colors.brown.shade200, width: 3)),
                          child: Text(
                            "TIGER",
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed("details",
                              arguments: Global.Animals[1]);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: height * 0.14,
                          width: width,
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.5),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                opacity: 0.5,
                                image: NetworkImage(
                                    "https://media.wired.com/photos/59326eb044db296121d6afc3/191:100/w_1280,c_limit/Gator-2.jpg"),
                              ),
                              borderRadius: BorderRadius.circular(60),
                              border: Border.all(
                                  color: Colors.brown.shade200, width: 3)),
                          child: Text(
                            "ALLIGATOR",
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed("details",
                              arguments: Global.Animals[2]);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: height * 0.14,
                          width: width,
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.5),
                              image: const DecorationImage(
                                fit: BoxFit.cover,
                                opacity: 0.5,
                                image: NetworkImage(
                                    "https://upload.wikimedia.org/wikipedia/commons/thumb/7/71/2010-kodiak-bear-1.jpg/1200px-2010-kodiak-bear-1.jpg"),
                              ),
                              borderRadius: BorderRadius.circular(60),
                              border: Border.all(
                                  color: Colors.brown.shade200, width: 3)),
                          child: Text(
                            "BEAR",
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed("details",
                              arguments: Global.Animals[3]);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: height * 0.14,
                          width: width,
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.5),
                              image: const DecorationImage(
                                fit: BoxFit.cover,
                                opacity: 0.5,
                                image: NetworkImage(
                                  "https://www.antarctica.gov.au/site/assets/files/45670/ia40342.1920x768.jpg?f=037035",
                                ),
                              ),
                              borderRadius: BorderRadius.circular(60),
                              border: Border.all(
                                  color: Colors.brown.shade200, width: 3)),
                          child: Text(
                            "BLUE WHALE",
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed("details",
                              arguments: Global.Animals[4]);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: height * 0.14,
                          width: width,
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.5),
                              image: const DecorationImage(
                                fit: BoxFit.cover,
                                opacity: 0.5,
                                image: NetworkImage(
                                  "https://res.cloudinary.com/roundglass/image/upload/w_1104,h_736,c_fill/q_auto:best,f_auto/v1604402533/roundglass/sustain/velavadar-striped-hyena-lead-vickey-chauhanshutterstock-8_vzjhcy.jpg",
                                ),
                              ),
                              borderRadius: BorderRadius.circular(60),
                              border: Border.all(
                                  color: Colors.brown.shade200, width: 3)),
                          child: Text(
                            "HYENA",
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
