import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:video_player/video_player.dart';

import '../values/urls.dart';

part 'video_store.g.dart';

class VideoStore = _VideoStore with _$VideoStore;

abstract class _VideoStore with Store {
  @observable
  VideoPlayerController? videoPlayerController;

  @observable
  bool isPlaying = false;

  @action
  void initializeVideoPlayer(url, index) {
    videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(url));
    log(index.toString(), name: "INDEX OF INITIAL REELS");
    if (index == 2) {
      videoPlayerController?.initialize().then((_) {
        videoPlayerController?.play();
        videoPlayerController?.setLooping(true);
      });
    } else {
      videoPlayerController?.initialize().then((_) {
        videoPlayerController?.pause();
        videoPlayerController?.setLooping(true);
      });
    }
  }

  @action
  void changePauseResume() {
    isPlaying = !isPlaying;

    if (isPlaying) {
      videoPlayerController?.play();
    } else {
      videoPlayerController?.pause();
    }
    debugPrint("${videoPlayerController?.value.isPlaying}");
  }

  @action
  void checkIndexIsReels(int index) {
    debugPrint("called again checkIndexIsReels");
    debugPrint("checked $index");
    debugPrint("is playing: ${videoPlayerController?.value.isPlaying}");
    if (index != 2) {
      videoPlayerController?.pause();
    } else {
      videoPlayerController?.play();
    }
  }
}
