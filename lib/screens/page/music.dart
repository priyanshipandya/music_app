import 'dart:ui';

import 'package:flutter/material.dart';
import '../../modal/all_data.dart';

class MusicPage extends StatefulWidget {
  MusicPage({Key? key, required this.data, required this.itemIndex})
      : super(key: key);
  final AllData? data;
  final int itemIndex;

  @override
  State<MusicPage> createState() => _MusicPageState();
}

class _MusicPageState extends State<MusicPage> {
  double currentValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(widget.data?.poster ??
                  "https://jonlieffmd.com/wp-content/uploads/2013/02/Music-vector-Feature-HiRes1-scaled.jpg"),
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
                  child: Image.network(
                      widget.data?.poster ??
                          "https://jonlieffmd.com/wp-content/uploads/2013/02/Music-vector-Feature-HiRes1-scaled.jpg",
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
                                      fontWeight: FontWeight.bold, fontSize: 20),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                SizedBox(
                                  height: 20,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    itemCount: widget.data
                                        ?.items[widget.itemIndex].artists?.length,
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
                    Slider(
                      min: 0,
                      max: widget.data?.items[0].songDurationInMs?.toDouble() ??
                          3,
                      value: currentValue,
                      thumbColor: Colors.black87,
                      activeColor: Colors.black87,
                      inactiveColor: Colors.black12,
                      onChanged: (value) {
                        setState(() {
                          currentValue = value;
                        });
                        print("song duration current : ${currentValue}");
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
                          Image.asset(
                            'asset/icons/play.png',
                            height: 25,
                            width: 25,
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
}
