import 'package:card_swiper/card_swiper.dart';
import 'package:dragonwareapp/Model/model_data.dart';
import 'package:dragonwareapp/Values/Colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:video_player/video_player.dart';

import '../Values/texttitle.dart';

class HomeState extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeStateful();
}

class HomeStateful extends State<HomeState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: appMainColor,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: Image.asset('assets/images/logo.jpg'),
              ),
              WelcomeAd(),
              _AssetVideo(),
              stack_icons()
            ],
          ),
        ),
      ),
    );
  }

  Widget WelcomeAd() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
          color: appMainColor,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.grey,
              offset: Offset(1.0, 1.0),
              blurRadius: 20.0,
            ),
          ]),
      child: Text(
        'Welcome to the DragonWare',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget stack_icons() {
    return    Container(
      height: 400,
      padding: EdgeInsets.only(left: 32.0),
      child: Swiper(
        // autoplay: true,
        itemCount: gethomeData.length,
        itemWidth: MediaQuery.of(context).size.width - 2 * 64,
        layout: SwiperLayout.STACK,
        pagination: SwiperPagination(
          builder: DotSwiperPaginationBuilder(
            activeSize: 15.0,
            color: Colors.white24,
            activeColor: Colors.white,
          ),
        ),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
            },
            child: Stack(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    SizedBox(height: 30.0),
                    Container(
                      height: 300,
                      width: 300,
                      child: Card(
                        elevation: 8.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28.0),
                        ),
                        color: whiteColor,
                        child: Padding(
                          padding:
                          const EdgeInsets.only(left: 24.0),
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(height: 150.0),
                              Text(
                                gethomeData[index].title,
                                style: title,
                                textAlign: TextAlign.left,
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                gethomeData[index].desc,
                                style: des,
                                textAlign: TextAlign.left,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                Positioned(
                  left: 30,
                    right: 30,
                    child: Image.asset(
                  gethomeData[index].image,
                  height: 160,
                  width: 160,
                ))
              ],
            ),
          );
        },
      ),
    );
  }
}

class _AssetVideo extends StatefulWidget {
  @override
  _AssetVideoState createState() => _AssetVideoState();
}

class _AssetVideoState extends State<_AssetVideo> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/video/video.mp4');

    _controller.addListener(() {
      setState(() {});
    });
    _controller.setLooping(true);
    _controller.initialize().then((_) => setState(() {}));
    _controller.play();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(top: 0.0),
          ),
          Container(
            margin: EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
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
            child: AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  VideoPlayer(_controller),
                  _ControlsOverlay(controller: _controller),
                  VideoProgressIndicator(_controller, allowScrubbing: true),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ControlsOverlay extends StatelessWidget {
  const _ControlsOverlay({Key key, this.controller}) : super(key: key);

  static const List<Duration> _exampleCaptionOffsets = <Duration>[
    Duration(seconds: -10),
    Duration(seconds: -3),
    Duration(seconds: -1, milliseconds: -500),
    Duration(milliseconds: -250),
    Duration(milliseconds: 0),
    Duration(milliseconds: 250),
    Duration(seconds: 1, milliseconds: 500),
    Duration(seconds: 3),
    Duration(seconds: 10),
  ];
  static const List<double> _examplePlaybackRates = <double>[
    0.25,
    0.5,
    1.0,
    1.5,
    2.0,
    3.0,
    5.0,
    10.0,
  ];

  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 50),
          reverseDuration: const Duration(milliseconds: 200),
          child: controller.value.isPlaying
              ? const SizedBox.shrink()
              : Container(
                  color: Colors.black26,
                  child: const Center(
                    child: Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                      size: 100.0,
                      semanticLabel: 'Play',
                    ),
                  ),
                ),
        ),
        GestureDetector(
          onTap: () {
            controller.value.isPlaying ? controller.pause() : controller.play();
          },
        ),
        Align(
          alignment: Alignment.topLeft,
          child: PopupMenuButton<Duration>(
            initialValue: controller.value.captionOffset,
            tooltip: 'Caption Offset',
            onSelected: (Duration delay) {
              controller.setCaptionOffset(delay);
            },
            itemBuilder: (BuildContext context) {
              return <PopupMenuItem<Duration>>[
                for (final Duration offsetDuration in _exampleCaptionOffsets)
                  PopupMenuItem<Duration>(
                    value: offsetDuration,
                    child: Text('${offsetDuration.inMilliseconds}ms'),
                  )
              ];
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                // Using less vertical padding as the text is also longer
                // horizontally, so it feels like it would need more spacing
                // horizontally (matching the aspect ratio of the video).
                vertical: 12,
                horizontal: 16,
              ),
              child: Text('${controller.value.captionOffset.inMilliseconds}ms'),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: PopupMenuButton<double>(
            initialValue: controller.value.playbackSpeed,
            tooltip: 'Playback speed',
            onSelected: (double speed) {
              controller.setPlaybackSpeed(speed);
            },
            itemBuilder: (BuildContext context) {
              return <PopupMenuItem<double>>[
                for (final double speed in _examplePlaybackRates)
                  PopupMenuItem<double>(
                    value: speed,
                    child: Text('${speed}x'),
                  )
              ];
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                // Using less vertical padding as the text is also longer
                // horizontally, so it feels like it would need more spacing
                // horizontally (matching the aspect ratio of the video).
                vertical: 12,
                horizontal: 16,
              ),
              child: Text('${controller.value.playbackSpeed}x'),
            ),
          ),
        ),
      ],
    );
  }
}

