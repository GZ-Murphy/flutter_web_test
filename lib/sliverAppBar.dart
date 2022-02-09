import 'package:flutter/material.dart';

class SliverAppBarExample extends StatelessWidget {
  const SliverAppBarExample({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      SliverAppBar(
        pinned: true,
        expandedHeight: 200,
        flexibleSpace: FlexibleSpaceBar(
          title: const Text("SliverAppBar"),
          background: Image.asset("images/wild_chicken.png", fit: BoxFit.cover),
        ),
      ),
      SliverFixedExtentList(
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return Container(
              alignment: Alignment.center,
              color: Colors.primaries[index % Colors.primaries.length],
              child: Text("$index"),
            );
          },
        ),
        itemExtent: 50.0,
      ),
    ]);
  }
}
