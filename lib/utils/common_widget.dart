import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GetPost extends StatefulWidget {
  final String name;
  final String? location;
  final String? song;
  final String image;

  const GetPost(
      {super.key,
      required this.name,
      this.location,
      this.song,
      required this.image});

  @override
  State<GetPost> createState() => _GetPostState();
}

class _GetPostState extends State<GetPost> {
  bool isSaved = false;
  bool isLiked = false;
  int likes = 1000;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
            children: [
              GetStories(name: "", imageName: widget.image, isStory: false),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.name),
                  Text(widget.location ?? widget.song ?? ""),
                ],
              ),
            ],
          ),
          const Spacer(),
          IconButton(
              onPressed: () {
                showModalBottomSheet<void>(
                  enableDrag: true,
                  isScrollControlled: true,
                  context: context,
                  builder: (BuildContext context) {
                    return SizedBox(
                      height: 400,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                circularIcon(
                                    name: "save",
                                    icon: Icons.bookmark_border,
                                    onTap: () {}),
                                circularIcon(
                                    name: "QR code",
                                    icon: Icons.qr_code_scanner_outlined,
                                    onTap: () {}),
                              ],
                            ),
                            const Divider(),
                            iconText(
                                icon: Icons.star, text: "Add to favorites"),
                            iconText(
                                icon: Icons.person_remove_outlined,
                                text: "Unfollow"),
                            const Divider(),
                            iconText(
                                icon: Icons.closed_caption,
                                text: "Manage captions"),
                            iconText(
                                icon: Icons.info_outline,
                                text: "Why you're seeing this post"),
                            iconText(icon: Icons.hide_source, text: "Hide"),
                            iconText(
                                icon: Icons.person_outline,
                                text: "About this account"),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              icon: const Icon(Icons.more_vert))
        ]),
        GestureDetector(
            onDoubleTap: () {
              setState(() {
                isLiked ? likes-- : likes++;
                isLiked = !isLiked;
              });
            },
            child: Image.asset(widget.image)),
        Row(
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
                    : const Icon(CupertinoIcons.heart)),
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text("Comments",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 20)),
                              ),
                              ListView.builder(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemCount: 20,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    title: const Text("UserName",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w900)),
                                    leading: CircleAvatar(
                                        radius: 30,
                                        child: ClipOval(
                                          child: Image.asset(
                                              height: 60,
                                              width: 60,
                                              fit: BoxFit.fill,
                                              "assets/images-2.jpg"),
                                        )),
                                    subtitle: const Text("Comments here"),
                                    trailing: IconButton(
                                        onPressed: () {},
                                        icon: const Icon(CupertinoIcons.heart)),
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
                icon: const Icon(Icons.messenger_outline)),
            IconButton(
                onPressed: () {}, icon: const Icon(CupertinoIcons.rocket)),
            const Spacer(),
            IconButton(
                onPressed: () {
                  setState(() {
                    isSaved = !isSaved;
                  });
                },
                icon: isSaved
                    ? const Icon(Icons.bookmark)
                    : const Icon(Icons.bookmark_border))
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            "$likes likes",
            style: const TextStyle(fontWeight: FontWeight.w900),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Row(
            children: [
              Text(
                widget.name,
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

  Widget iconText({required IconData icon, required String text}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [Icon(icon), const SizedBox(width: 20), Text(text)],
      ),
    );
  }

  Widget circularIcon(
      {required String name, required IconData icon, required Function onTap}) {
    return Column(
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.transparent,
              border: Border.all(color: Colors.black)),
          child: IconButton(onPressed: () => onTap, icon: Icon(icon)),
        ),
        Text(name)
      ],
    );
  }
}

class GetStories extends StatefulWidget {
  final bool? isUser;
  final String? name;
  final String? imageName;
  final bool? isStory;
  const GetStories({
    super.key,
    this.isUser,
    this.name,
    this.imageName,
    this.isStory,
  });

  @override
  State<GetStories> createState() => _GetStoriesState();
}

class _GetStoriesState extends State<GetStories> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: widget.isUser ?? false
                ? Colors.transparent
                : Colors.purpleAccent,
            radius: widget.isStory ?? false ? 50 : 20,
            child: Stack(children: [
              ClipOval(
                  child: Image.asset(
                      width: widget.isUser ?? false ? 100 : 90,
                      height: widget.isUser ?? false ? 100 : 90,
                      widget.imageName ?? "assets/",
                      fit: BoxFit.fill)),
              widget.isUser ?? false
                  ? Align(
                      alignment: Alignment.bottomRight,
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            size: 30,
                            Icons.add_circle,
                            color: Colors.white,
                          )),
                    )
                  : const SizedBox()
            ]),
          ),
          widget.isStory ?? false ? Text(widget.name ?? "") : const SizedBox()
        ],
      ),
    );
  }
}
