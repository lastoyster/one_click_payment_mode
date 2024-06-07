import 'package:flutter/material.dart';
import 'package:circular_rotation/circular_rotation.dart';
import 'package:badges/badges.dart' as badges;
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int index = 0;
  List contacts = ["Mona Lisa", "Beyonce Knowles", "Jane Doe", "Shonda Rhimes"];
  final TextEditingController fundController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fundController.text = "30";
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'One Click Payment',
      theme: ThemeData(
        textTheme: Theme.of(context)
            .textTheme
            .apply(fontFamily: GoogleFonts.poppins().fontFamily),
      ),
      home: Scaffold(
        backgroundColor: const Color(0xff252525),
        appBar: AppBar(
          backgroundColor: const Color(0xff252525),
          leading: const Icon(Icons.sort),
          actions: [_generateBadge()],
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            const Text(
              "Tap to pay",
              style: TextStyle(fontSize: 22, color: Colors.white),
            ),
            const Text(
              "One click to fund transfer",
              style: TextStyle(color: Colors.white),
            ),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 400,
                child: CircularRotation(
                    circularRotationProperty: CircularRotationModel(
                  defaultCircleStrokeWidth: 0.5,
                  defaultCircleStrokeColor: const Color(0xff38b6ff),
                  startAnimation: true,
                  repeatAnimation: true,
                  firstCircleAnimationDuration: 20000,
                  centerWidget: const CircleAvatar(
                    radius: 40,
                    backgroundColor: Color(0xff38b6ff),
                    child: Icon(
                      Icons.cached,
                      size: 40,
                    ),
                  ),
                  firstCircleWidgets: buildWidgets(),
                )),
              ),
            ),
            Text(
              // ignore: prefer_interpolation_to_compose_strings
              "I want to fund " + contacts[index],
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.white),
            ),
            SizedBox(
              width: 150,
              child: TextField(
                controller: fundController,
                style: const TextStyle(fontSize: 40, color: Colors.white),
                decoration: const InputDecoration(
                    prefix: Text("\$"),
                    prefixStyle: TextStyle(color: Colors.white, fontSize: 40)),
                textAlign: TextAlign.center,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: SizedBox(
                width: 300,
                child: Text(
                  "Only within your friends and families added in pay lists",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: SizedBox(
                width: 150,
                height: 50,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        backgroundColor: const Color(0xff38b6ff)),
                    onPressed: () {},
                    child: const Text(
                      "SEND",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    )),
              ),
            )
          ]),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }

  List<Widget> buildWidgets() {
    List<Widget> x = [];

    for (int i = 0; i < contacts.length; i++) {
      x.add(GestureDetector(
        onTap: () {
          setState(() {
            index = i;
          });
        },
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20)),
              child: Container(
                  padding: const EdgeInsets.all(5.0),
                  color: Colors.grey,
                  child: Text(
                    contacts[i],
                    style: const TextStyle(color: Colors.white),
                  )),
            ),
            (index == i)
                ? const Positioned(
                    right: 0.0,
                    top: 0.0,
                    child: CircleAvatar(
                      radius: 10,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.check,
                        color: Color(0xff38b6ff),
                        size: 20,
                      ),
                    ),
                  )
                : const SizedBox.shrink()
          ],
        ),
      ));
    }
    return x;
  }

  Widget _generateBadge() {
    return badges.Badge(
        position: badges.BadgePosition.topStart(top: 12, start: 23),
        showBadge: true,
        ignorePointer: false,
        onTap: () {},
        badgeStyle: badges.BadgeStyle(
          shape: badges.BadgeShape.circle,
          badgeColor: const Color(0xff38b6ff),
          padding: const EdgeInsets.all(5),
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(color: Colors.white, width: 2),
          elevation: 0,
        ),
        child: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.chat_bubble_outline_rounded,
            color: Colors.white,
          ),
        ));
  }
}