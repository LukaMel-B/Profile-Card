import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instagram/main.dart';
import 'package:instagram/widgets/home_widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 10,
            ),
            child: Column(
              children: [
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 20, right: 15),
                  title: Text(
                    'Instagram',
                    style: GoogleFonts.grandHotel(
                        color: Colors.black,
                        fontSize: 40,
                        fontWeight: FontWeight.w500),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/images/heart.png',
                        height: 34,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                        onDoubleTap: () async {
                          await storeClass.store!.setBool('isLogin', false);
                          Navigator.of(context).pop();
                        },
                        child: const Icon(
                          CupertinoIcons.power,
                          size: 33,
                        ),
                      )
                    ],
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: SizedBox(
                      height: 90,
                      child: ListView.separated(
                        shrinkWrap: true,
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            width: 10,
                          );
                        },
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          Random random = Random();

                          return Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              StoryImage(
                                image: (index == 0)
                                    ? 'assets/images/dp.png'
                                    : 'assets/images/${random.nextInt(3)}.png',
                                index: index,
                              ),
                              Text(
                                (index == 0) ? 'Your Story' : 'salim.faal..',
                                style: GoogleFonts.nunito(
                                    fontWeight: FontWeight.w600,
                                    color: (index == 0)
                                        ? Colors.grey[500]
                                        : Colors.black87,
                                    fontSize: 12),
                              )
                            ],
                          );
                        },
                        itemCount: 7,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Divider(
                  color: Colors.grey[300],
                  thickness: .5,
                ),
                ListTile(
                  visualDensity: VisualDensity.compact,
                  leading: const CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage('assets/images/dp.png'),
                  ),
                  title: Text(
                    'lil_wyatt838',
                    style: GoogleFonts.heebo(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        letterSpacing: -.3,
                        fontSize: 17),
                  ),
                  trailing: Image.asset(
                    'assets/images/dot.png',
                    width: 30,
                  ),
                ),
                Stack(
                  children: [
                    Image.asset(
                      'assets/images/post.png',
                      height: 390,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Wrap(
                        alignment: WrapAlignment.center,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        spacing: 10,
                        runSpacing: 10,
                        children: [
                          Image.asset(
                            'assets/images/heart.png',
                            height: 30,
                          ),
                          Image.asset(
                            'assets/images/comment.png',
                            height: 33,
                          ),
                          Image.asset(
                            'assets/images/send.png',
                            height: 28,
                          )
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 80.0),
                        child: DotWidget(),
                      ),
                      Image.asset(
                        'assets/images/save.png',
                        height: 31,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 15,
                    ),
                    const CommentProfiles(),
                    const SizedBox(
                      width: 6,
                    ),
                    Text.rich(
                      textAlign: TextAlign.start,
                      TextSpan(
                        text: 'Liked by ',
                        // text: 'Supported Image (Optional)',
                        style: GoogleFonts.heebo(
                            fontWeight: FontWeight.w300,
                            color: Colors.black,
                            letterSpacing: -.3,
                            fontSize: 16),

                        children: <InlineSpan>[
                          TextSpan(
                            text: ' jiho100x',
                            style: GoogleFonts.heebo(
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                                letterSpacing: -.3,
                                fontSize: 16),
                          ),
                          TextSpan(
                            text: ' and',
                            style: GoogleFonts.heebo(
                                fontWeight: FontWeight.w300,
                                color: Colors.black,
                                letterSpacing: -.3,
                                fontSize: 16),
                          ),
                          TextSpan(
                            text: ' 35 others',
                            style: GoogleFonts.heebo(
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                                letterSpacing: -.3,
                                fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text.rich(
                        textAlign: TextAlign.start,
                        TextSpan(
                          text: 'alex.anyways18',
                          // text: 'Supported Image (Optional)',
                          style: GoogleFonts.heebo(
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              letterSpacing: -.3,
                              fontSize: 18),

                          children: <InlineSpan>[
                            TextSpan(
                              text: '  Good times. Great vibes',
                              style: GoogleFonts.heebo(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                  letterSpacing: -.3,
                                  fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Divider(
              color: Colors.grey[400],
              thickness: .5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(
                  'assets/images/home.png',
                  height: 38,
                ),
                Image.asset(
                  'assets/images/search.png',
                  height: 40,
                ),
                Image.asset(
                  'assets/images/add.png',
                  height: 38,
                ),
                Image.asset(
                  'assets/images/reels.png',
                  height: 38,
                ),
                Image.asset(
                  'assets/images/profile.png',
                  height: 38,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
