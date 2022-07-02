import 'package:dragonwareapp/Values/Colors/colors.dart';
import 'package:dragonwareapp/Values/extentions.dart';
import 'package:flutter/material.dart';

import 'detailscreen.dart';
import '../Model/model_data.dart';

class ServiceState extends StatefulWidget {
  @override
  ServiceStateful createState() => ServiceStateful();
}

class ServiceStateful extends State<ServiceState> {

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: appMainColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _appBar(),
            buildFeatureandProductsText(),
            _search(),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                buildListImageView(mq, context),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildListImageView(Size mq, BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(10),
        height: mq.height * 0.45,
        width: mq.width,
        child: ListView.builder(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: getData.length ?? 0,
            itemBuilder: (_, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => DetailScreen(
                            title: getData[index].title,
                            desc: getData[index].desc,
                            price: getData[index].price,
                            image: getData[index].image,
                            review: getData[index].review,
                          )));
                },
                child: Container(
                  width: mq.width * 0.6,
                  child: Card(
                    color: blackColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    child: ListTile(
                      title: Column(
                        children: [
                          SizedBox(height: 25),
                          Container(
                            padding: const EdgeInsets.all(8), // Border width
                            decoration: BoxDecoration(color: appMainColor, shape: BoxShape.circle),
                            child: ClipOval(
                              child: SizedBox.fromSize(
                                size: Size.fromRadius(58), // Image radius
                                child: Container(
                                    height: mq.height * 0.2,
                                    child: getData[index].image),
                              ),
                            ),
                          ),
                          SizedBox(height: 25),
                          Text(
                            getData[index].title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                letterSpacing: 0.6,color: appMainColor),
                          ),
                          SizedBox(height: 25),
                          Row(
                            children: [
                              Text(getData[index].price,style: TextStyle(color: appMainColor),),
                              Spacer(),
                              Text(getData[index].review.toString(),style: TextStyle(color: appMainColor)),
                              Text("⭐"),
                            ],
                          ),

                        ],
                      ),
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
      padding: const EdgeInsets.only(top: 10, left: 55),
      child: Container(
        height: 60,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            buildTextEasy(
                name: 'Featured',
                color: Colors.black38,
                fontSize: 20,
                fontWeight: null),
            buildTextEasy(
                name: 'Services',
                color: null,
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ],
        ),
      ),
    );
  }

  Widget _search() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: blackColor,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search Service",
                    hintStyle: TextStyle(fontSize: 12,color: appMainColor),
                    contentPadding:
                    EdgeInsets.only(left: 10, right: 10, bottom: 0, top: 5),
                    prefixIcon: Icon(Icons.search, color: appMainColor)),
              ),
            ),
          ),
          SizedBox(width: 20),
          _icon(Icons.filter_list, color: appMainColor)
        ],
      ),
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
              child: Image.asset("assets/images/logo_launcher.png",height: 55,width: 55,),
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