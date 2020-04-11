import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

void main() => runApp(GoogleSearchPage());

class GoogleSearchPage extends StatelessWidget {
  const GoogleSearchPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: SearchPage(),
    );
  }
}

class SearchPage extends StatefulWidget {
  SearchPage({Key key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Container(
          child: ListView(
            children: <Widget>[
              Header(),
              SizedBox(
                height: 24,
              ),
              GoogleLogo(),
              SizedBox(
                height: 24,
              ),
              SearchBar(),
              SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FilterItem(
                    menuIcon: Icon(MdiIcons.airplaneTakeoff),
                    menuString: "Flight",
                  ),
                  FilterItem(
                    menuIcon: Icon(MdiIcons.bus),
                    menuString: "Bus",
                  ),
                  FilterItem(
                    menuIcon: Icon(MdiIcons.trainVariant),
                    menuString: "Train",
                  ),
                  FilterItem(
                    menuIcon: Icon(MdiIcons.taxi),
                    menuString: "Taxi",
                  ),
                ],
              ),
              SizedBox(
                height: 32,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FilterItem(
                    menuIcon: Icon(MdiIcons.silverware),
                    menuString: "Restaurant",
                  ),
                  FilterItem(
                    menuIcon: Icon(MdiIcons.bedDouble),
                    menuString: "Hotel",
                  ),
                  FilterItem(
                    menuIcon: Icon(MdiIcons.movie),
                    menuString: "Movie",
                  ),
                  FilterItem(
                    menuIcon: Icon(MdiIcons.calendarText),
                    menuString: "Events",
                  ),
                ],
              ),
              SizedBox(
                height: 32,
              ),
              Center(
                child: FilterItem(
                  menuIcon: Icon(MdiIcons.plus),
                  menuString: "More",
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        IconButton(icon: Icon(MdiIcons.menu), onPressed: () {},),
        IconButton(icon: Icon(MdiIcons.dotsVertical), onPressed: () {},)
      ],
    );
  }
}

class FilterItem extends StatelessWidget {
  final Icon menuIcon;
  final String menuString;
  const FilterItem({
    Key key,
    this.menuIcon,
    this.menuString,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[300],
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[600],
                    blurRadius: 10,
                    spreadRadius: 1,
                    offset: Offset(-4, -2),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    blurRadius: 10,
                    spreadRadius: 1,
                    offset: Offset(4, 4),
                  ),
                ],
              ),
              child: Center(
                child: IconButton(
                  color: Colors.blue[700],
                  icon: menuIcon,
                  onPressed: () {},
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Text(
          menuString,
          style: TextStyle(color: Colors.blue[700]),
        ),
      ],
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          height: 56,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.grey[300],
            boxShadow: [
              BoxShadow(
                color: Colors.grey[600],
                blurRadius: 10,
                spreadRadius: 1,
                offset: Offset(-4, -2),
              ),
              BoxShadow(
                color: Colors.white,
                blurRadius: 10,
                spreadRadius: 1,
                offset: Offset(4, 8),
              ),
            ],
            borderRadius: BorderRadius.circular(50),
          ),
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(right: 16, left: 32),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search or type web address",
                  border: InputBorder.none,
                  suffixIcon: Icon(MdiIcons.microphone),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class GoogleLogo extends StatelessWidget {
  const GoogleLogo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: "G",
              style: GoogleFonts.martelSans(
                color: Colors.blue[700],
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: "o",
              style: GoogleFonts.martelSans(
                color: Colors.red[700],
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: "o",
              style: GoogleFonts.martelSans(
                color: Colors.yellow[700],
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: "g",
              style: GoogleFonts.martelSans(
                color: Colors.blue[700],
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: "l",
              style: GoogleFonts.martelSans(
                color: Colors.green[700],
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: "e",
              style: GoogleFonts.martelSans(
                color: Colors.red[700],
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
