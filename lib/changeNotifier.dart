import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'sharedChangeNotifier.dart';

class MyChangeNotifierPage extends StatelessWidget {
  final String title;

  const MyChangeNotifierPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MyChangeNotifier notifier = MyChangeNotifier();
    return ChangeNotifierProvider(
        create: (_) => notifier,
        child: Scaffold(
          appBar: AppBar(
            title: Text(title),
          ),
          body: Consumer<MyChangeNotifier>(
              builder: (bodyContext, localNotifier, widget) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                    '${localNotifier.counter}',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ],
              ),
            );
          }),
          floatingActionButton: FloatingActionButton(
            onPressed: notifier.incrementCounter, //点击时我们期望输出点击次数
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ));
  }
}
