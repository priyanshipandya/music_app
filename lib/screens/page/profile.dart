import 'package:flutter/material.dart';
import '../../values/app_styles.dart';
import '../../values/strings.dart';
import '../../values/urls.dart';

// ignore: must_be_immutable
class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);

  bool switchValue = false;

  List infoList = [Strings.personalInfo, Strings.pswdAndSecurity, Strings.appTheme];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(onPressed: () {}, ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    height: MediaQuery.of(context).size.width * 0.7,
                    width: MediaQuery.of(context).size.width * 0.7,
                    decoration: AppStyles.emptyBoxDecor,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child:
                          Image.asset(Urls.userImage, fit: BoxFit.fill),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 10, 25, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 40),
                    Row(
                      children: [
                        Image.asset(
                          Urls.accountIcon,
                          height: 30,
                          width: 30,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          Strings.account,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                    const Divider(thickness: 1),
                  ],
                ),
              ),
              ListView.builder(
                padding: const EdgeInsets.all(0),
                primary: false,
                shrinkWrap: true,
                itemCount: infoList.length,
                itemBuilder: (context, index) => Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 15.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.white.withOpacity(0.4),
                            Colors.white.withOpacity(0.4),
                          ],
                          begin: AlignmentDirectional.topStart,
                          end: AlignmentDirectional.bottomEnd,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 12.0),
                        child: Row(
                          children: [
                            Text(
                              "${infoList[index]}",
                              style: AppStyles.mediumTextStyleWhiteLabel,
                              // overflow: TextOverflow.ellipsis,
                            ),
                            const Spacer(),
                            IconButton(
                              icon: const Icon(
                                Icons.arrow_forward_ios,
                                size: 20,
                                color: Colors.white,
                              ),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
