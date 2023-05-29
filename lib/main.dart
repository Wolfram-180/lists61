import 'package:flutter/material.dart';
import 'dart:io' show Platform;

void main() {
  runApp(const MyApp());
}

const title = 'Flutter Lists Demo';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: title),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> _titles = ['One', 'Two', 'Three'];

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: DefaultTabController(
          length: _titles.length,
          child: NestedScrollView(
            headerSliverBuilder: ((context, innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  title: const Text('Sliver App Bar'),
                  pinned: false,
                  expandedHeight: 150,
                  bottom: TabBar(
                      tabs: _titles
                          .map((String item) => Tab(
                                text: item,
                              ))
                          .toList()),
                ),
              ];
            }),
            body: TabBarView(
              children: [
                for (String item in _titles)
                  OverscrollGlowAbsorber(
                    child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            _scrollController.animateTo(
                              1000,
                              duration: Duration(
                                seconds: 5,
                              ),
                              curve: Curves.linear,
                            );
                          },
                          child: Text('Вниз'),
                        ),
                        Flexible(
                          child: CustomScrollView(
                            controller: _scrollController,
                            physics: Platform.isAndroid
                                ? const ClampingScrollPhysics()
                                : const BouncingScrollPhysics(),
                            slivers: [
                              SliverList(
                                delegate: SliverChildBuilderDelegate(
                                  (BuildContext context, int index) {
                                    return ListTile(
                                      title: Text('Item $index'),
                                    );
                                  },
                                  childCount: 30,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OverscrollGlowAbsorber extends StatelessWidget {
  final Widget child;
  const OverscrollGlowAbsorber({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      child: child,
      onNotification: (notification) {
        if (notification is OverscrollIndicatorNotification) {
          notification.disallowIndicator();
        }
        return false;
      },
    );
  }
}

      /*
      body: GridView.count(
        crossAxisCount: 3,
          children: [
          Container(
            color: Colors.red,
            height: 200,
            width: 200,
          ),
          Container(
            color: Colors.green,
            height: 200,
            width: 200,
          ),
          Container(
            color: Colors.grey,
            height: 200,
            width: 200,
          ),
          Container(
            color: Colors.yellow,
            height: 200,
            width: 200,
          ),
          Container(
            color: Colors.blue,
            height: 200,
            width: 200,
          ),
          Container(
            color: Colors.pink,
            height: 200,
            width: 200,
          ),
          Container(
            color: Colors.red,
            height: 200,
            width: 200,
          ),
          Container(
            color: Colors.green,
            height: 200,
            width: 200,
          ),
          Container(
            color: Colors.grey,
            height: 200,
            width: 200,
          ),
          Container(
            color: Colors.yellow,
            height: 200,
            width: 200,
          ),
          Container(
            color: Colors.blue,
            height: 200,
            width: 200,
          ),
          Container(
            color: Colors.pink,
            height: 200,
            width: 200,
          ),
        ],
      ),
    );
  }
}
*/