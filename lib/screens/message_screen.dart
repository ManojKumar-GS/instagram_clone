import 'package:androidstudio_project/model/user_model.dart';
import 'package:androidstudio_project/utils/common_widget.dart';
import 'package:flutter/material.dart';

class MessageScreen extends StatefulWidget {
  final List<UserModel> user;
  const MessageScreen({super.key, required this.user});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onPanUpdate: (details) {
          if (details.delta.dx > 0) {
            Navigator.of(context).pop();
          }
        },
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: false,
              snap: false,
              pinned: true,
              backgroundColor: Colors.white,
              expandedHeight: 50,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: const EdgeInsets.only(left: 60, bottom: 15),
                title: Text(
                  widget.user[0].name ?? "",
                  style: const TextStyle(color: Colors.black),
                ),
              ),
              actions: [
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.edit_calendar))
              ],
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  textAlignVertical: TextAlignVertical.center,
                  controller: textEditingController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    prefixIcon: const Icon(Icons.search),
                    hintText: 'Search',
                    border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.amber, width: 4),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 140,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.user.length,
                  itemBuilder: (context, index) {
                    return Stack(children: [
                      GetStories(
                        isUser: widget.user[index].isUser,
                        name: widget.user[index].name,
                        imageName: widget.user[index].image,
                        isStory: true,
                      ),
                      Positioned(
                        left: 25,
                        child: Container(
                            height: 30,
                            width: 60,
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Colors.grey),
                            child: const Center(child: Text("song"))),
                      )
                    ]);
                  },
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 15.0),
                    child: Text("Messages"),
                  ),
                  const Spacer(),
                  TextButton(
                      onPressed: () {},
                      child: const Text("Requests",
                          style: TextStyle(color: Colors.blue)))
                ],
              ),
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate(
                    childCount: widget.user.length, (context, index) {
              return ListTile(
                title: Text(widget.user[index].name ?? "Instagram User",
                    style: const TextStyle(fontWeight: FontWeight.w900)),
                leading: CircleAvatar(
                    radius: 30,
                    child: ClipOval(
                      child: Image.asset(
                          height: 60,
                          width: 60,
                          fit: BoxFit.fill,
                          widget.user[index].image ?? "assets/images-2.jpg"),
                    )),
                subtitle: const Text("4+ new messages"),
                trailing: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.camera_alt_outlined)),
              );
            }))
          ],
        ),
      ),
    );
  }
}
