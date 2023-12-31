import 'dart:developer';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider_practical_7/store/fav_store.dart';
import 'package:provider_practical_7/values/urls.dart';
import '../../modal/all_data.dart';
import 'package:just_audio/just_audio.dart';
import '../../values/strings.dart';

class MusicPage extends StatefulWidget {
  const MusicPage(
      {Key? key, this.data, required this.itemIndex, required this.item})
      : super(key: key);
  final AllData? data;
  final int itemIndex;
  final AllItems item;

  @override
  State<MusicPage> createState() => _MusicPageState();
}

class _MusicPageState extends State<MusicPage> {
  FavStore favStore = FavStore();
  double currentValue = 0;
  AudioPlayer audioPlayer = AudioPlayer();
  Duration _duration = const Duration();
  Duration _positioned = const Duration();
  bool _isPlaying = true;

  @override
  void initState() {
    super.initState();
    initializeAudioPlayer();
  }

  void initializeAudioPlayer() async {
    audioPlayer.positionStream.listen((p) {
      try {
        if (context.mounted) {
          setState(() {
            _positioned = p;
          });
        } else {
          audioPlayer.stop();
          return;
        }
      } on Error {
        audioPlayer.stop();
        audioPlayer.dispose();
        return;
      }
    });

    audioPlayer.durationStream.listen((d) {
      if (context.mounted) {
        setState(() {
          _duration = d!;
        });
      } else {
        return;
      }
    });
    await audioPlayer.setAudioSource(
      AudioSource.uri(
        Uri.parse(
          Urls.audioUrl,
        ),
      ),
    );
    await audioPlayer.play();
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(widget.data?.poster ?? Urls.defaultImage),
              fit: BoxFit.cover,
            ),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaY: 100,
              sigmaX: 100,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Image.asset(
                        Urls.arrowDown,
                        height: 20,
                        width: 20,
                      ),
                    ),
                    const Text(
                      Strings.playingFromFavs,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Image.asset(
                      Urls.moreIcon,
                      height: 20,
                      width: 20,
                    ),
                  ],
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.network(widget.data?.poster ?? Urls.defaultImage,
                      height: MediaQuery.of(context).size.height * 0.4,
                      width: MediaQuery.of(context).size.width * 0.85,
                      fit: BoxFit.fill),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.item.songName,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                SizedBox(
                                  height: 20,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    itemCount: widget.item.artists?.length,
                                    itemBuilder: (context, i) => Text(
                                      "${widget.item.artists?[i].name} ",
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          // Spacer(),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        children: [
                          Text(convertToMinutesSeconds(
                              _positioned.inSeconds.toDouble())),
                          const Spacer(),
                          const Text("4.04"),
                        ],
                      ),
                    ),
                    Slider(
                      min: 0,
                      max: _duration.inSeconds.toDouble(),
                      value: _positioned.inSeconds.toDouble(),
                      thumbColor: Colors.black87,
                      activeColor: Colors.black87,
                      inactiveColor: Colors.black12,
                      onChanged: (value) {
                        setState(() {
                          audioPlayer.seek(Duration(seconds: value.toInt()));
                        });
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            Urls.shuffle,
                            height: 20,
                            width: 20,
                          ),
                          Image.asset(
                            Urls.previous,
                            height: 25,
                            width: 25,
                          ),
                          GestureDetector(
                            onTap: changePlayPause,
                            child: _isPlaying == true
                                ? Image.asset(
                                    Urls.pause,
                                    height: 25,
                                    width: 25,
                                  )
                                : Image.asset(
                                    Urls.play,
                                    height: 25,
                                    width: 25,
                                  ),
                          ),
                          Image.asset(
                            Urls.next,
                            height: 25,
                            width: 25,
                          ),
                          Image.asset(
                            'asset/icons/repeat.png',
                            height: 20,
                            width: 20,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox.shrink(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  changePlayPause() {
    if (_isPlaying) {
      audioPlayer.pause();
    } else {
      audioPlayer.play();
    }

    _isPlaying = !_isPlaying;
  }

  String convertToMinutesSeconds(double seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds.toInt() % 60;

    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }
}
