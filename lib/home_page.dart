import 'package:flutter/gestures.dart';
import 'package:jawnnypoo/nav.dart';
import 'package:jawnnypoo/ui/custom_colors.dart';
import 'package:jawnnypoo/ui/styles.dart';
import 'package:jawnnypoo/ui/urls.dart';
import 'package:jawnnypoo/ui/ui_factory.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bg.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(children: [
            Align(alignment: AlignmentDirectional.center, child: centerCard()),
            Align(
                alignment: AlignmentDirectional.bottomCenter,
                child: Container(
                  child: bottomCard(),
                ))
          ])),
    );
  }

  Widget centerCard() {
    return Card(
      elevation: 8.0,
      margin: const EdgeInsets.all(20.0),
      child: Container(
        margin: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            verticalSeparator(),
            ClipRRect(
              borderRadius: BorderRadius.circular(100.0),
              child:
                  Image.network("$urlGravatar?s=512", width: 200, height: 200),
            ),
            verticalSeparator(),
            Text(
              "John Carlson | @Jawnnypoo",
              style: logoStyle,
            ),
            verticalSeparator(),
            Text(
              "Hey there, I'm John.\n\nI'm a serious developer trying not to take life too seriously.\n\nI create things with my friends under Commit 451",
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            verticalSeparator(),
            ElevatedButton(
              onPressed: () {
                Nav.navigateToPortfolio(context);
              },
              child: Text('See My Portfolio', style: logoStyle),
            ),
            verticalSeparator(),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  button(FontAwesomeIcons.github, urlGitHub),
                  button(FontAwesomeIcons.linkedin, urlLinkedIn),
                  button(Icons.android, urlPlayStore),
                ],
              ),
            ),
            verticalSeparator(),
          ],
        ),
      ),
    );
  }

  Widget bottomCard() {
    DateTime now = DateTime.now();
    return Container(
        padding: const EdgeInsets.all(8.0),
        color: CustomColors.primaryColor(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: "© John Carlson ${now.year} • Created with Flutter • ",
                  style: baseStyle.copyWith(color: Colors.white)),
              TextSpan(
                  text: "See source",
                  style: underlineStyle.copyWith(color: Colors.white),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () async {
                      Nav.openUrl(context, urlSiteSource);
                    }),
            ])),
            horizontalSeparator(),
          ],
        ));
  }

  Widget link(String text, GestureTapCallback callback) {
    return InkWell(
      onTap: callback,
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget button(IconData iconData, String url) {
    return RawMaterialButton(
      onPressed: () {
        Nav.openUrl(context, url);
      },
      elevation: 2.0,
      fillColor: Colors.white60,
      padding: const EdgeInsets.all(15.0),
      shape: const CircleBorder(),
      child: Icon(
        iconData,
        size: 35.0,
      ),
    );
  }
}
