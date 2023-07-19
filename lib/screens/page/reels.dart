// import 'dart:developer';
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_mobx/flutter_mobx.dart';
// import 'package:provider_practical_7/values/colors.dart';
// import 'package:video_player/video_player.dart';
// import '../../store/navigation_store.dart';
// import '../../store/video_store.dart';
// import '../../values/app_styles.dart';
//
// class FABPage extends StatefulWidget {
//   const FABPage({Key? key}) : super(key: key);
//
//   @override
//   State<FABPage> createState() => _FABPageState();
// }
//
// class _FABPageState extends State<FABPage> {
//   late PageController _pageController;
//   List reels = [];
//   final videoStore = VideoStore();
//
//   @override
//   void initState() {
//     _pageController = PageController();
//     getVideo();
//     super.initState();
//   }
//
//   void getVideo() async {
//     var videoCollection =
//         await FirebaseFirestore.instance.collection('videos').get();
//     reels = videoCollection.docs.map((doc) => doc.data()).toList();
//     log(reels.toString(), name: "REELS");
//   }
//
//   @override
//   void dispose() {
//     _pageController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: PageView.builder(
//         scrollDirection: Axis.vertical,
//         physics: const BouncingScrollPhysics(),
//         controller: _pageController,
//         itemCount: reels.length,
//         onPageChanged: (index) {
//           log("${videoStore.isPlaying}", name: "IS PLAYING FROM REELS");
//           if (videoStore.isPlaying) {
//             videoStore.videoPlayerController?.pause();
//           } else {
//             videoStore.videoPlayerController?.play();
//           }
//         },
//         itemBuilder: (context, index) {
//           return ReelPlayer(
//             videoNo: reels[index],
//             url: reels[index]['url'],
//             video: videoStore,
//           );
//         },
//       ),
//     );
//   }
// }
//
// class ReelPlayer extends StatefulWidget {
//   const ReelPlayer({super.key, this.videoNo, this.url, this.video});
//
//   final videoNo;
//   final url;
//   final video;
//
//   @override
//   State<ReelPlayer> createState() => _ReelPlayerState();
// }
//
// class _ReelPlayerState extends State<ReelPlayer> with WidgetsBindingObserver {
//   final navigationStore = NavigationStore();
//
//   @override
//   void initState() {
//     WidgetsBinding.instance.addObserver(this);
//     widget.video
//         .initializeVideoPlayer(widget.url, navigationStore.currentIndex);
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     widget.video.videoPlayerController?.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: Observer(
//         builder: (context) => FloatingActionButton(
//             onPressed: () => widget.video.changePauseResume(),
//             backgroundColor: KColors.kBlack,
//             child: Icon(widget.video.isPlaying
//                 ? Icons.pause
//                 : Icons.play_arrow_rounded)),
//       ),
//       body: Container(
//         height: MediaQuery.of(context).size.height,
//         width: MediaQuery.of(context).size.width,
//         decoration: AppStyles.blackEmptyBoxDecor,
//         child: SizedBox(
//           height: MediaQuery.of(context).size.height,
//           child: VideoPlayer(widget.video.videoPlayerController),
//         ),
//       ),
//     );
//   }
// }
