import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../../values/app_styles.dart';
import '../../../values/colors.dart';

class ShimmerHomePageCards extends StatelessWidget {
  const ShimmerHomePageCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: KColors.kLightBlack,
      highlightColor: Colors.grey,
      direction: ShimmerDirection.ltr,
      child: SizedBox(
        height: 220,
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
                      height: 120,
                      width: 150,
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
