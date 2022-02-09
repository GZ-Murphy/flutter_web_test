import 'package:flutter/material.dart';

class NestedScrollAndCustomScrollView extends StatelessWidget {
  const NestedScrollAndCustomScrollView({Key? key}) : super(key: key);
  SliverList buildSliverList(int number) => SliverList(
          delegate:
              SliverChildBuilderDelegate((BuildContext context, int index) {
        return Container(
          height: 60,
          color: Colors.primaries[index % Colors.primaries.length],
        );
      }, childCount: number));

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      //Sliver组件
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: SliverAppBar(
                floating: true,
                snap: true,
                expandedHeight: 200,
                forceElevated: innerBoxIsScrolled,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset(
                    "images/wild_chicken.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ))
        ];
      },
      //滚动组件
      body: Builder(
        builder: (BuildContext context) {
          return CustomScrollView(slivers: [
            SliverOverlapInjector(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            ),
            buildSliverList(50)
          ]);
        },
      ),
    );
  }
}
