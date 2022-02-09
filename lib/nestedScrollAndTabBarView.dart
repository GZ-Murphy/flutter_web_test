import 'package:flutter/material.dart';

class NestedScrollAndTabBarView extends StatefulWidget {
  late List<String> tabs;

  NestedScrollAndTabBarView({Key? key, required this.tabs}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return NestedScrollAndTabBarState();
  }
}

class NestedScrollAndTabBarState extends State<NestedScrollAndTabBarView>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  SliverList buildSliverList(int number) => SliverList(
          delegate:
              SliverChildBuilderDelegate((BuildContext context, int index) {
        return Container(
          height: 60,
          color: Colors.primaries[index % Colors.primaries.length],
        );
      }, childCount: number));

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: widget.tabs.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          SliverOverlapAbsorber(
            handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            sliver: SliverAppBar(
              title: const Text("hi Flutter"),
              floating: true,
              snap: true,
              forceElevated: innerBoxIsScrolled,
              bottom: TabBar(
                controller: _controller,
                tabs: widget.tabs.map((e) => Tab(text: e)).toList(),
              ),
            ),
          ),
        ];
      },
      body: TabBarView(
        controller: _controller,
        children: widget.tabs.map((e) {
          return Builder(builder: (BuildContext context) {
            return CustomScrollView(
              key: PageStorageKey(e),
              slivers: [
                SliverOverlapInjector(
                  handle:
                      NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                ),
                SliverPadding(
                  padding: const EdgeInsets.all(9),
                  sliver: buildSliverList(50),
                ),
              ],
            );
          });
        }).toList(),
      ),
    );
  }
}
