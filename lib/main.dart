import 'package:flutter/material.dart';

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
                  pinned: true,
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
            body: Container(
              color: Colors.green,
            ),
          ),
        ),
      ),
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