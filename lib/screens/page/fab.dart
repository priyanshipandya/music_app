import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../../values/app_styles.dart';

class FABPage extends StatefulWidget {
  const FABPage({Key? key}) : super(key: key);

  @override
  State<FABPage> createState() => _FABPageState();
}

class _FABPageState extends State<FABPage> {
  late PageController _pageController;
  var reels;

  // List reels = [
  //
  // "asset/reels/1.mp4",
  // "asset/reels/2.mp4",
  // "asset/reels/3.mp4",
  // "asset/reels/4.mp4",
  // "asset/reels/5.mp4",
  // "asset/reels/6.mp4",
  // "asset/reels/7.mp4"
  // ];

  @override
  void initState() {
    _pageController = PageController();
    getVideo();
    super.initState();
  }

  void getVideo() async {
    var videoCollection =
        await FirebaseFirestore.instance.collection('videos').get();
    reels = videoCollection.docs.map((doc) => doc.data()).toList();
    print(reels);
    setState(() {});
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        controller: _pageController,
        itemCount: reels.length,
        itemBuilder: (context, index) {
          return ReelPlayer(videoNo: reels[index], url: reels[index]['url'],);
        },
      ),
    );
  }
}

class ReelPlayer extends StatefulWidget {
  const ReelPlayer({super.key, this.videoNo, this.url});

  final videoNo;
  final url;

  @override
  State<ReelPlayer> createState() => _ReelPlayerState();
}

class _ReelPlayerState extends State<ReelPlayer> with WidgetsBindingObserver {
  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    _videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse(widget.url));
    _videoPlayerController.initialize().then((_) {
      setState(() {
        _videoPlayerController.play();
        _videoPlayerController.setLooping(true);
      });
    });
    super.initState();
  }


  // _videoPlayerController = VideoPlayerController.asset(widget.videoNo);
  // _videoPlayerController.initialize().then((_) {
  //   setState(() {
  //     _videoPlayerController.play();
  //     _videoPlayerController.setLooping(true);
  //   });
  // });

  @override
  void dispose() {
    _videoPlayerController.dispose();
    log("dispose of FAB called", name: "DISPOSE");
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: AppStyles.blackEmptyBoxDecor,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: VideoPlayer(_videoPlayerController),
              ),
            ),
          ],
        ),
      ),
    );
  }

  changePauseResume() {
    if (_videoPlayerController.pause() == true) {
      _videoPlayerController.play();
    } else {
      _videoPlayerController.pause();
    }
  }
}
