import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:video_player/video_player.dart';
import '../../store/navigation_store.dart';
import '../../store/video_store.dart';
import '../../values/app_styles.dart';

class FABPage extends StatefulWidget {
  const FABPage({Key? key}) : super(key: key);

  @override
  State<FABPage> createState() => _FABPageState();
}

class _FABPageState extends State<FABPage> {
  late PageController _pageController;
  List reels = [];

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
    log(reels.toString(), name: "REELS");
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
          return ReelPlayer(
            videoNo: reels[index],
            url: reels[index]['url'],
          );
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
  final navigationStore = NavigationStore();
  final videoStore = VideoStore();
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    videoStore
        .initializeVideoPlayer(widget.url, navigationStore.currentIndex);
    super.initState();
  }

  @override
  void dispose() {
    videoStore.videoPlayerController?.dispose();
    log("dispose of FAB called ${widget.videoNo}", name: "DISPOSE");
    videoStore
        .initializeVideoPlayer(widget.url, navigationStore.currentIndex);
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        videoStore.checkIndexIsReels(navigationStore.currentIndex);
        return GestureDetector(
          onTap: () => videoStore.changePauseResume(),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: AppStyles.blackEmptyBoxDecor,
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: VideoPlayer(videoStore.videoPlayerController!),
            ),
          ),
        );
      },
    );
  }
}
