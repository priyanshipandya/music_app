import 'dart:developer';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider_practical_7/values/urls.dart';
import '../../modal/all_data.dart';
import 'package:just_audio/just_audio.dart';

class MusicPage extends StatefulWidget {
  const MusicPage({Key? key, required this.data, required this.itemIndex})
      : super(key: key);
  final AllData? data;
  final int itemIndex;

  @override
  State<MusicPage> createState() => _MusicPageState();
}

class _MusicPageState extends State<MusicPage> {
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
    debugPrint(widget.data?.items[widget.itemIndex].songUrl);
    await audioPlayer.setAudioSource(
      AudioSource.uri(
        Uri.parse(
          Urls.audioUrl,
        ),
      ),
    );
    await audioPlayer.play();
    log("audio play is playing", name: "AUDIO PLAYER PLAYING");
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
                        'asset/icons/arrow_down.png',
                        height: 20,
                        width: 20,
                      ),
                    ),
                    const Text(
                      "Playing from Favourites",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Image.asset(
                      'asset/icons/more.png',
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
                                  "${widget.data?.items[widget.itemIndex].songName}",
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
                                    itemCount: widget
                                        .data
                                        ?.items[widget.itemIndex]
                                        .artists
                                        ?.length,
                                    itemBuilder: (context, i) => Text(
                                      "${widget.data?.items[widget.itemIndex].artists?[i].name} ",
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
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                                widget.data?.items[widget.itemIndex].isFav ??
                                        false
                                    ? Icons.favorite
                                    : Icons.favorite_border),
                          ),
                        ],
                      ),
                    ),
                    const Row(
                      children: [
                        Text("0.0"),
                        Spacer(),
                        Text("4.04"),
                      ],
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
                            'asset/icons/shuffle.png',
                            height: 20,
                            width: 20,
                          ),
                          Image.asset(
                            'asset/icons/previous.png',
                            height: 25,
                            width: 25,
                          ),
                          GestureDetector(
                            onTap: changePlayPause,
                            child: _isPlaying == true
                                ? Image.asset(
                                    'asset/icons/pause.png',
                                    height: 25,
                                    width: 25,
                                  )
                                : Image.asset(
                                    'asset/icons/play.png',
                                    height: 25,
                                    width: 25,
                                  ),
                          ),
                          Image.asset(
                            'asset/icons/next.png',
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
}
