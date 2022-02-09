import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'sliverListAndGrid.dart';
import 'sliverAppBar.dart';
import 'sliverPersistentHeader.dart';
import 'sliverToBoxAdapter.dart';
import 'nestedScrollAndListView.dart';
import 'nestedScrollAndCustomScrollView.dart';
import 'nestedScrollAndTabBarView.dart';
import 'sharedChangeNotifier.dart';
import 'sharedChangeNotifier_copy.dart';
import 'changeNotifier.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => MyChangeNotifier()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => const RouterList(),
        '/SliverListAndSliverGrid': (BuildContext context) =>
            const SliverListAndSliverGridExample(),
        '/SliverAppBar': (BuildContext context) => const SliverAppBarExample(),
        '/SliverToBoxAdapter': (BuildContext context) =>
            const SliverToBoxAdapterExample(),
        '/SliverPersistentHeader': (BuildContext context) =>
            const SliverPersistentHeaderExample(),
        '/NestedScrollAndListView': (BuildContext context) =>
            const NestedScrollAndListView(),
        '/NestedScrollAndCusScrollView': (BuildContext context) =>
            const NestedScrollAndCustomScrollView(),
        '/NestedScrollAndTabBarView': (BuildContext context) =>
            NestedScrollAndTabBarView(
                tabs: const ['One', 'Two', 'Three', 'Four']),
        '/SharedChangeNotifierProvider': (BuildContext context) =>
            const SharedMyChangeNotifierPage(
                title: 'Shared Change Notifier Provider'),
        '/SharedChangeNotifierProviderCopy': (BuildContext context) =>
            const SharedMyChangeNotifierCopy(
                title: 'Shared Change Notifier Provider Copy'),
        '/ChangeNotifierProvider': (BuildContext context) =>
            const MyChangeNotifierPage(
                title: 'Single Change Notifier Provider'),
      },
    );
  }
}

class ExampleItem {
  String title = '';
  String route = '';
  IconData icon = Icons.circle;
  ExampleItem({required this.title, required this.route, required this.icon});
  // {
  //   this.icon =icon;
  // };
}

class RouterList extends StatelessWidget {
  const RouterList({Key? key}) : super(key: key);
  static List examples = List.from([
    ExampleItem(
        title: 'SliverList & SliverGrid',
        route: '/SliverListAndSliverGrid',
        icon: Icons.list),
    ExampleItem(
        title: 'SliverAppBar', route: '/SliverAppBar', icon: Icons.list),
    ExampleItem(
        title: 'SliverPersistentHeader',
        route: '/SliverPersistentHeader',
        icon: Icons.list),
    ExampleItem(
        title: 'SliverToBoxAdapter',
        route: '/SliverToBoxAdapter',
        icon: Icons.list),
    ExampleItem(
        title: 'ListView & NestedScrollView',
        route: '/NestedScrollAndListView',
        icon: Icons.list),
    ExampleItem(
        title: 'CustomScrollView & NestedScrollView',
        route: '/NestedScrollAndCusScrollView',
        icon: Icons.list),
    ExampleItem(
        title: 'TabBarView & NestedScrollView',
        route: '/NestedScrollAndTabBarView',
        icon: Icons.list),
    ExampleItem(
        title: 'Shared Change Notifier Provider',
        route: '/SharedChangeNotifierProvider',
        icon: Icons.data_saver_on),
    ExampleItem(
        title: 'Shared Change Notifier Provider Copy',
        route: '/SharedChangeNotifierProviderCopy',
        icon: Icons.data_saver_on),
    ExampleItem(
        title: 'Single Change Notifier Provider',
        route: '/ChangeNotifierProvider',
        icon: Icons.data_saver_on),
  ]);
  Widget buildListItem(ExampleItem itemData, BuildContext context) {
    return GestureDetector(
        child: Card(
            color: Colors.white,
            margin: EdgeInsets.only(bottom: 20),
            child: ListTile(
              title: Text(itemData.title),
              leading: Icon(
                itemData.icon,
                size: 40,
              ),
            )),
        onTap: () => Navigator.pushNamed(context, itemData.route));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[50],
        appBar: AppBar(
          title: Text('Flutter Demo'),
        ),
        body: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(20),
            children:
                examples.map((item) => buildListItem(item, context)).toList()));
  }
}
