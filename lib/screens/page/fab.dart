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
  List reels = [
    "asset/reels/1.mp4",
    "asset/reels/2.mp4",
    "asset/reels/3.mp4",
    "asset/reels/4.mp4",
    "asset/reels/5.mp4",
    "asset/reels/6.mp4",
    // "asset/reels/7.mp4"
  ];

  // @override
  // void initState() {
  //   _videoPlayerController = VideoPlayerController.asset("asset/reels/1.mp4");
  //   _videoPlayerController.initialize().then((_) {
  //     setState(() {
  //       _videoPlayerController.play();
  //       _videoPlayerController.setLooping(true);
  //
  //     });
  //   });
  // setState(() {
  //   _videoPlayerController = VideoPlayerController.asset("asset/reels/1.mp4");
  //   _videoPlayerController.play();
  //   _videoPlayerController.setLooping(true);
  // });
  // super.initState();
  // }

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      // extendBody: true,
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        controller: _pageController,
        itemCount: reels.length,
        itemBuilder: (context, index) {
          return ReelPlayer(videoNo: reels[index]);
        },
      ),
    );
  }

}

class ReelPlayer extends StatefulWidget{
  const ReelPlayer({super.key, this.videoNo});
  final videoNo;


  @override
  State<ReelPlayer> createState() => _ReelPlayerState();
}

class _ReelPlayerState extends State<ReelPlayer>  with WidgetsBindingObserver{
  late VideoPlayerController _videoPlayerController;


  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if(state == AppLifecycleState.resumed){
      _videoPlayerController.play();
    }else {
      _videoPlayerController.pause();
    }
    super.didChangeAppLifecycleState(state);
  }
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    _videoPlayerController = VideoPlayerController.asset(widget.videoNo);
    _videoPlayerController.initialize().then((_) {
      setState(() {
        _videoPlayerController.play();
        _videoPlayerController.setLooping(true);
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.8,
            width: MediaQuery.of(context).size.width,
            decoration: AppStyles.emptyBoxDecor,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.8,
                    child: VideoPlayer(_videoPlayerController),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  changePauseResume() {
    if(_videoPlayerController.pause() == true){
        _videoPlayerController.play();
    }else{
      _videoPlayerController.pause();
    }
  }
}
