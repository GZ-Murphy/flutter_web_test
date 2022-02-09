import 'package:flutter/material.dart';

class SliverToBoxAdapterExample extends StatelessWidget {
  const SliverToBoxAdapterExample({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      SliverToBoxAdapter(
        child: Container(
          height: 200,
          color: Colors.black26,
          alignment: Alignment.center,
          child: Text("hello world"),
        ),
      ),
      SliverList(
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return Container(
              height: 60,
              color: Colors.primaries[index % Colors.primaries.length],
            );
          },
          childCount: 50,
        ),
      ),
    ]);
  }
}
