import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../../api/api_service/fetch_data.dart';
import '../../../values/app_styles.dart';

class ShimmerHomePageCards extends StatelessWidget {
  ShimmerHomePageCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.white,
      highlightColor: Colors.grey,
      // loop: 0,
      direction: ShimmerDirection.ltr,
      child: SizedBox(
        height: 270,
        child: ListView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: 3,
          itemBuilder: (context, i) {
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(10),
                      height: 150,
                      width: 180,
                      decoration: AppStyles.emptyBoxDecor,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
