import 'package:daily_exercise/constants.dart';
import 'package:daily_exercise/screens/detail_screen.dart';
import 'package:daily_exercise/widgets/bottom_nav_bar.dart';
import 'package:daily_exercise/widgets/category_card_widget.dart';
import 'package:daily_exercise/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: "Cairo", scaffoldBackgroundColor: kBackgroundColor, textTheme: Theme.of(context).textTheme.apply(displayColor: kTextColor)),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
                  color: Color(0xFFF5CEB8),
                  image: DecorationImage(image: AssetImage("assets/images/undraw_pilates_gpdb.png"), alignment: Alignment.centerLeft)),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        alignment: Alignment.center,
                        height: 52,
                        width: 52,
                        decoration: BoxDecoration(color: Color(0xFFF2BEA1), shape: BoxShape.circle),
                        child: SvgPicture.asset("assets/icons/menu.svg"),
                      ),
                    ),
                    Text(
                      "Good Morning Luan",
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(fontWeight: FontWeight.w900),
                    ),
                    SearchBar(),
                    Expanded(
                        child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: 0.85,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      children: [
                        CategoryCard(
                          title: "Diet Recommendation",
                          svgSrc: "assets/icons/Hamburger.svg",
                          press: () {},
                        ),
                        CategoryCard(
                          title: "Kegel Exercises",
                          svgSrc: "assets/icons/Excrecises.svg",
                          press: () {},
                        ),
                        CategoryCard(
                          title: "Meditation",
                          svgSrc: "assets/icons/Meditation.svg",
                          press: () {},
                        ),
                        CategoryCard(
                          title: "Yoga",
                          svgSrc: "assets/icons/yoga.svg",
                          press: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return DetailScreen();
                            }));
                          },
                        ),
                      ],
                    ))
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
