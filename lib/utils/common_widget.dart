import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommonWidget {
  CommonWidget._();
  static final instance = CommonWidget._();

  Widget getStories(
      {bool? isUser, String? name, String? imageName, bool? isStory}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor:
                isUser ?? false ? Colors.transparent : Colors.purpleAccent,
            radius: isStory ?? false ? 50 : 20,
            child: Stack(children: [
              ClipOval(
                  child: Image.asset(
                      width: isUser ?? false ? 100 : 90,
                      height: isUser ?? false ? 100 : 90,
                      imageName ?? "assets/",
                      fit: BoxFit.fill)),
              isUser ?? false
                  ? Align(
                      alignment: Alignment.bottomRight,
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            size: 30,
                            Icons.add_circle,
                            color: Colors.blueGrey,
                          )),
                    )
                  : const SizedBox()
            ]),
          ),
          isStory ?? false ? Text(name ?? "") : const SizedBox()
        ],
      ),
    );
  }

  Widget getPost(
      {required String name,
      String? location,
      String? song,
      required String image}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
            children: [
              instance.getStories(name: "", imageName: image, isStory: false),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name),
                  Text(location ?? song ?? ""),
                ],
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(right: 12.0),
            child:
                IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
          )
        ]),
        Image.asset(image),
        Row(
          children: [
            IconButton(
                onPressed: () {}, icon: const Icon(CupertinoIcons.heart)),
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.messenger_outline)),
            IconButton(
                onPressed: () {}, icon: const Icon(CupertinoIcons.rocket)),
            const SizedBox(width: 210),
            IconButton(onPressed: () {}, icon: const Icon(Icons.save))
          ],
        ),
        const Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Text(
            "1000 likes",
            style: TextStyle(fontWeight: FontWeight.w900),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Row(
            children: [
              Text(
                name,
                style: const TextStyle(fontWeight: FontWeight.w900),
              ),
              const SizedBox(width: 10),
              const Text(
                "Comments here ",
                style: TextStyle(fontWeight: FontWeight.normal),
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 8.0, bottom: 10),
          child: Text(
            "view all 700 comments",
            style: TextStyle(fontWeight: FontWeight.w300),
          ),
        ),
      ],
    );
  }
}
