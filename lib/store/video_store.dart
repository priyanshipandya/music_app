import 'package:mobx/mobx.dart';
import 'package:video_player/video_player.dart';
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
    if (isPlaying) {
      videoPlayerController?.pause();
    } else {
      videoPlayerController?.play();
    }
    isPlaying = !isPlaying;
  }

}
