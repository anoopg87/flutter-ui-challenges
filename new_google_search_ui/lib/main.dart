import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

enum PageTheme { Dark, Light }

void main() => runApp(GoogleSearchPage());

class GoogleSearchPage extends StatelessWidget {
  const GoogleSearchPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SearchPage(
                            pageTheme: PageTheme.Light,
                          )));
            },
            child: Text("Light Google search page"),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SearchPage(
                            pageTheme: PageTheme.Dark,
                          )));
            },
            child: Text("Dark Google search page"),
          )
        ],
      ),
    );
  }
}

class SearchPage extends StatefulWidget {
  final PageTheme pageTheme;
  SearchPage({Key key, this.pageTheme}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    final controlColor = widget.pageTheme == PageTheme.Dark
        ? Colors.grey[100]
        : Colors.grey[900];
    final bgColor = widget.pageTheme == PageTheme.Dark
        ? Colors.grey[900]
        : Colors.grey[100];
    final topShadowColor =
        widget.pageTheme == PageTheme.Dark ? Colors.black : Colors.white;
    final bottomShadowColor = widget.pageTheme == PageTheme.Dark
        ? Colors.grey[800]
        : Colors.grey[500];
    final iconColor = widget.pageTheme == PageTheme.Dark
        ? Colors.blue[700]
        : Colors.blue[700];
    final textColor =
        widget.pageTheme == PageTheme.Dark ? Colors.white : Colors.black;

    final searchBarTopShadowColor = widget.pageTheme == PageTheme.Dark
        ? Colors.grey[850]
        : Colors.grey[500];
    final searchBarBottomShadowColor =
        widget.pageTheme == PageTheme.Dark ? Colors.black : Colors.white;
    final searchBarBgColor = widget.pageTheme == PageTheme.Dark
        ? Colors.grey[900]
        : Colors.grey[100];
    final hintTextColor = widget.pageTheme == PageTheme.Dark
        ? Colors.grey[700]
        : Colors.grey[500];

    FilterItem buildFilterItem(Icon icon, String text) {
      return FilterItem(
        menuIcon: icon,
        menuString: text,
        bgColor: bgColor,
        topShadowColor: topShadowColor,
        bottomShadowColor: bottomShadowColor,
        iconColor: iconColor,
        textColor: textColor,
      );
    }

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: bgColor,
    ));
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          child: ListView(
            children: <Widget>[
              Header(
                controlColor: controlColor,
              ),
              GoogleLogo(),
              SearchBar(
                searchBarBgColor: searchBarBgColor,
                searchBarTopShadowColor: searchBarTopShadowColor,
                searchBarBottomShadowColor: searchBarBottomShadowColor,
                hintTextColor: hintTextColor,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  buildFilterItem(Icon(MdiIcons.airplaneTakeoff), "Flights"),
                  buildFilterItem(Icon(MdiIcons.bus), "Bus"),
                  buildFilterItem(Icon(MdiIcons.trainVariant), "Train"),
                  buildFilterItem(Icon(MdiIcons.taxi), "Taxi"),
                ],
              ),
              SizedBox(
                height: 32,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  buildFilterItem(Icon(MdiIcons.silverware), "Restaurant"),
                  buildFilterItem(Icon(MdiIcons.bedDouble), "Hotel"),
                  buildFilterItem(Icon(MdiIcons.movie), "Movie"),
                  buildFilterItem(Icon(MdiIcons.calendarText), "Events"),
                ],
              ),
              SizedBox(
                height: 32,
              ),
              Center(
                child: FilterItem(
                  menuIcon: Icon(MdiIcons.plus),
                  menuString: "More",
                  bgColor: bgColor,
                  topShadowColor: topShadowColor,
                  bottomShadowColor: bottomShadowColor,
                  iconColor: Colors.orange[700],
                  textColor: textColor,
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
  final Color controlColor;
  const Header({
    Key key,
    this.controlColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        IconButton(
          icon: Icon(
            MdiIcons.menu,
            color: controlColor,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(
            MdiIcons.dotsVertical,
            color: controlColor,
          ),
          onPressed: () {},
        )
      ],
    );
  }
}

class FilterItem extends StatelessWidget {
  final Icon menuIcon;
  final String menuString;
  final Color bgColor;
  final Color topShadowColor;
  final Color bottomShadowColor;
  final Color textColor;
  final Color iconColor;
  const FilterItem({
    Key key,
    this.menuIcon,
    this.menuString,
    this.topShadowColor,
    this.bottomShadowColor,
    this.textColor,
    this.iconColor,
    this.bgColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 56,
              width: 56,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: bgColor, 
                boxShadow: [
                  BoxShadow(
                    color: topShadowColor, 
                    blurRadius: 10,
                    spreadRadius: 1,
                    offset: Offset(2, 2),
                  ),
                  BoxShadow(
                    color: bottomShadowColor, 
                    blurRadius: 8,
                    spreadRadius: 1,
                    offset: Offset(-4, -4),
                  ),
                ],
              ),
              child: Center(
                child: IconButton(
                  color: iconColor,
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
          style: TextStyle(color: textColor),
        ),
      ],
    );
  }
}

class SearchBar extends StatelessWidget {
  final Color searchBarBgColor;
  final Color searchBarTopShadowColor;
  final Color searchBarBottomShadowColor;
  final Color hintTextColor;

  const SearchBar({
    Key key,
    this.searchBarBgColor,
    this.searchBarTopShadowColor,
    this.searchBarBottomShadowColor,
    this.hintTextColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Container(
          height: 48,
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(right: 8, left: 32),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search or type web address",
                  hintStyle:
                      TextStyle(color: hintTextColor), 
                  border: InputBorder.none,
                  suffixIcon: Icon(
                    MdiIcons.microphone,
                    color: Colors.blue[700],
                  ),
                ),
              ),
            ),
          ),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: searchBarBgColor, 
            boxShadow: [
              BoxShadow(
                color: searchBarTopShadowColor, 
                blurRadius: 4,
                spreadRadius: 4,
                offset: Offset(-4, -6),
              ),
              BoxShadow(
                color: searchBarBottomShadowColor, 
                blurRadius: 4,
                spreadRadius: 2,
                offset: Offset(2, 2),
              ),
            ],
            borderRadius: BorderRadius.circular(100),
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
              style: GoogleFonts.scheherazade(
                color: Colors.blue[700],
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: "o",
              style: GoogleFonts.scheherazade(
                color: Colors.red[700],
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: "o",
              style: GoogleFonts.scheherazade(
                color: Colors.yellow[700],
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: "g",
              style: GoogleFonts.scheherazade(
                color: Colors.blue[700],
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: "l",
              style: GoogleFonts.scheherazade(
                color: Colors.green[700],
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: "e",
              style: GoogleFonts.scheherazade(
                color: Colors.red[700],
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
