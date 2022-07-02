import 'package:dragonwareapp/Values/Colors/colors.dart';
import 'package:dragonwareapp/Values/SizeConfig.dart';
import 'package:dragonwareapp/Values/SocialCard.dart';
import 'package:dragonwareapp/Values/extentions.dart';
import 'package:flutter/material.dart';

import 'TechnologyDetailScreen.dart';
import '../Model/model_data.dart';

class AboutState extends StatefulWidget {
  @override
  AboutStateful createState() => AboutStateful();
}

class AboutStateful extends State<AboutState> {

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(

        backgroundColor: appMainColor,
        body: SingleChildScrollView(child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _appBar(),
            buildFeatureandProductsText(),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                buildListImageView(mq, context),
              ],
            ),
          ],
        ),),
      ),
    );
  }
  final borderRadius = BorderRadius.circular(20);

  Widget buildListImageView(Size mq, BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(10),
        height: mq.height * 0.70,
        width: mq.width,
        child: ListView.builder(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: getaboutData.length ?? 0,
            itemBuilder: (_, index) {
              return InkWell(
                onTap: () {},
                child: Container(
                  width: mq.width * 0.85,
                  child: Card(
                    color: blackColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    child: ListTile(
                      title: SingleChildScrollView(child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: Container(
                              padding: EdgeInsets.all(2), // Border width
                              decoration: BoxDecoration(
                                  color: appMainColor,
                                  borderRadius: borderRadius),
                              child: ClipRRect(
                                borderRadius: borderRadius,
                                child: SizedBox.fromSize(
                                  size: Size.fromRadius(58), // Image radius
                                  child: getaboutData[index].image,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            getaboutData[index].title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                letterSpacing: 0.6,
                                color: appMainColor),
                          ),
                          SizedBox(height: 25),
                          Text(
                            getaboutData[index].desc,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 18,
                                letterSpacing: 0.6,
                                color: appMainColor),
                          ),SizedBox(height: 25),
                          Text(
                            getaboutData[index].job_title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                letterSpacing: 0.6,
                                color: appMainColor),
                          ),SizedBox(height: 25),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SocialCard(
                                icon: "assets/icons/google-icon.svg",
                                press: () {},
                              ),
                              SocialCard(
                                icon: "assets/icons/facebook-2.svg",
                                press: () {},
                              ),
                              SocialCard(
                                icon: "assets/icons/twitter.svg",
                                press: () {},
                              ),
                            ],
                          ),
                          SizedBox(height: 25),
                        ],
                      ),),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }

  Widget buildFeatureandProductsText() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10),
      child: Center(child: Container(
        child:  buildTextEasy(
            name: 'WHO WE ARE',
            color: null,
            fontSize: 25,
            fontWeight: FontWeight.bold),),),
    );
  }

  Widget _appBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          RotatedBox(
            quarterTurns: 4,
            child: _icon(Icons.sort, color: appMainColor),
          ),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(13)),
            child: Container(
              child: Image.asset(
                "assets/images/logo_launcher.png",
                height: 55,
                width: 55,
              ),
            ),
          ).ripple(() {}, borderRadius: BorderRadius.all(Radius.circular(13)))
        ],
      ),
    );
  }

  Widget _icon(IconData icon, {Color color = iconColor}) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(13)),
        color: blackColor,
      ),
      child: Icon(
        icon,
        color: color,
      ),
    ).ripple(() {}, borderRadius: BorderRadius.all(Radius.circular(13)));
  }

  Widget buildRotateText(String name) {
    return Padding(
      padding: const EdgeInsets.only(top: 22, left: 10, bottom: 15, right: 15),
      child: RotatedBox(
        quarterTurns: -1,
        child: Text(
          name,
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }

  Widget buildTextEasy(
      {String name, Color color, double fontSize, FontWeight fontWeight}) {
    return Text(
      name,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}


