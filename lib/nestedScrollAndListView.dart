import 'package:flutter/material.dart';

class NestedScrollAndListView extends StatelessWidget {
  const NestedScrollAndListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      //Sliver组件
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          SliverAppBar(
            title: const Text("嵌套ListView"),
            pinned: true, //固定AppBar
            forceElevated: true,
          ),
          SliverFixedExtentList(
            itemExtent: 50,
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                //return ListTile(title: Text("$index"));
                return Text("$index");
              },
              childCount: 5,
            ),
          ),
        ];
      },
      //滚动组件
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        physics: const ClampingScrollPhysics(), //需要
        itemCount: 30,
        itemBuilder: (BuildContext context, int index) {
          return SizedBox(
            height: 50,
            child: Center(child: Text("item $index")),
          );
        },
      ),
    );
  }
}
