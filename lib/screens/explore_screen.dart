import 'package:flutter/material.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            snap: false,
            pinned: false,
            backgroundColor: Colors.white,
            expandedHeight: 50,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: const EdgeInsets.all(10),
              title: TextField(
                textAlignVertical: TextAlignVertical.center,
                controller: textEditingController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Search',
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.amber, width: 4),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.zero,
            sliver: SliverGrid.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 2, crossAxisSpacing: 2, crossAxisCount: 3),
              itemBuilder: (context, index) {
                return Container(height: 40, width: 40, color: Colors.black);
              },
            ),
          ),
        ],
      )),
    );
  }
}
