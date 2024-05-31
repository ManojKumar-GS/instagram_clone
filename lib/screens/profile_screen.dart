import 'dart:math';

import 'package:androidstudio_project/utils/common_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Icon(CupertinoIcons.lock),
                ),
                const Text("username", style: TextStyle(fontSize: 25)),
                const Spacer(),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      CupertinoIcons.at,
                      size: 25,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.add_box_outlined,
                      size: 25,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      CupertinoIcons.line_horizontal_3,
                      size: 25,
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const GetStories(
                    imageName: "assets/image-3.jpg",
                    isStory: true,
                    name: "username",
                    isUser: true),
                followersDetail(10, "posts"),
                followersDetail(1000, "followers"),
                followersDetail(100, "following"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                getContainer(const Text("Edit profile"), 170),
                getContainer(const Text("Share profile"), 170),
                getContainer(const Icon(Icons.person_add), 50),
              ],
            ),
            SizedBox(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return const GetStories(
                    name: "highlights",
                    isStory: true,
                    imageName: "assets/image-4.jpg",
                  );
                },
              ),
            ),
            TabBar(
                indicatorSize: TabBarIndicatorSize.tab,
                controller: _tabController,
                tabs: const [
                  Tab(icon: Icon(Icons.grid_on_sharp)),
                  Tab(icon: Icon(Icons.movie)),
                  Tab(icon: Icon(Icons.perm_contact_calendar_outlined))
                ]),
            Expanded(
              child: TabBarView(controller: _tabController, children: [
                GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    var random = Random();
                    int randomNumber = random.nextInt(6) + 1;
                    return Image.asset(
                      "assets/image-$randomNumber.jpg",
                      fit: BoxFit.fill,
                    );
                  },
                ),
                const Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Column(
                    children: [
                      Text("Share a moment with the world",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                      Text("Create your first reel",
                          style: TextStyle(color: Colors.blueAccent)),
                    ],
                  ),
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text("No, Tagged Post Yet",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                    ),
                    Icon(
                      Icons.perm_contact_calendar_outlined,
                      size: 50,
                    )
                  ],
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }

  Widget followersDetail(int value, String text) {
    return InkResponse(
      highlightShape: BoxShape.rectangle,
      containedInkWell: true,
      onTap: () {},
      child: SizedBox(
        height: 80,
        width: 80,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$value',
                style:
                    const TextStyle(fontWeight: FontWeight.w900, fontSize: 20)),
            Text(text)
          ],
        ),
      ),
    );
  }

  Widget getContainer(Widget widget, double width) {
    return InkResponse(
      containedInkWell: true,
      highlightShape: BoxShape.rectangle,
      borderRadius: BorderRadius.circular(10),
      onTap: () {},
      child: Container(
        width: width,
        height: 30,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), border: Border.all()),
        child: Center(child: widget),
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
