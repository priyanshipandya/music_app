import 'package:flutter/material.dart';
import '../../values/app_styles.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool switchValue = false;
  List infoList = ["Personal Info", "Password & Security", "App Theme"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  margin: const EdgeInsets.all(10),
                  height: MediaQuery.of(context).size.height * 0.45,
                  width: MediaQuery.of(context).size.width,
                  decoration: AppStyles.emptyBoxDecor,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child:
                        Image.asset("asset/images/user.jpeg", fit: BoxFit.fill),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 10, 25, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Welcome, Priyanshi Pandya",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  const SizedBox(height: 40),
                  Row(
                    children: [
                      Image.asset(
                        "asset/images/account.png",
                        height: 30,
                        width: 30,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "Account",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
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
              itemBuilder: (context, index) => Card(
                margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      Text(
                        "${infoList[index]}",
                        style: AppStyles.boldMediumTextStyle,
                        // overflow: TextOverflow.ellipsis,
                      ),
                      const Spacer(),
                      IconButton(
                        icon: const Icon(Icons.arrow_forward_ios, size: 20),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
