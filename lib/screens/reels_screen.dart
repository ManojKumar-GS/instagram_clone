import 'package:androidstudio_project/utils/common_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ReelsScreen extends StatefulWidget {
  const ReelsScreen({super.key});

  @override
  State<ReelsScreen> createState() => _ReelsScreenState();
}

class _ReelsScreenState extends State<ReelsScreen> {
  bool isSaved = false;
  bool isLiked = false;
  int likes = 1000;
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      maintainBottomViewPadding: false,
      bottom: true,
      child: Scaffold(
        body: PageView(
            pageSnapping: true,
            padEnds: true,
            controller: _pageController,
            children: [
              ListView.builder(
                  itemCount: 3,
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(top: 10, bottom: 50),
                  itemBuilder: (BuildContext context, int index) {
                    return Stack(
                      children: [
                        Image.asset(
                          "assets/image-1.jpg",
                          fit: BoxFit.cover,
                          height: MediaQuery.of(context).size.height,
                        ),
                        Positioned(
                          right: 10,
                          top: 10,
                          child: IconButton(
                              onPressed: () {},
                              icon: const Icon(CupertinoIcons.camera)),
                        ),
                        Positioned(
                          bottom: 120,
                          left: 10,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  const GetStories(
                                    imageName: "assets/image-1.jpg",
                                  ),
                                  const Text(
                                    'username',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w900),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          border: Border.all()),
                                      child: const Text("Follow"),
                                    ),
                                  )
                                ],
                              ),
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Icon(
                                      CupertinoIcons.music_note_2,
                                      size: 15,
                                    ),
                                    Text('song name'),
                                    SizedBox(width: 5),
                                    Icon(
                                      CupertinoIcons.gift_fill,
                                      size: 15,
                                    ),
                                    Text("Send gift")
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Positioned(
                            right: 10,
                            bottom: 120,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        isLiked ? likes-- : likes++;
                                        isLiked = !isLiked;
                                      });
                                    },
                                    icon: isLiked
                                        ? const Icon(
                                            CupertinoIcons.heart_fill,
                                            color: Colors.red,
                                          )
                                        : const Icon(
                                            CupertinoIcons.heart,
                                            size: 35,
                                          )),
                                IconButton(
                                    onPressed: () {
                                      showModalBottomSheet<void>(
                                        useSafeArea: true,
                                        isScrollControlled: true,
                                        context: context,
                                        builder: (BuildContext context) {
                                          return SingleChildScrollView(
                                            scrollDirection: Axis.vertical,
                                            child: Center(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  const Padding(
                                                    padding:
                                                        EdgeInsets.all(8.0),
                                                    child: Text("Comments",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w900,
                                                            fontSize: 20)),
                                                  ),
                                                  ListView.builder(
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    shrinkWrap: true,
                                                    itemCount: 20,
                                                    itemBuilder:
                                                        (context, index) {
                                                      return ListTile(
                                                        title: const Text(
                                                            "UserName",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w900)),
                                                        leading: CircleAvatar(
                                                            radius: 30,
                                                            child: ClipOval(
                                                              child: Image.asset(
                                                                  fit: BoxFit
                                                                      .fill,
                                                                  "assets/image-4.jpg"),
                                                            )),
                                                        subtitle: const Text(
                                                            "Comments here"),
                                                        trailing: IconButton(
                                                            onPressed: () {},
                                                            icon: const Icon(
                                                                CupertinoIcons
                                                                    .heart)),
                                                      );
                                                    },
                                                  )
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    icon: const Icon(
                                      Icons.messenger_outline,
                                      size: 35,
                                    )),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      CupertinoIcons.rocket,
                                      size: 35,
                                    )),
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        isSaved = !isSaved;
                                      });
                                    },
                                    icon: const Icon(
                                      Icons.more_vert,
                                      size: 35,
                                    ))
                              ],
                            )),
                      ],
                    );
                  }),
            ]),
      ),
    );
  }
}
