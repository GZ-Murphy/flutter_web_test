import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class MyChangeNotifier extends ChangeNotifier {
  int _counter = 0;

  int get counter => _counter;

  incrementCounter() {
    _counter++;

    notifyListeners(); //要更新UI记得调用这个方法
  }
}

class SharedMyChangeNotifierPage extends StatelessWidget {
  final String title;

  const SharedMyChangeNotifierPage({Key? key, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyChangeNotifier notifier =
        Provider.of(context); //通过Provider.of(context)获取MyChangeNotifier

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${context.watch<MyChangeNotifier>().counter}',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: notifier.incrementCounter, //点击时我们期望输出点击次数

        tooltip: 'Increment',

        child: const Icon(Icons.add),
      ),
    );
  }
}