/*

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: gradientFourthColor,
      body: SingleChildScrollView(
        child: Container(
          decoration: homeBody,
          child: SafeArea(
            bottom: false,
            child: Column(
              children: <Widget>[
                Padding(
                  padding:
                  EdgeInsets.symmetric(horizontal: 32.0, vertical: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'gumao.',
                        style: TextStyle(
                          fontFamily: 'Gilroy',
                          fontSize: 42,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                      ),
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: Color(0xffFB7391),
                        child: IconButton(
                            icon: Icon(
                              Icons.search,
                              color: Colors.white,
                              size: 30,
                            ),
                            onPressed: () {}),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 50),
                Container(
                  height: 550,
                  padding: EdgeInsets.only(left: 32.0),
                  child: Swiper(
                    // autoplay: true,
                    itemCount: characters.length,
                    itemWidth: MediaQuery.of(context).size.width - 2 * 64,
                    layout: SwiperLayout.STACK,
                    pagination: SwiperPagination(
                      builder: DotSwiperPaginationBuilder(
                        activeSize: 15.0,
                        color: Colors.white24,
                        activeColor: Colors.white,
                      ),
                    ),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, a, b) => DetailPage(
                                charInfo: characters[index],
                              ),
                            ),
                          );
                        },
                        child: Stack(
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                SizedBox(height: 30.0),
                                Container(
                                  height: 450,
                                  width: 300,
                                  child: Card(
                                    elevation: 8.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(28.0),
                                    ),
                                    color: Colors.white,
                                    child: Padding(
                                      padding:
                                      const EdgeInsets.only(left: 24.0),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: <Widget>[
                                          SizedBox(height: 300.0),
                                          Container(
                                            height: 35,
                                            width: 60,
                                            decoration: BoxDecoration(
                                              color: Color(0xffEF544A),
                                              borderRadius:
                                              BorderRadius.circular(12.0),
                                            ),
                                            child: Center(
                                              child: Text(
                                                characters[index].rating,
                                                style: rating,
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 11.0),
                                          Text(
                                            characters[index].game,
                                            style: gameName,
                                            textAlign: TextAlign.left,
                                          ),
                                          Text(
                                            characters[index].name,
                                            style: charName,
                                            textAlign: TextAlign.left,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Positioned(
                              bottom: 130.0,
                              right: 30.0,
                              child: Text(
                                characters[index].position.toString(),
                                style: position,
                              ),
                            ),
                            Image.asset(
                              characters[index].image,
                              height: 320,
                              width: 280,
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 55.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    IconButton(
                        icon: Image.asset('assets/images/menu.png'),
                        onPressed: () {}),
                    IconButton(
                        icon: Image.asset('assets/images/heart.png'),
                        onPressed: () {}),
                    IconButton(
                        icon: Image.asset('assets/images/person.png'),
                        onPressed: () {})
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}*/
