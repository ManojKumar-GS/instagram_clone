import 'package:androidstudio_project/utils/common_widget.dart';
import 'package:androidstudio_project/data/users_data.dart';
import 'package:androidstudio_project/model/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<UserModel> user = [];

  @override
  void initState() {
    for (int i = 0; i < UserData.instance.users.length; i++) {
      user.add(UserModel.fromJson(UserData.instance.users[i]));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            snap: false,
            pinned: false,
            backgroundColor: Colors.white,
            expandedHeight: 50,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: const EdgeInsets.only(top: 40, right: 110),
              title: Image.asset(
                "assets/name_logo_1.png",
                width: 150,
                height: 150,
              ),
            ),
            actions: [
              const Icon(CupertinoIcons.heart),
              const SizedBox(width: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  child: Image.asset("assets/message_icon.png", width: 20),
                ),
              )
            ],
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: user.length,
                itemBuilder: (context, index) {
                  return CommonWidget.instance.getStories(
                      isUser: user[index].isUser,
                      name: user[index].name ?? "",
                      imageName: user[index].image ?? "assets/image-1.jpg",
                      isStory: true);
                },
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(childCount: user.length,
                  (context, index) {
            return CommonWidget.instance.getPost(
                name: user[index].name ?? "",
                image: user[index].image ?? "assets/image-1.jpg",
                song: user[index].song ?? "",
                location: user[index].location ?? "");
          }))
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        iconSize: 32,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_filled, color: Colors.black), label: ""),
          BottomNavigationBarItem(
              icon: Icon(Icons.search_outlined, color: Colors.black),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_box, color: Colors.black), label: ""),
          BottomNavigationBarItem(
              icon: Icon(Icons.movie_outlined, color: Colors.black), label: ""),
          BottomNavigationBarItem(
              icon: Icon(Icons.circle, color: Colors.black), label: ""),
        ],
      ),
    );
  }
}
