import 'package:NewsApp/data.dart';
import 'package:NewsApp/sections/business.dart';
import 'package:NewsApp/sections/politics.dart';
import 'package:NewsApp/sections/science.dart';
import 'package:NewsApp/sections/tech.dart';
import 'package:NewsApp/sections/world.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: "Josefin",
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _controller = PageController(
    initialPage: 0,
  );

  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: FlatButton(
          onPressed: () {},
          child: Container(
            child: Image.asset("assets/images/menu.png"),
          ),
        ),
        title: Center(
          child: Text(
            "NEWS",
            style: TextStyle(
              fontFamily: "Sigmar",
              color: Colors.black,
            ),
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 12,
            ),
            child: SvgPicture.asset(
              "assets/images/search.svg",
              height: 25,
              width: 25,
            ),
          )
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Container(
              height: 35,
              child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: (ctx, i) {
                  return Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    child: FlatButton(
                      onPressed: () {
                        _controller.animateToPage(i,
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeIn);
                      },
                      child: Text(
                        sections[i],
                        style: TextStyle(
                          color: currentPage == i
                              ? Colors.black
                              : Colors.black.withOpacity(0.6),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: sections.length,
                scrollDirection: Axis.horizontal,
              ),
            ),
            Expanded(
              child: PageView(
                controller: _controller,
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                children: [
                  WorldSection(),
                  BusinessSection(),
                  PoliticsSection(),
                  TechSection(),
                  ScienceSection(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
