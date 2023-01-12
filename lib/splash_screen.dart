import 'package:flutter/material.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 5),
      () =>
          Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false),
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
              const Color(0xffC19E82).withOpacity(0.6),
              BlendMode.darken,
            ),
            image: NetworkImage(
                "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/gettyimages-452291-001-1585074018.jpg?crop=1xw:1xh;center,top&resize=480:*"),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          margin: EdgeInsets.only(bottom: 50),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(width: 26),
              Text(
                "WILD ANIMAL\nEXPLORATION",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white.withOpacity(0.9),
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
