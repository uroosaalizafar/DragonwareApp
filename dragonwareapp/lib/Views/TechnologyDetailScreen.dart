import 'package:dragonwareapp/Values/Colors/colors.dart';
import 'package:dragonwareapp/Values/SizeConfig.dart';
import 'package:dragonwareapp/Values/SocialCard.dart';
import 'package:dragonwareapp/Values/TitleText.dart';
import 'package:dragonwareapp/Values/extentions.dart';
import 'package:flutter/material.dart';

TextStyle _textStyle1 = TextStyle(
    fontSize: 21,
    letterSpacing: 1.2,
    fontWeight: FontWeight.bold,
    color: appMainColor);

TextStyle _textStyle3 =
TextStyle(fontSize: 18, letterSpacing: 0.9, color: appMainColor);

// ignore: must_be_immutable
class TechDetailScreen extends StatefulWidget {
  final title;
  final subtitle;
  String price;
  String desc;
  Image image;
  double review;

  TechDetailScreen({this.desc, this.subtitle, this.image, this.review, this.price, this.title});

  @override
  _TechDetailScreenState createState() => _TechDetailScreenState();
}

class _TechDetailScreenState extends State<TechDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        body: profileView(mq),
      ),
    );
  }

  bool isLiked = true;

  Widget profileView(mq) {
    return Container(
      color: appMainColor,
      child: Column(
        children: <Widget>[
          _appBar(),
          Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(17.0),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(1.0, 15.0),
                                    blurRadius: 20.0,
                                  ),
                                ]),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
                                  child: Container(
                                    child: Column(
                                      children: [
                                        buildImage(mq),
                                        buildTitletext(),
                                        SizedBox(
                                          height: 12,
                                        ),
                                        buildDesc(),
                                        SizedBox(height: 25),
                                        Row(
                                          children: [
                                            Text(
                                              widget.price,
                                              style: TextStyle(color: appMainColor),
                                            ),
                                            Spacer(),
                                            Text(widget.review.toString(),
                                                style:
                                                TextStyle(color: appMainColor)),
                                            Text("⭐"),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 25,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }

  Widget _appBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _icon(
            Icons.arrow_back_ios,
            color: Colors.black54,
            size: 15,
            padding: 12,
            isOutLine: true,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          _icon(isLiked ? Icons.favorite : Icons.favorite_border,
              color: isLiked ? red : lightGrey,
              size: 15,
              padding: 12,
              isOutLine: false, onPressed: () {
                setState(() {
                  isLiked = !isLiked;
                });
              }),
        ],
      ),
    );
  }

  Widget _icon(
      IconData icon, {
        Color color = iconColor,
        double size = 20,
        double padding = 10,
        bool isOutLine = false,
        Function onPressed,
      }) {
    return Container(
      height: 40,
      width: 40,
      padding: EdgeInsets.all(padding),
      // margin: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        border: Border.all(
            color: iconColor,
            style: isOutLine ? BorderStyle.solid : BorderStyle.none),
        borderRadius: BorderRadius.all(Radius.circular(13)),
        color:
        isOutLine ? Colors.transparent : Theme.of(context).backgroundColor,
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Color(0xffa6e5da),
              blurRadius: 5,
              spreadRadius: 10,
              offset: Offset(5, 5)),
        ],
      ),
      child: Icon(icon, color: color, size: size),
    ).ripple(() {
      if (onPressed != null) {
        onPressed();
      }
    }, borderRadius: BorderRadius.all(Radius.circular(13)));
  }

  Widget buildDesc() {
    return Text(
      widget.desc,
      textAlign: TextAlign.center,
      style: _textStyle3,
    );
  }

  Widget buildTitletext() {
    return Text(
      widget.title,
      style: _textStyle1,
    );
  }

  final borderRadius = BorderRadius.circular(20);

  Widget buildImage(Size mq) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, bottom: 10),
      child: Container(
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(2), // Border width
        decoration:
        BoxDecoration(color: appMainColor, borderRadius: borderRadius),
        child: ClipRRect(
          borderRadius: borderRadius,
          child: SizedBox.fromSize(
            size: Size.fromRadius(68), // Image radius
            child: Center(
                child: Container(height: mq.height * 0.3, child: widget.image)),
          ),
        ),
      ),
    );
  }
}