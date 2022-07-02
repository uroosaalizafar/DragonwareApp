import 'package:dragonwareapp/Values/Colors/colors.dart';
import 'package:dragonwareapp/Views/AboutState.dart';
import 'package:dragonwareapp/Views/ContactState.dart';
import 'package:dragonwareapp/Views/HelpState.dart';
import 'package:dragonwareapp/Views/ServiceState.dart';
import 'package:dragonwareapp/Views/TechnologyState.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'Views/HomeState.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  GlobalKey _bottomNavigationKey = GlobalKey();
  final home = new HomeState();
  final service = new ServiceState();
  final technology = new TechnologyState();
  final contact = new ContactState();
  final about = new AboutState();
  final help = new HelpState();
  Widget homeShow = HomeState();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Widget _pageChooser(int page) {
    switch (page) {
      case 0:
        return home;
        break;
      case 1:
        return service;
        break;
      case 2:
        return technology;
        break;
      case 3:
        return about;
        break;
      case 4:
        return contact;
        break;
      case 5:
        return help;
        break;
      default:
        return homeShow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: 0,
          height: 50.0,
          items: <Widget>[
            Icon(
              Icons.home,
              size: 25,
              color: Colors.white,
            ),
            Icon(
              Icons.settings,
              size: 25,
              color: Colors.white,
            ),
            Icon(
              Icons.devices_other,
              size: 25,
              color: Colors.white,
            ),
            Icon(
              Icons.info_outline,
              size: 25,
              color: Colors.white,
            ),
            Icon(
              Icons.contact_page_sharp,
              size: 25,
              color: Colors.white,
            ),
            Icon(
              Icons.help_outline,
              size: 25,
              color: Colors.white,
            ),
          ],
          color: blackColor,
          buttonBackgroundColor: blackColor,
          backgroundColor: appMainColor,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
          onTap: (index) {
            setState(() {
              homeShow = _pageChooser(index);
              // _page = index;
            });
          },
          letIndexChange: (index) => true,
        ),
        body: Container(
          color: Colors.transparent,
          child: Center(
            child: homeShow,
          ),
        ));
  }
}
