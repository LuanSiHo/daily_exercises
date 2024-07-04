import 'package:daily_exercise/constants.dart';
import 'package:daily_exercise/widgets/bottom_nav_bar.dart';
import 'package:daily_exercise/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: BottomNavBar(),
      body: Stack(
        children: [
          Container(
            height: size.height * 0.45,
            decoration: BoxDecoration(
                color: kBlueLightColor,
                image: DecorationImage(
                    image: AssetImage("assets/images/meditation_bg.png"),
                    fit: BoxFit.fitWidth)),
          ),
          SafeArea(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: size.height * 0.05,
                ),
                Text(
                  "Meditation",
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall
                      ?.copyWith(fontWeight: FontWeight.w900),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "3-10 MIN Course",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  child: Text(
                      "Live happier and healthier by learning the fundamentals of meditation and mindfulness"),
                  width: size.width * 0.6,
                ),
                SizedBox(
                  child: SearchBar(),
                  width: size.width * 0.5,
                ),
                Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  children: [
                    SessionCard(
                      sessionNum: 1,
                      isDone: true,
                    ),
                    SessionCard(
                      sessionNum: 2,
                      isDone: true,
                    ),
                    SessionCard(
                      sessionNum: 3,
                      isDone: true,
                    ),
                    SessionCard(
                      sessionNum: 4,
                      isDone: false,
                    ),
                    SessionCard(
                      sessionNum: 5,
                      isDone: false,
                    ),
                    SessionCard(
                      sessionNum: 6,
                      isDone: false,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Meditaion",
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  padding: EdgeInsets.all(10),
                  height: 90,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(13),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 17),
                          blurRadius: 23,
                          spreadRadius: -13,
                          color: kShadowColor)
                    ],
                  ),
                  child: Row(children: [
                    SvgPicture.asset("assets/icons/Meditation_women_small.svg"),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Basic 2",
                            style: Theme.of(context).textTheme.subtitle2,
                          ),
                          Text("Start your deepen you practice")
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: SvgPicture.asset("assets/icons/Lock.svg"),
                    )
                  ]),
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}

class SessionCard extends StatelessWidget {
  final int? sessionNum;
  final bool isDone;
  const SessionCard({
    Key? key,
    this.sessionNum,
    this.isDone = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(13),
        child: Container(
          width: constraint.maxWidth / 2 - 10,
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
                offset: Offset(0, 17),
                blurRadius: 23,
                spreadRadius: -13,
                color: kShadowColor)
          ]),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(children: [
                  Container(
                    height: 42,
                    width: 43,
                    decoration: BoxDecoration(
                      color: isDone ? kBlueColor : Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(color: kBlueColor),
                    ),
                    child: Icon(
                      Icons.play_arrow,
                      color: isDone ? Colors.white : kBlueColor,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Session ${sessionNum ?? 0}",
                    style: Theme.of(context).textTheme.subtitle2,
                  )
                ]),
              ),
            ),
          ),
        ),
      );
    });
  }
}
