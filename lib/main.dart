import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Paralelo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Paralelo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController _controller = PageController(
    initialPage: 1,
  );

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: new LayoutBuilder(
            builder: (BuildContext safeContext, BoxConstraints constraints) {
          double height = MediaQuery.of(safeContext).size.height;
          // constraints variable has the size info
          return PageView(
            controller: _controller,
            children: [
              Container(color: Colors.red, child: Text("Hello World")),
              Container(
                  color: Colors.blue,
                  child: GridView.count(
                    crossAxisCount: 5,
                    children: List.generate(500, (index) {
                      return Container(
                        height: height / 100,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            border: Border.all(color: Colors.blueAccent)),
                        alignment: Alignment.center,
                        child: Text('A'),
                      );
                    }),
                  )),
              Container(
                color: Colors.green,
                child: Text("Hello 2"),
              ),
              Container(
                color: Colors.pink,
                child: Text("Hello 3"),
              ),
              Container(
                color: Colors.grey,
                padding: EdgeInsets.all(10),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text("My Profile"),
                      Text("My Friends"),
                      Text("Search"),
                      Text("Explore"),
                      Text("My Settings"),
                      Text("Log Out"),
                    ],
                  ),
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}
